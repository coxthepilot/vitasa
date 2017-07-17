import boto3
import json
from decimal import Decimal
from config.configs import *

class Site:
    """ A class representing a VITA tax prep location. It is managed by a Site Coordinator. """

    # These properties describe the user, and are stored in DynamoDB
    name = None
    slug = ''
    xstreet = '123 Fake Street'
    xcity = 'San Antonio'
    xzip = '78006'
    latitude = Decimal('175.0')
    longitude = Decimal('175.0')
    opentime = '9am'
    closetime = '5pm'
    days = 'M-F'
    sitecoordinator = None
    sitetype = 'Tax Prep'

    is_open = False
    
    @staticmethod
    def from_dict(dictionary):
        """ Create a Site object from a data dictionary """
        site = Site()
        if 'name' in dictionary: site.name = dictionary['name']
        if 'slug' in dictionary: site.name = dictionary['slug']
        if 'xstreet' in dictionary: site.xstreet = dictionary['xstreet']
        if 'xcity' in dictionary: site.xcity = dictionary['xcity']
        if 'xzip' in dictionary: site.xzip = dictionary['xzip']
        if 'latitude' in dictionary: site.latitude = dictionary['latitude']
        if 'longitude' in dictionary: site.longitude = dictionary['longitude']
        if 'opentime' in dictionary: site.opentime = dictionary['opentime']
        if 'closetime' in dictionary: site.closetime = dictionary['closetime']
        if 'sitecoordinator' in dictionary: site.sitecoordinator = dictionary['sitecoordinator'] # TODO: validate that this is a valid coordinator ID
        if 'is_open' in dictionary: site.is_open = dictionary['is_open']

        # Validate required fields
        if site.is_valid():
            return site
        else:
            return None

    @staticmethod
    def find(slug):
        """ Look up the Site in the database """
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
                sites.append(Site.from_dict(item))
        
        return sites

    def save(self):
        """ Save all fields to the database """
        # Attempt to make our own slug if none was given


        if not self.is_valid():
            return False
        
        dynamodb = boto3.resource('dynamodb')
        table = dynamodb.Table(SITES_TABLE_NAME)
        response = table.put_item(
            Item = {
                'name': self.name,
                'slug': self.slug,
                'xstreet': self.xstreet,
                'xcity': self.xcity,
                'xzip': self.xzip,
                'latitude': self.latitude,
                'longitude': self.longitude,
                'opentime': self.opentime,
                'closetime': self.closetime,
                'days': self.days,
                'sitecoordinator': self.sitecoordinator,
                'sitetype': self.sitetype,

                'is_open': self.is_open
            }
        )

        return 'ConsumedCapacity' in response

    def delete(self):
        dynamodb = boto3.resource('dynamodb')
        table = dynamodb.Table(SITES_TABLE_NAME)
        table.delete_item(
            Key = {
                'name': self.name
            }
        )
        return True
    
    def to_json(self):
        return json.dumps(self.__dict__)
    
    def is_valid(self):
        if self.name == None or len(self.name) == 0:
            return False
        if self.slug == None or len(self.slug) == 0:
            return False
        # TODO: add more validation checks
        # 1) Is the address valid
        # 2) Is the lat/long valid range
        # 3) Is the lat/long in the vicinity of the address
        # 4) Is the site coordinator a valid identifier from the users table
        # 5) Does the site coordinator User have the right Role?
        return True
