#!/usr/bin/env bash
source ./bin/_config.sh

# Redeploy our lambda to make sure we have latest version
npm run deploy:$1

# Copy a file to the bucket to trigger scan
aws --endpoint-url=http://$LOCALHOST:$S3_PORT s3 cp __SCANME__test.txt s3://$S3_BUCKET/jvku3igf/docstorage/__SCANME__test.txt
