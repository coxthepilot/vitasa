import json
import boto3
from models.site import Site

# Utility method, useful for formatting the API Gateway Proxy Response
def respond(statusCode, body):
    return {
        'statusCode': statusCode,
        'body': body,
        'headers': {
            'Content-Type': 'application/json',
        },
    }

def deserialize_site(event):
    """ Extract a Site object from the Event body """
    if event['body'] == None:
        return None

    json_body = json.loads(event['body'])
    site = Site.from_dict(json_body['Site'])
    return site