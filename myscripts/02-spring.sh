acc=$(aws sts get-caller-identity --query Account --output text)
reg=$(aws configure get region)
cd ~/environment/amazon-vpc-lattice-secure-apis/spring
make sam
cd ~/environment/amazon-vpc-lattice-secure-apis/spring
C_REPO_BASE=${acc}.dkr.ecr.${reg}.amazonaws.com
C_REPO_IMAGE=$(aws ecr describe-repositories --query repositories[].repositoryName --out json | grep demo-spring-infra | tr -d ' |"|,')
echo $C_REPO_IMAGE
C_VERSION=1
C_TAG=${C_REPO_IMAGE}:${C_VERSION}
C_REPO_URI=${C_REPO_BASE}/${C_REPO_IMAGE}:${C_VERSION}
JAVA_HOME=/usr/local/opt/openjdk@17
TARGET=target/demo-0.0.1-SNAPSHOT.jar

echo "make mvn app"
make mvn.clean
make mvn.compile
make mvn.package
echo "mvn package done"
echo "push to ECR"
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
docker build -f dockerfile -t ${C_TAG} .
aws ecr get-login-password --region ${reg} | docker login --username AWS --password-stdin ${C_REPO_BASE}
docker tag ${C_TAG} ${C_REPO_URI}
docker push ${C_REPO_URI}
echo "Spring application deployed to ${C_REPO_URI}"
echo "Spring application local ${C_TAG}"

#docker run -p 8081:8080 --env-file etc/environment.docker ${C_TAG}