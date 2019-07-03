S3 Anti Virus Scanner
============================

This lambda scans incoming files for malware before uploading to S3. If a file is deleted a notification is sent or logged.

To setup for testing against localstack, run `npm run setup`, this will initiate the following:
    - install aws-sam
    - add buckets and policies to localstack
    - package and deploy lambda to localstack


Useful debugging commands:

# Package our lambda function

`sam build --use-container`

This allows us to use sam local invoke <FunctionName> --event event.json

# Create zip for lambda create

zip -r -D -j function.zip ./scan/index.js template.yaml

# Create lambda function on our localstack

aws --endpoint-url=http://localhost:4574 \
    --region=eu-west-1 lambda create-function \
    --function-name=ScanFunction \
    --runtime=nodejs8.10 \
    --role=arn:aws:lambda:eu-west-1:000000000000:function:ScanFunction \
    --handler=index.handler \
    --zip-file=fileb://function.zip

# Delete lambda function from localstack

aws --endpoint-url=http://localhost:4574 lambda delete-function --function-name=ScanFunction 
