import json
import boto3
import logging
import urllib

class AccountDoesNotExistException(Exception): pass

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info('got event{}'.format(event))

    #get the site name from the url
    error = False
    if 'params' not in event: 
        error = True
    if 'path' not in event['params']: 
        error = True
    if 'sitename' not in event['params']['path']: 
        error = True
        
    quotedName = event['params']['path']['sitename']
    sname = urllib.parse.unquote(quotedName)
    
    #sname = event['params']['path']['sitename']
    
    #do magic to access the dynamo DB
    dynamodb = boto3.resource('dynamodb')
    
    #see if the site exists; if not, then return an error
    table = dynamodb.Table('Sites')
    
    getresponse = table.get_item(
        Key={
            'Name': sname
        }
    )
    if 'Item' not in getresponse:
        errmsg1 = 'The account does not exist in the DB.'
        logger.error(errmsg1)
        raise AccountDoesNotExistException(errmsg1)

    #actually delete the site
    response = table.delete_item(
        Key={
            'Name': sname
        }
    )

    return json.dumps(response)
