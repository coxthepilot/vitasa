import unittest
import sys
import json

sys.path.insert(0, ".")
from models.site import Site
from functions.CreateSite import *

class TCLambdaCreateSite(unittest.TestCase):
    def setUp(self):
        self.site1 = Site.from_dict({
            "name": "TCLambdaCreateSite 1",
            "slug": "TCLambdaCreateSite-1".lower(),
            "xstreet": "300 Alamo Plaza",
            "xcity": "San Antonio",
            "xzip": "78205",
            "latitude": "170.0",
            "longitude": "170.0",
            "opentime": "9am",
            "closetime": "5pm",
            "days": "M-F",
            "sitecoordinator": None,
            "is_open": True,
        })

    def tearDown(self):
        # setUp doesn't write this site to the database, since that's the logic under test, 
        # but tearDown should ensure that it gets deleted
        self.site1.delete()

    def test_lambda_positive(self):
        event = {
            'httpMethod': 'PUT',
            'path': '/site/',
            'resource': '/site/',
            'pathParameters': None,
            'body': json.dumps({
                "name": "TCLambdaCreateSite 1",
                "slug": "TCLambdaCreateSite-1".lower(),
                "xstreet": "300 Alamo Plaza",
                "xcity": "San Antonio",
                "xzip": "78205",
                "latitude": "170.0",
                "longitude": "170.0",
                "opentime": "9am",
                "closetime": "5pm",
                "days": "M-F",
                "sitecoordinator": None,
                "is_open": True,
            }),
        }
        response = lambda_handler(event, None)
        self.assertIsNotNone(response)
        self.assertEqual('200', response['statusCode'], 'Lambda handler failed')
        site = Site.from_dict(json.loads(response['body']))
        self.assertEqual('tclambdacreatesite-1', site.slug)
        self.assertEqual('TCLambdaCreateSite 1', site.name)
        # Attempt to clean up after ourself
        site.delete()
    
    def test_lambda_use_slug_generation(self):
        event = {
            'httpMethod': 'PUT',
            'path': '/site/',
            'resource': '/site/',
            'pathParameters': None,
            'body': json.dumps({
                "name": "TCLambdaCreateSite 1",
                "xstreet": "300 Alamo Plaza",
                "xcity": "San Antonio",
                "xzip": "78205",
                "latitude": "170.0",
                "longitude": "170.0",
                "opentime": "9am",
                "closetime": "5pm",
                "days": "M-F",
                "sitecoordinator": None,
                "is_open": True,
            }),
        }
        response = lambda_handler(event, None)
        self.assertIsNotNone(response)
        site = Site.from_dict(json.loads(response['body']))
        self.assertEqual('tclambdacreatesite-1', site.slug)
        self.assertEqual('TCLambdaCreateSite 1', site.name)
        # Test whether the PUT method actually generated a valid slug for us
        self.assertEqual('tclambdacreatesite-1', site.slug)
        self.assertEqual('200', response['statusCode'], 'Lambda handler failed')
        # Attempt to clean up after ourself
        site.delete()



if __name__ == '__main__':
    unittest.main()
