import unittest
import sys
import json

sys.path.insert(0, ".")
from models.site import Site
from functions.GetListOfSites import *

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

        self.site2 = Site.from_dict({
            "name": "TCLambdaUpdateSite 2",
            "slug": "TCLambdaUpdateSite-2".lower(),
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
        self.site2.save()


    def tearDown(self):
        self.site1.delete()
        self.site2.delete()

    def test_lambda_positive(self):
        initial_sites = Site.all()

        self.assertTrue(len(initial_sites) > 0, "No sites available for DeleteSite to destroy")
        event = {
            'httpMethod': 'GET',
            'path': '/site/',
            'resource': '/site/',
            'pathParameters': None,
            'body': None,
        }
        response = lambda_handler(event, None)
        self.assertEqual('200', response['statusCode'])

        # Parse the response body so that we can validate the contents
        sites_dict = json.loads(response['body'])
        sites= []
        for site_dict in sites_dict:
            sites.append(Site.from_dict(site_dict))
        
        # Check whether the correct number of site records was returned
        self.assertEqual(len(initial_sites), len(sites))
        self.assertTrue(len(sites) >= 2, 'GetListOfSites unittest setUp did not actually create any test data to fetch')

        # Make sure they're all valid
        for site in sites:
            self.assertTrue(site.is_valid(), "Site failed to validate: " + site.to_json())

        # Check whether the site count has changed
        self.assertEqual(len(initial_sites), len(Site.all()))


if __name__ == '__main__':
    unittest.main()
