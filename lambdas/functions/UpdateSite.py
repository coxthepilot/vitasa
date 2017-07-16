import json
import boto3
import logging

class NoSuchAccountException(Exception): pass
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

    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('Sites')
    
    #make sure the item is already in our DB
    getresponse = table.get_item(
        Key={
            'Name': iname
        }
    )
    if 'Item' not in getresponse:
        errmsg1 = 'The site does not exist in the DB.'
        logger.error(errmsg1)
        raise NoSuchAccountException(errmsg1)
        
    putresponse = table.update_item(
        Key={ 'Name' : event['name'] },
        UpdateExpression = 'set xstreet=:a, xcity=:b, xstate=:c, xzip=:d'\
            + ', latitude=:e, longitude=:f, opentime=:g, closetime=:h'\
            + ', days=:i, sitecoordinator=:j, sitetype=:k',
        ExpressionAttributeValues={
            ':a' : ixstreet,
            ':b' : ixcity,
            ':c' : ixstate,
            ':d' : ixzip,
            ':e' : ilatitude,
            ':f' : ilongitude,
            ':g' : iopentime,
            ':h' : iclosetime,
            ':i' : idays,
            ':j' : isitecoordinator,
            ':k' : isitetype
        }
    )

    msg = json.dumps(putresponse)
    return msg
