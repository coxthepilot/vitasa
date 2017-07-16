import json
import boto3

# Utility method, useful for formatting the API Gateway Proxy Response
def respond(statusCode, body):
    return {
        'statusCode': statusCode,
        'body': body,
        'headers': {
            'Content-Type': 'application/json',
        },
    }