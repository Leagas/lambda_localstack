#!/usr/bin/env bash

# Created a bucket for lambda testing
echo 'Creating bucket...'
aws --endpoint-url=http://localhost:4572 s3 mb s3://local-anti-virus

# Make sure the bucket is public an readable
echo 'Setting bucket access control...'
aws --endpoint-url=http://localhost:4572 s3api put-bucket-acl --bucket local-anti-virus --acl public-read

# Adds a policy to our localstack test bucket so we can trigger events when an object is uploaded
echo 'Creating bucket policy'
aws --endpoint-url=http://localhost:4572 s3api put-bucket-policy --bucket local-anti-virus --policy file://policy.json

# Prints our policy to console for debugging
echo '--- bucket policy ---'
aws --endpoint-url=http://localhost:4572 s3api get-bucket-policy --bucket local-anti-virus

# Adds the create object notification
echo 'Setting notification config...'
aws --endpoint-url=http://localhost:4572 s3api put-bucket-notification-configuration --bucket local-anti-virus --notification-configuration file://notification.json

# Prints notification config to console for debugging
echo '-- notification config --'
aws --endpoint-url=http://localhost:4572 s3api get-bucket-notification-configuration --bucket local-anti-virus

