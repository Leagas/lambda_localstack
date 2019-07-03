S3 Anti Virus Scanner
============================

This lambda scans incoming files on s3 using AV scanner.

Make sure:
	1. typescript is installed globally
	2. localstack is running
	3. config file has been updated

For first time setup run `npm run init`, this will initiate the following:
	- update/install aws-sam-cli using homebrew
	- loads env var from config file
	- create s3 bucket on localstack, set access control, create policies, and configure bucket notifications
	- build, transpile, and deploy packged lambda function to localstack
