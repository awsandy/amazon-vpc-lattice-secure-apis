# Securing API endpoints with Lattice

https://aws.amazon.com/blogs/containers/securing-api-endpoints-using-amazon-api-gateway-and-amazon-vpc-lattice/


https://github.com/aws-samples/amazon-vpc-lattice-secure-apis

The following should be deployed first to set up the core infrastructure.

* vpc: VPC to be used in each associated account, deployed using CDK
* spring: Spring Boot application that is deployed in all relevant accounts, deployed using CloudFormation or SAM

The next can be deployed in any order, depending on your requirements.

* api: Frontend API client into VPC Lattice using SAM
* lambda: Lambda function using SAM
* ecs: ECS cluster, task, and service setup using SAM
* eks: EKS cluster setup using eksctl, IAM role setup using CloudFormation, deployments using kubectl

## PREP
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo "AWS_REGION is not set !!"
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile

Upgrade cdk
npm install -g aws-cdk --force

switch to perm creds
aws sts get-caller-identity | grep vpclattice
Arn": "arn:aws:sts::985904863209:assumed-role/vpclattice-ws.admin.role/i-0a25088531a0be303"


git clone https://github.com/aws-samples/amazon-vpc-lattice-secure-apis


## vpc
cdk bootstrap  aws://<your-aws-account-id>/us-west-2
etc/environment.template to etc/environment.sh (set PROFILE=default)
npm install
cdk synth --context cidr="10.0.0.0/16"
cdk deploy --context cidr="10.0.0.0/16"







