# Redeploy our lambda to make sure we have latest version
npm run deploy

# Copy a file to the bucket to trigger scan
aws --endpoint-url=http://localhost:4572 s3 cp __SCANME__test.txt s3://local-anti-virus

# Fetch logs for the last lambda execution
npm run log
