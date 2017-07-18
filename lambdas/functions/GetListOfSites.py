import json
import boto3
import logging

class BadParameters(Exception): pass

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info('got event{}'.format(event))
    
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('Sites')
    response = table.scan()
    
    if 'Items' not in response:
        errmsg = 'Error in getting the list of sites'
        logger.error(errmsg)
        raise BadParameters(errmsg)
    
    items = response['Items']
    
    return json.dumps(items)
