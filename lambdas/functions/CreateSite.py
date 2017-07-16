import json
import boto3
import logging

class AccountAlreadyExistsException(Exception): pass
class BadParameters(Exception): pass

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info('got event{}'.format(event))
    
    error = False
    iname = event['name']
    if len(iname) == 0: error = True
    ixstreet = event['xstreet']
    if len(ixstreet) == 0: error = True
    ixcity = event['xcity']
    if len(ixcity) == 0: error = True
    ixstate = event['xstate']
    if len(ixstate) == 0: error = True
    ixzip = event['xzip']
    if len(ixzip) == 0: error = True
    ilatitude = event['latitude']
    if len(ilatitude) == 0: error = True
    ilongitude = event['longitude']
    if len(ilongitude) == 0: error = True
    iopentime = event['opentime']
    if len(iopentime) == 0: error = True
    iclosetime = event['closetime']
    if len(iclosetime) == 0: error = True
    idays = event['days']
    if len(idays) == 0: error = True
    isitecoordinator = event['sitecoordinator']
    if len(isitecoordinator) == 0: error = True
    isitetype = event['sitetype']
    if len(isitetype) == 0: error = True
    
    if error:
        errmsg = 'One or more parameters were bad or missing.'
        logger.error(errmsg)
        raise BadParameters(errmsg)
        
    #check to see if that name is already in the DB
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('Sites')
    
    getresponse = table.get_item(
        Key={
            'Name': iname
        }
    )
    if 'Item' in getresponse:
        errmsg1 = 'The account is already in the DB.'
        logger.error(errmsg1)
        raise AccountAlreadyExistsException(errmsg1)

    putresponse = table.put_item(
        Item={
            'Name': iname,
            'xstreet' : ixstreet,
            'xcity' : ixcity,
            'xstate' : ixstate,
            'xzip' : ixzip,
            'latitude' : ilatitude,
            'longitude' : ilongitude,
            'opentime' : iopentime,
            'closetime' : iclosetime,
            'days' : idays,
            'sitecoordinator' : isitecoordinator,
            'sitetype' : isitetype
        }
    )

    msg = json.dumps(putresponse)
    return msg
