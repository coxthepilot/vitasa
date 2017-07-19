import json
import boto3
import logging

from models.site import Site
# from .utilities import respond
def respond(statusCode, body):
    return {
        'statusCode': statusCode,
        'body': body,
        'headers': {
            'Content-Type': 'application/json',
        },
    }

class BadParameters(Exception): pass

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    
    sites = Site.all()
    
    if sites == None:
        return respond('500', '{"errorCode":"500","errorMessage":"Unable to fetch a list of sites"}')
    
    sites_json = []
    for site in sites:
        sites_json.append(site.to_json())
    j = ','.join(sites_json)
    response_body = "[ " + j + " ]"

    return respond('200', response_body)
