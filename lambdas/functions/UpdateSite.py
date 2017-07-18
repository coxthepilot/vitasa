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
    # Extract the ID from the path parameters
    if 'pathParameters' not in event:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No Site Slug specified in the path"}')
    if 'sitename' not in event['pathParameters']:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No Site Slug found in the path parameters"}')
    site_name = urllib.parse.unquote(event['pathParameters']['sitename'])

    # Fetch from the DB and validate that a record WAS found
    site = Site.find(site_name)
    update_count = 0
    if site is None:
        return respond('404', '{ "errorCode": "404", "errorMessage":"Invalid site name"}')

    # Check for fields being updated
    if 'name' in event:
        site.name = event['name']
        update_count += 1
    if 'xstreet' in event:
        site.xstreet = event['xstreet']
        update_count += 1
    if 'xcity' in event:
        site.xcity = event['xcity']
        update_count += 1
    if 'xzip' in event:
        site.xzip = event['xzip']
        update_count += 1
    if 'latitude' in event:
        site.latitude = event['latitude']
        update_count += 1
    if 'longitude' in event:
        site.longitude = event['longitude']
        update_count += 1
    if 'opentime' in event:
        site.opentime = event['opentime']
        update_count += 1
    if 'closetime' in event:
        site.closetime = event['closetime']
        update_count += 1
    if 'days' in event:
        site.days = event['days']
        update_count += 1
    if 'sitecoordinator' in event:
        site.sitecoordinator = event['sitecoordinator']
        update_count += 1
    if 'sitetype' in event:
        site.sitetype = event['sitetype']
        update_count += 1

    if update_count == 0:
        # return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No (valid) fields updated in the request body."}')
        # On second thought, let's let this operation succeed. Why not?
        # As far as the requester is concerned, the updates they requested have already been applied.
        # Also, this will even be faster than submitting a PutItem request with no purpose.
        return respond('200', site.to_json())

    if not site.save():
        return respond('500', '{ "errorCode": "500", "errorMessage":"Server error: failed to save"}')

    # Reload the object from the database to ensure that any on-save hooks are accounted for
    response_body = Site.find(site_data.slug).to_json()
    return respond('200', response_body)
