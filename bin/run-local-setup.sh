#!/usr/bin/env bash
source ./bin/_config.sh

# Created a bucket for lambda testing
echo 'Creating bucket...'
aws --endpoint-url=http://$LOCALHOST:$S3_PORT s3 mb s3://$S3_BUCKET

# Make sure the bucket is public an readable
echo 'Setting bucket access control...'
aws --endpoint-url=http://$LOCALHOST:$S3_PORT s3api put-bucket-acl --bucket $S3_BUCKET --acl public-read

# Adds a policy to our localstack test bucket so we can trigger events when an object is uploaded
echo -e '\nCreating bucket policy...'
aws --endpoint-url=http://$LOCALHOST:$S3_PORT s3api put-bucket-policy --bucket $S3_BUCKET --policy file://$S3_POLICY

# Prints our policy to console for debugging
echo -e '\n--- bucket policy ---\n'
aws --endpoint-url=http://$LOCALHOST:$S3_PORT s3api get-bucket-policy --bucket $S3_BUCKET

# Adds the create object notification
echo -e '\nSetting notification config...'
aws --endpoint-url=http://$LOCALHOST:$S3_PORT s3api put-bucket-notification-configuration --bucket $S3_BUCKET --notification-configuration file://$S3_NOTIFICATION

# Prints notification config to console for debugging
echo -e '\n-- notification config --\n'
aws --endpoint-url=http://$LOCALHOST:$S3_PORT s3api get-bucket-notification-configuration --bucket $S3_BUCKET

