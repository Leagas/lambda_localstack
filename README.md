Lambda-Localstack
============================

Setup/Template for testing Lambdas on the localstack

Make sure that...


	1. typescript is installed globally
	2. localstack is running (with s3,lambda,sqs,sns added to services in your compose file)
	3. config file has been updated
	

For first time setup run `npm run init`, this will initiate the following:

	- update/install aws-sam-cli using homebrew
	- create s3 bucket on localstack, set access control, create policies, and configure bucket notifications
	- build, transpile, and deploy packaged lambda function to localstack

Localstack (lambdas and buckets) can be viewed here `http://localhost:8181/#/infra`


# notification.json

This controls which events will trigger the lambda, and can be updated with suffix and prefix filters below, use the command `aws s3api put-bucket-notification-configuration help` to view the structure of this json.

# bucket.json

I can't remember exactly why this is here? I think it's to specify which actions are allowed to trigger notifications for the bucket, use the command `aws s3api get-bucket-policy help` to view the structure of this json.

# event.json

This is an event object generated by aws-sam. When using the command `npm run local`, a docker container is created to run our lambda, we can pass any json object to this function as the event argument. These can be generated by the cli using `sam local generate-event` to simulate actual aws event objects.

# npm commands

	-	init, first time setup up.
	-	sam, install aws-sam-cli.
	-	setup, setup buckets, policies, and notifications on localstack.
	-	deploy, builds, packages, and creates lambda function on localstack.
	-	test, re-creates lambda on localstack and uploads a file.
	-	local, builds and runs a sam local version of the lambda once.
	-	clean, will remove any docker containers that have "exited" this might remove other
		containers as well.
