S3 Anti Virus Scanner
============================

This lambda scans incoming files on s3 using AV scanner.

Make sure that...

	1. typescript is installed globally
	2. localstack is running
	3. config file has been updated

For first time setup run `npm run init`, this will initiate the following:
	- update/install aws-sam-cli using homebrew
	- loads env var from config file
	- create s3 bucket on localstack, set access control, create policies, and configure bucket notifications
	- build, transpile, and deploy packged lambda function to localstack

Localstack (lambdas and buckets) can be viewed here `http://localhost:8181/#/infra`

# npm commands

	-	init, first time setup up.
	-	sam, install aws-sam-cli.
	-	setup, setup buckets, policies, and notifications on localstack.
	-	deploy, builds, packages, and creates lambda function on localstack.
	-	test, re-creates lambda on localstack and uploads a file.
	-	local, builds and runs a sam local version of the lambda once.
	-	clean, will remove any docker containers that have "exited" this might remove other
		containers as well.
