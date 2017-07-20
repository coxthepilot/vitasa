import unittest
import sys
import json

sys.path.insert(0, ".")
from models.site import Site
from functions.UpdateSite import *

class TCLambdaUpdateSite(unittest.TestCase):
    def setUp(self):
        self.site1 = Site.from_dict({
            "name": "TCLambdaUpdateSite 1",
            "slug": "TCLambdaUpdateSite-1".lower(),
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
            'httpMethod': 'POST',
            'path': '/site/' + self.site1.slug,
            'resource': '/site/{sitename}',
            'pathParameters': {
                'sitename': self.site1.slug,
            },
            'body': json.dumps({
                "xzip": "98007"
            }),
        }
        response = lambda_handler(event, None)
        self.assertEqual('200', response['statusCode'])

        # Validate whether the single specified field was updated
        site = Site.find(self.site1.slug)
        self.assertEqual(self.site1.name, site.name)
        self.assertEqual('98007', site.xzip)

        # Check whether the site count has changed
        self.assertEqual(len(initial_sites), len(Site.all()))
    
    def test_lambda_no_sitename(self):
        initial_sites = Site.all()

        self.assertTrue(len(initial_sites) > 0, "No sites available for DeleteSite to destroy")
        event = {
            'httpMethod': 'POST',
            'path': '/site/',
            'resource': '/site/',
            'pathParameters': None,
            'body': json.dumps({
                "xzip": "98007"
            }),
        }
        response = lambda_handler(event, None)
        self.assertEqual('400', response['statusCode'])

        # Validate whether the single specified field was updated
        site = Site.find(self.site1.slug)
        self.assertEqual(self.site1.name, site.name)
        self.assertEqual(self.site1.xzip, site.xzip, 'The Site record was updated anyway, despite the error code!')

        # Check whether the site count has changed
        self.assertEqual(len(initial_sites), len(Site.all()))

    def test_lambda_bad_sitename(self):
        initial_sites = Site.all()

        self.assertTrue(len(initial_sites) > 0, "No sites available for UpdateSite to modify")
        event = {
            'httpMethod': 'POST',
            'path': '/site/asdf-nonexistant-site',
            'resource': '/site/{sitename}',
            'pathParameters': {
                'sitename': 'asdf-nonexistant-site',
            },
            'body': json.dumps({
                "xzip": "98007"
            }),
        }
        response = lambda_handler(event, None)
        self.assertEqual('404', response['statusCode'])

        # Validate whether the single specified field was updated
        site = Site.find(self.site1.slug)
        self.assertEqual(self.site1.name, site.name)
        self.assertEqual(self.site1.xzip, site.xzip, 'The Site record was updated anyway, despite the error code!')

        # Check whether the site count has NOT decremented
        self.assertEqual(len(initial_sites), len(Site.all()))


    

if __name__ == '__main__':
    unittest.main()
