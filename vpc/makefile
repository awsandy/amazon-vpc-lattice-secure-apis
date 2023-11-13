include etc/environment.sh

cdk: cdk.synth cdk.deploy
cdk.bootstrap:
	cdk bootstrap
cdk.synth:
	cdk synth--context cidr=${P_CIDR}
cdk.deploy:
	cdk deploy ${PROFILE} --context cidr=${P_CIDR}
