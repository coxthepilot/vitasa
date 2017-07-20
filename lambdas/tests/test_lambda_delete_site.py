import unittest
import sys
import json

sys.path.insert(0, ".")
from models.site import Site
from functions.DeleteSite import *

class TCLambdaDeleteSite(unittest.TestCase):
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
        self.site1.save()

    def tearDown(self):
        # The point of the test in this file is Site deletion, but we should add an extra call here to make sure.
        self.site1.delete()

    def test_lambda_positive(self):
        initial_sites = Site.all()

        self.assertTrue(len(initial_sites) > 0, "No sites available for DeleteSite to destroy")
        event = {
            'httpMethod': 'DELETE',
            'path': '/site/' + self.site1.slug,
            'resource': '/site/{sitename}',
            'pathParameters': {
                'sitename': self.site1.slug,
            },
            'body': None,
        }
        response = lambda_handler(event, None)
        self.assertEqual('200', response['statusCode'])

        # Check whether the site count has decremented
        self.assertEqual(len(initial_sites) - 1, len(Site.all()))
    
    def test_lambda_no_sitename(self):
        initial_sites = Site.all()

        self.assertTrue(len(initial_sites) > 0, "No sites available for DeleteSite to destroy")
        event = {
            'httpMethod': 'DELETE',
            'path': '/site/',
            'resource': '/site/',
            'pathParameters': None,
            'body': None,
        }
        response = lambda_handler(event, None)
        self.assertEqual('400', response['statusCode'])

        # Check whether the site count has NOT decremented
        self.assertEqual(len(initial_sites), len(Site.all()))

    def test_lambda_bad_sitename(self):
        initial_sites = Site.all()

        self.assertTrue(len(initial_sites) > 0, "No sites available for DeleteSite to destroy")
        event = {
            'httpMethod': 'DELETE',
            'path': '/site/asdf-nonexistant-site',
            'resource': '/site/{sitename}',
            'pathParameters': {
                'sitename': 'asdf-nonexistant-site',
            },
            'body': None,
        }
        response = lambda_handler(event, None)
        self.assertEqual('404', response['statusCode'])

        # Check whether the site count has NOT decremented
        self.assertEqual(len(initial_sites), len(Site.all()))


if __name__ == '__main__':
    unittest.main()
