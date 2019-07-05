import os
import re

TARGET_FOLDER = "docstorage"

def check_location(string):
    return re.search(TARGET_FOLDER, string)

def handler(event, context):
	print(event['Records'][0]['s3']['object']['key'])
	location = check_location(event['Records'][0]['s3']['object']['key']) if TARGET_FOLDER else True
	if (bool(location) == False):
		return "Skipping file..."
	return "Scanning file..."
