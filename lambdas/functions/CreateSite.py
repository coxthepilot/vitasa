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

def deserialize_site(event):
    """ Extract a Site object from the Event body """
    if event['body'] is None:
        return None

    json_body = json.loads(event['body'])
    site = Site.from_dict(json_body['Site'])
    return site


def lambda_handler(event, context):
    logger.info('got event{}'.format(event))

    site = deserialize_site(event)
    if site is None:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: No valid Site data sent in the body."}')

    # Check to see if there are any items already existing with that slug
    existing_site_check = Site.find(site.slug)
    if existing_site_check is None:
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: Duplicate slug value specified. This must be a unique value for each site."}')

    # Actually create the record now
    if not site.save():
        return respond('400', '{ "errorCode": "400", "errorMessage":"Bad Request: Unable to create record due to failed validation checks."}')
    else:
        response_body = Site.find(site_data.slug).to_json() # Reload the object from the database to ensure that any on-save hooks are accounted for
        return respond('200', response_body)
