import json
import boto3
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


class AccountAlreadyExistsException(Exception): pass
class BadParameters(Exception): pass
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

def lambda_handler(event, context):
    logger.info('got event{}'.format(event))
#get the site name from the url
    if 'pathParameters' not in event:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No Site Slug specified in the path"}')
    if 'sitename' not in event['pathParameters']:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No Site Slug found in the path parameters"}')
    site_name = urllib.parse.unquote(event['pathParameters']['sitename'])

    if len(site_name) == 0: 
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: Empty sitename"}')
        
    site = Site.find(site_name)
    if len(site_name) == 0: 
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: Invalid site slug"}')
    
    #actually delete the site
    site.delete()
    return response('200', '')
