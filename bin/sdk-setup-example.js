// Load the AWS SDK for Node.js
var AWS = require('aws-sdk');

// Create the IAM service object
var lambda = new AWS.Lambda({apiVersion: '2015-03-31'});

var params = {
  Code: { /* required */
    S3Bucket: 'local-anti-virus',
    S3Key: 'function.zip'
  },
  FunctionName: 'slotTurn', /* required */
  Handler: 'index.handler', /* required */
  Role: 'arn:aws:lambda:eu-west-1:123456789012:function:ScanFunction', /* required */
  Runtime: 'nodejs8.10', /* required */
  Description: 'Slot machine game results generator'
};
lambda.createFunction(params, function(err, data) {
  if (err) console.log(err); // an error occurred
  else     console.log("success");           // successful response
});


