cd ~/environment
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
#git clone https://github.com/awsandy/amazon-vpc-lattice-secure-apis.git
aws configure set region $AWS_REGION
cdk bootstrap aws://$ACCOUNT_ID/$AWS_REGION
cdk acknowledge 27189
wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
tar -zxvf openjdk-17.0.2_linux-x64_bin.tar.gz
echo "set openjdk in envionment.sh"
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
mvn --version
cd ~/environment

