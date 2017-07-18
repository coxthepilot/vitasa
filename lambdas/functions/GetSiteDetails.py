import json
import boto3
import logging
import urllib

from models.site import Site
from .utilities import respond

class NoSuchAccountExistsException(Exception): pass
class BadParameters(Exception): pass

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    #get the site name from the url
    if 'params' not in event: 
        respond(400, '{ "errorCode": "400", "errorMessage":"Bad Request: No Params found"}'
    if 'path' not in event['params']: 
        respond(400, '{ "errorCode": "400", "errorMessage":"Bad Request: No path found in Params"}'
    if 'sitename' not in event['params']['path']: 
        respond(400, '{ "errorCode": "400", "errorMessage":"Bad Request: No sitename found in Params.path"}'
        
    quotedName = event['params']['path']['sitename']
    iname = urllib.parse.unquote(quotedName)
    if len(iname) == 0: 
        respond(400, '{ "errorCode": "400", "errorMessage":"Bad Request: Empty sitename"}'
        
    site = Site.find(iname)
    respond(200, site.to_json())
