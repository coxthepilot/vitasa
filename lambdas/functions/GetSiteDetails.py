import json
import boto3
import logging
import urllib

class NoSuchAccountExistsException(Exception): pass
class BadParameters(Exception): pass

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    #get the site name from the url

    error = False
    if 'params' not in event: 
        error = True
    if 'path' not in event['params']: 
        error = True
    if 'sitename' not in event['params']['path']: 
        error = True
        
    quotedName = event['params']['path']['sitename']
    iname = urllib.parse.unquote(quotedName)
    if len(iname) == 0: 
        error = True
    
    if error:
        errmsg = 'One or more parameters were bad or missing.'
        logger.error(errmsg)
        raise BadParameters(errmsg)
        
    #do magic to access the dynamo DB
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('Sites')

    response = table.get_item(
        Key={
            'Name': iname
        }
    )
    if 'Item' not in response:
        errmsg1 = 'No such account exists in the DB.'
        logger.error(errmsg1)
        raise NoSuchAccountExistsException(errmsg1)

    item = response['Item']

    d = {}
    d['name'] = item['Name']
    d['xstreet'] = item['xstreet']
    d['xcity'] = item['xcity']
    d['xstate'] = item['xstate']
    d['xzip'] = item['xzip']
    d['latitude'] = item['latitude']
    d['longitude'] = item['longitude']
    d['opentime'] = item['opentime']
    d['closetime'] = item['closetime']
    d['days'] = item['days']
    d['sitecoordinator'] = item['sitecoordinator']
    d['sitetype'] = item['sitetype']

    ds = json.dumps(d)
    
    return ds
