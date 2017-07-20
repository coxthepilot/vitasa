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
    if event['pathParameters'] is None:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: None Site Slug specified in the path"}')
    if 'sitename' not in event['pathParameters']:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No Site Slug found in the path parameters"}')
    if 'body' not in event:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No Site data attached in the request body."}')
    if event['body'] is None:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No valid Site data attached in the request body."}')

    #site_name = urllib.parse.unquote(event['pathParameters']['sitename'])
    # TODO: either validate that the sitename is a properly-formatted slug, or run it through url decoding first
    site_name = event['pathParameters']['sitename']

    # Fetch from the DB and validate that a record WAS found
    site = Site.find(site_name)
    update_count = 0
    if site is None:
        return respond('404', '{ "errorCode": "404", "errorMessage":"Invalid site name"}')

    # Check for fields being updated
    site_data = json.loads(event['body'])
    if 'name' in site_data:
        site.name = site_data['name']
        update_count += 1
    if 'xstreet' in site_data:
        site.xstreet = site_data['xstreet']
        update_count += 1
    if 'xcity' in site_data:
        site.xcity = site_data['xcity']
        update_count += 1
    if 'xzip' in site_data:
        site.xzip = site_data['xzip']
        update_count += 1
    if 'latitude' in site_data:
        site.latitude = site_data['latitude']
        update_count += 1
    if 'longitude' in site_data:
        site.longitude = site_data['longitude']
        update_count += 1
    if 'opentime' in site_data:
        site.opentime = site_data['opentime']
        update_count += 1
    if 'closetime' in site_data:
        site.closetime = site_data['closetime']
        update_count += 1
    if 'days' in site_data:
        site.days = site_data['days']
        update_count += 1
    if 'sitecoordinator' in site_data:
        site.sitecoordinator = site_data['sitecoordinator']
        update_count += 1
    if 'sitetype' in site_data:
        site.sitetype = site_data['sitetype']
        update_count += 1

    if update_count == 0:
        # return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No (valid) fields updated in the request body."}')
        # On second thought, let's let this operation succeed. Why not?
        # As far as the requester is concerned, the updates they requested have already been applied.
        # Also, this will even be faster than submitting a PutItem request with no purpose.
        logger.debug("No actual updates to run, so just return the site object as-is")
        return respond('200', site.to_json())

    results = site.save()
    if results is None:
        return respond('500', '{ "errorCode": "500", "errorMessage":"Server error: failed to save"}')

    # Reload the object from the database to ensure that any on-save hooks are accounted for
    response_body = Site.find(site.slug).to_json()
    return respond('200', response_body)
