import boto3
import json
import bcrypt
import hashlib
import uuid
from config.configs import *

class User:
    """ A class representing a user interacting with the VITA web services, either via webpage or app """

    # A string.
    guid = None

    # These properties describe the user, and are stored in DynamoDB
    VALID_EMAIL_PATTERN = r'(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'
    email = 'user@example.org'

    # raw password here
    password = None
    # raw password repeated here
    password_confirmation = None
    # this actually gets saved to the DB, as a hash of the password field
    password_hash = None

    VALID_ROLES = [
        'NewUser',
        'SiteCoordinator',
        'Admin',
        'SiteCoordinatorInactive'
    ]
    roles = { 'NewUser' } # Valid Values are 'New User', 'Site Coordinator', 'Admin', 'Site Coordinator, Inactive'

    @staticmethod
    def digest(s):
        return bcrypt.hashpw(s.encode(), bcrypt.gensalt()).decode('utf-8')

    @staticmethod
    def from_dict(dict):
        user = User()
        if 'id' in dict: user.id = dict['id']
        if 'email' in dict: user.email = dict['email']
        if 'password_hash' in dict: user.password_hash = dict['password_hash']
        if 'password' in dict: user.password = dict['password']
        if 'password_confirmation' in dict: user.password_confirmation = dict['password_confirmation']
        if 'roles' in dict: user.roles = dict['roles']
        return user

    @staticmethod
    def all():
        """ Look up all Users in the database """
        users = []
        dynamodb = boto3.resource('dynamodb')
        response = dynamodb.Table(USERS_TABLE_NAME).scan()
        for item in response['Items']:
            tmp = User.from_dict(item)
            if tmp is not None:
                users.append(tmp)
        
        return users

    @staticmethod
    def find(userid):
        """ Find a User with the specified ID """
        response = DYNAMO_CLIENT.Table(USERS_TABLE_NAME).get_item(
            Key= {
                'id':userid
            }
        )

        if 'Item' in response:
            return User.from_dict(response['Item'])
        else:
            return None

    def save(self):
        #
        # Pre-save code
        #

        # Downcase the email address
        self.email = self.email.lower()

        # Set password hash if password and password_confirmation fields are present
        if self.password is not None and self.password == self.password_confirmation:
            self.password_hash = User.digest(self.password)

        # Set the default Role if none are given
        if len(self.roles) == 0:
            self.roles = [ 'NewUser' ]
        
        # Checks for validity of the email address and presence of a password and at least one Role
        if not self.is_valid():
            return None

        # Create a new ID if one is not specified
        if self.guid is None:
            self.guid = str(uuid.uuid4())
        #
        # Actual Save Execution
        #

        # Prepare DB connection
        table = DYNAMO_CLIENT.Table(USERS_TABLE_NAME)
        
        # Execute Put
        response = table.put_item(
            Item = {
                'id': self.guid,
                'email': self.email,
                'password_hash': self.password_hash,
                'roles': self.roles
            }
        )

        logging.debug(response)

        return 200

    def delete(self):
        table = DYNAMO_CLIENT.Table(USERS_TABLE_NAME)
        response = table.delete_item(
            Key = {
                'id': self.guid
            }
        )

        return response['ResponseMetadata']['HTTPStatusCode']
    
    def is_valid(self):
        """ 
            Check all of the fields for validity.
            Call this method before saving.
        """
        # If a new password is included, it needs to match the confirmation password
        if self.password is not None:
            if self.password != self.password_confirmation:
                return False
        
        # Need a hashed password to save this record.
        if self.password_hash is None or len(self.password_hash) == 0:
            return False
        
        # Need at least one role. By default this should be "NewUser", unless it's explicitly set empty somewhere.
        if len(self.roles) < 1:
            return False

        # Make sure that all of the roles are valid ones
        for role in self.roles:
            if role not in User.VALID_ROLES: return False

        # If we made it here, the tests have all passed.
        return True

