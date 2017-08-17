import boto3
import json
import re

from config.configs import *

class Site:
    """ A class representing a VITA tax prep location. It is managed by a Site Coordinator. """

    # These properties describe the user, and are stored in DynamoDB
    name = None
    slug = ''
    xstreet = '123 Fake Street'
    xcity = 'San Antonio'
    xstate = 'TX'
    xzip = '78006'
    latitude = '175.0'
    longitude = '175.0'
    google_place_id = None
    sitecoordinator = None
    backup_sitecoordinator = None

    VALID_SITE_STATUSES = [ 'Accepting', 'NearLimit', 'NotAccepting', 'Closed' ]
    sitestatus = 'Closed'
    default_schedule = {
        'Monday': {
            'is_open': True,
            'open': '09:00',
            'close': '15:00'
        },
        'Tuesday': {
            'is_open': False,
            'open': None,
            'close': None
        }
    }

    is_open = False
    
    @staticmethod
    def from_dict(dictionary):
        """ Create a Site object from a data dictionary """
        site = Site()
        if 'name' in dictionary: site.name = dictionary['name']
        if 'slug' in dictionary: site.slug = dictionary['slug']
        if 'street' in dictionary: site.xstreet = dictionary['street']
        if 'city' in dictionary: site.xcity = dictionary['city']
        if 'state' in dictionary: site.xstate = dictionary['state']
        if 'zip' in dictionary: site.xzip = dictionary['zip']
        if 'latitude' in dictionary: site.latitude = dictionary['latitude']
        if 'longitude' in dictionary: site.longitude = dictionary['longitude']
        if 'google_place_id' in dictionary: site.google_place_id = dictionary['google_place_id']
        if 'sitecoordinator' in dictionary: site.sitecoordinator = dictionary['sitecoordinator'] # TODO: validate that this is a valid coordinator ID
        if 'backup_sitecoordinator' in dictionary: site.backup_sitecoordinator = dictionary['backup_sitecoordinator'] # TODO: validate that this is a valid coordinator ID
        if 'sitestatus' in dictionary: site.is_open = dictionary['sitestatus']
        
        return site
        
    @staticmethod
    def find(slug):
        """ Look up the Site in the database """

        if len(slug) == 0:
            return None

        dynamodb = boto3.resource('dynamodb')
        table = dynamodb.Table(SITES_TABLE_NAME)
        response = table.get_item(
            Key = {
                'slug': slug
            }
        )
        
        if 'Item' in response:
            item = response['Item']
            site = Site.from_dict(item)
            if site is None:
                return None
            else:
                return site
        else:
            return None
    
    @staticmethod
    def all():
        """ Look up all Sites in the database """
        sites = []
        dynamodb = boto3.resource('dynamodb')
        response = dynamodb.Table(SITES_TABLE_NAME).scan()
        for item in response['Items']:
            tmp = Site.from_dict(item)
            if tmp is not None:
                sites.append(tmp)
        
        return sites

    def save(self):
        """ Save all fields to the database """
        # Attempt to make our own slug if none was given
        if self.slug is None or self.slug.strip() == '':
            self.slug = Site.slugify(self.name)

        if not self.is_valid():
            return False
        
        dynamodb = boto3.resource('dynamodb')
        table = dynamodb.Table(SITES_TABLE_NAME)
        response = table.put_item(
            Item = {
                'name': self.name,
                'slug': self.slug,
                'street': self.xstreet,
                'city': self.xcity,
                'state': self.xstate,
                'zip': self.xzip,
                'latitude': self.latitude,
                'longitude': self.longitude,
                'sitecoordinator': self.sitecoordinator,
                'backup_sitecoordinator': self.backup_sitecoordinator,
                'sitestatus': self.sitestatus,

                'is_open': self.is_open
            }
        )

        logging.debug(response)

        return response['ResponseMetadata']['HTTPStatusCode']
        

    def delete(self):
        dynamodb = boto3.resource('dynamodb')
        table = dynamodb.Table(SITES_TABLE_NAME)
        response = table.delete_item(
            Key = {
                'slug': self.slug
            }
        )

        return response['ResponseMetadata']['HTTPStatusCode']
    
    def to_json(self):
        return json.dumps(self.__dict__)

    @staticmethod
    def slugify(sitename):
        return re.sub(r'[-\s]+', '-',
            (re.sub(r'[^\w\s-]', '',sitename).strip().lower())).rstrip('-')

    def is_valid(self):
        if self.name == None or len(self.name) == 0:
            logging.debug("Site Validation failed due to missing field {name}")
            return False
        if self.slug == None or len(self.slug) == 0:
            logging.debug("Site Validation failed due to missing field {slug}")
            return False

        if Site.slugify(self.slug) != self.slug or len(self.slug.strip()) == 0:
            logging.debug("Site Validation failed due to invalid {0}".format(self.slug))
            return False

        if self.sitestatus not in Site.VALID_SITE_STATUSES:
            return False

        # TODO: add more validation checks
        # 1) Is the address valid
        # 2) Is the lat/long valid range
        # 3) Is the lat/long in the vicinity of the address
        # 4) Is the site coordinator (and backup) a valid identifier from the users table
        # 5) Does the site coordinator User have the right Role?
        return True
