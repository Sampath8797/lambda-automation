#!/bin/bash

ROLE_ARN=$1
AWS_PROFILE=$2
ROLE_SESSION_NAME=lambda-deployment

# this assumes that the ecr_login has been done before which gives the docker container access to the production server deployment role
CREDENTIALS=`aws sts assume-role --role-arn $1 --role-session-name $ROLE_SESSION_NAME --profile $2`
export AWS_ACCESS_KEY_ID=`echo $CREDENTIALS | jq -r .Credentials.AccessKeyId`
export AWS_SECRET_ACCESS_KEY=`echo $CREDENTIALS | jq -r .Credentials.SecretAccessKey`
export AWS_SESSION_TOKEN=`echo $CREDENTIALS | jq -r .Credentials.SessionToken`
export AWS_DEFAULT_REGION='us-east-1'

echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
echo $AWS_SESSION_TOKEN

aws lambda update-function-code --function-name lambda-automation-test --zip-file fileb://../lambda-function.zip