class User:
    """ A class representing a user interacting with the VITA web services, either via webpage or app """

    # A string.
    guid = None

    # These properties describe the user, and are stored in DynamoDB
    VALID_EMAIL_PATTERN = r'(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'
    email = 'user@example.org'

    password = 'hashed password here'
    VALID_ROLES = [
        'NewUser',
        'SiteCoordinator',
        'Admin',
        'SiteCoordinatorInactive'
    ]
    roles = [ 'NewUser' ] # Valid Values are 'New User', 'Site Coordinator', 'Admin', 'Site Coordinator, Inactive'

    def save(self):
        #
        # Pre-save code
        #

        # Downcase the email address
        self.email = self.email.lower()

        # Checks for validity of the email address and presence of a password and at least one Role
        if not self.is_valid():
            return None

        dynamodb = boto3.resource('dynamodb')
        table = dynamodb.Table(USERS_TABLE_NAME)
        response = table.put_item(
            Item = {
                'email': self.email,
                'password_hash': self.password_hash,
                'roles': 
            }
        )

        logging.debug(response)

        return 200
    
    def is_valid(self):
        """ 
            Check all of the fields for validity.
            Call this method before saving.
        """
        # Need a password of some kind.
        if len(self.password_hash.strip()) == 0:
            return False

        # Need at least one role. By default this should be "NewUser", unless it's explicitly set empty somewhere.
        if len(roles) < 1:
            return False

        # Make sure that all of the roles are valid ones
        for role in self.roles:
            if role not in VALID_ROLES: return False

        # If we made it here, the tests have all passed.
        return True

