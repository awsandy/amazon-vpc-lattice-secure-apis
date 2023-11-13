make infrastructure
make lambda
make cognito


#After completing the deployment, update the following outputs:
#* `O_FN`: output Lambda function name
#* `O_API_ENDPOINT`: output API Gateway endpoint URL, e.g. https://<api_id>.execute-api.<region>.amazonaws.com/<stage>
#* `O_LAYER_ARN`: output layer ARN
#* `O_SGROUP`: output security group id

## Testing
#To setup the user that you created, update the following parameters:
# * `P_COGNITO_USERTEMPPW`: temporary password that was emailed to the email address that you entered
# * `P_COGNITO_USERPERMPW`: permanent password that you select and is configured for your user


make cognito.admin
make cognito.user

#Alternatively, you can get a fresh set of credentials making an API request: `make api.auth`

#Test the API endpoint with the JWT token that you get from Cognito: 
make api.invoke


