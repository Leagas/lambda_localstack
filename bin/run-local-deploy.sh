#!/usr/bin/env bash
source ./bin/_config.sh

RUNTIME="nodejs8.10"
TARGET="./dist/index.js"
YAML="template-node.yaml"

if [ "$1" = "python" ];
then
	RUNTIME="python2.7"
	TARGET="./dist/index.py"
	YAML="template-python.yaml"
fi

# Create sam packge for local invoke
echo 'Building sam for local invoke...'
sam build -t ./$YAML

# Transpile with tsc
echo 'Transpiling typescript files...'
tsc ./scan/index.ts --outdir dist

# Create zip for lambda creation
echo 'Zipping lambda...'
zip -r -D -j function.zip $TARGET $YAML

# First delete the function so we can redeploy
echo 'Deleting existing lambda...'
aws --endpoint-url=http://$LOCALHOST:$LAMBDA_PORT lambda delete-function --function-name=ScanFunction

# Create lambda function on our localstack
echo -e '\nCreating lambda function on localstack...\n'
aws --endpoint-url=http://$LOCALHOST:$LAMBDA_PORT \
    --region=eu-west-1 lambda create-function \
    --function-name=ScanFunction \
    --runtime=$RUNTIME \
    --role=arn:aws:lambda:eu-west-1:000000000000:function:ScanFunction \
    --handler=index.handler \
    --zip-file=fileb://function.zip

echo -e '\n--- Lambda functions on localstack ---\n'
aws --endpoint-url=http://$LOCALHOST:$LAMBDA_PORT lambda list-functions
