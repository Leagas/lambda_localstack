const AWS = require('aws-sdk');

const { LOCALSTACK_HOSTNAME } = process.env
const endpoint = `http://${LOCALSTACK_HOSTNAME}:4572`

const config = {
    endpoint: endpoint,
    s3ForcePathStyle: true
}

const s3 = new AWS.S3(config)

exports.handler = async (event, context) => {
    const today = new Date()

    console.log(JSON.stringify(event, null, 2))
    console.log(JSON.stringify(context, null, 2))

    await s3.listBuckets()
    .promise()
    .then(res => {
        console.log(JSON.stringify(res, null, 2))
    })
    .catch(err => {
        console.log(err)
    })
    

    return today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
}
