PROFILE=default
ACCOUNTID=$(aws sts get-caller-identity --query Account --output text)
REGION=$(aws configure get region)
BUCKET=api-lattice-${ACCOUNTID}-${REGION}
#JAVA_HOME=/usr/local/opt/openjdk@17
JAVA_HOME=/home/ec2-user/environment/jdk-17.0.2
TARGET=target/demo-0.0.1-SNAPSHOT.jar


P_NAME=demo
SAM_STACK=${P_NAME}-spring-infrastructure
SAM_TEMPLATE=iac/infrastructure.yaml
SAM_OUTPUT=iac/infrastructure_output.yaml
SAM_PARAMS="ParameterKey=name,ParameterValue=${P_NAME}"
O_TABLE_ARN=output-table-arn
O_ECR_URI=output-ecr-uri

C_REPO_BASE=${ACCOUNTID}.dkr.ecr.${REGION}.amazonaws.com
C_REPO_IMAGE=output-ecr-repo-name
C_VERSION=1
C_TAG=${C_REPO_IMAGE}:${C_VERSION}
C_REPO_URI=${C_REPO_BASE}/${C_REPO_IMAGE}:${C_VERSION}

export TABLE=output-table-name