import unittest
import sys
import json

sys.path.insert(0, ".")
from models.site import Site
from functions.CreateSite import *

class TCLambdaCreateSite(unittest.TestCase):
    def test_get_site_details(self):
        event = {
            'httpMethod': 'GET',
            'path': '/site/the-alamo',
            'resource': '/site/{sitename}',
            'pathParameters': {
                'sitename': 'the-alamo'
            },
            'body': None,
        }
        response = lambda_handler(event, None)
        self.assertIsNotNone(response)
        self.assertEqual('200', response['statusCode'], 'Maybe the data hasn\'t been created yet? This is a manual process until we get fixtures installed')
        site = Site.from_dict(json.loads(response['body']))
        self.assertEqual('the-alamo', site.slug)
        self.assertEqual('The Alamo', site.name)

if __name__ == '__main__':
    unittest.main()
