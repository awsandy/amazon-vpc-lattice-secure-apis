cd amazon-vpc-lattice-secure-apis/vpc
npm install
cdk synth --context cidr="10.0.0.0/16"
cdk deploy --context cidr="10.0.0.0/16" --require-approval never