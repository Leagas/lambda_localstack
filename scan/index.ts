import * as AWS from 'aws-sdk'

const { LOCALSTACK_HOSTNAME } = process.env

const endpoint: string = `http://${LOCALSTACK_HOSTNAME}:4572`

const config = {
    endpoint: endpoint,
    s3ForcePathStyle: true
}

const s3 = new AWS.S3(config)

exports.handler = async (event, context) => {
	console.log(process.env)
	console.log(JSON.stringify(event, null, 2))
	console.log(JSON.stringify(context, null, 2))
	// List all s3 buckets
    await s3.listBuckets()
    .promise()
    .then(res => {
        console.log(JSON.stringify(res, null, 2))
    })
    .catch(err => {
        console.log(err)
	})

	return "OK"
}
