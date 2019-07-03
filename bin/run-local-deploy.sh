# Create sam packge for local invoke
echo 'Building sam for local invoke...'
sam build

# Create zip for lambda creation
echo 'Zipping lambda...'
zip -r -D -j function.zip ./scan/index.js template.yaml

# First delete the function so we can redeploy
echo 'Deleting existing lambda...'
aws --endpoint-url=http://localhost:4574 lambda delete-function --function-name=ScanFunction

# Create lambda function on our localstack
echo 'Creating lambda function on localstack'
aws --endpoint-url=http://localhost:4574 \
    --region=eu-west-1 lambda create-function \
    --function-name=ScanFunction \
    --runtime=nodejs8.10 \
    --role=arn:aws:lambda:eu-west-1:000000000000:function:ScanFunction \
    --handler=index.handler \
    --zip-file=fileb://function.zip

echo '--- Lambda functions on localstack ---'
aws --endpoint-url=http://localhost:4574 lambda list-functions
