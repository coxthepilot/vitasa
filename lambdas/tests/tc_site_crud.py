import unittest
import sys
sys.path.insert(0, ".")
from models.site import Site
from decimal import Decimal

# TODO: Swtich to pytest from unittest
#import pytest
# @pytest.fixture(scope='module')
# def test_site_1():
#     site = Site()
#     site.name = 'test_site_1'
#     site.xstreet = '123 Fake Street'
#     site.xcity = 'San Antonio'
#     site.xzip = '78006'
#     site.latitude = 175.0
#     site.longitude = 175.0
#     site.opentime = '9am'
#     site.closetime = '5pm'
#     site.days = 'M-F'
#     site.sitecoordinator = None 
#     site.sitetype = 'Tax Preparation'
#     site.is_open = True
#     return site


class TCSiteCrud(unittest.TestCase):
    def test_get_one(self):
        site = Site.find('chris-awesome-test-site-2')
        self.assertIsNotNone(site, 'Default site not found. This probably needs to be created manually')
        self.assertEqual('Chris\' Awesome Test Site #2', site.name)
        self.assertEqual('chris-awesome-test-site-2', site.slug)
        self.assertEqual("1234 Fake Street", site.xstreet)
        self.assertEqual('Universal City', site.xcity)
        self.assertEqual('78005', site.xzip)
        # self.assertEqual(Decimal('175.1'), site.latitude)
        # self.assertEqual(Decimal('176.0'), site.longitude)
        self.assertEqual('175.1', site.latitude)
        self.assertEqual('176.0', site.longitude)
        self.assertEqual('10am', site.opentime)
        self.assertEqual('6pm', site.closetime)
        self.assertEqual('M-T', site.days)
        self.assertEqual(None, site.sitecoordinator)
        self.assertEqual(True, site.is_open)
        

    def test_get_all(self):
        starting_sites = Site.all()

        sites = Site.all()
        self.assertTrue( len(sites) > 0, 'No sites found with Site.all()')
        site = sites[0]
        self.assertEqual('Chris\' Awesome Test Site #2', site.name)
        self.assertEqual('chris-awesome-test-site-2', site.slug)
        self.assertEqual("1234 Fake Street", site.xstreet)
        self.assertEqual('Universal City', site.xcity)
        self.assertEqual('78005', site.xzip)
        # self.assertEqual(Decimal('175.1'), site.latitude)
        # self.assertEqual(Decimal('176.0'), site.longitude)
        self.assertEqual('175.1', site.latitude)
        self.assertEqual('176.0', site.longitude)
        self.assertEqual('10am', site.opentime)
        self.assertEqual('6pm', site.closetime)
        self.assertEqual('M-T', site.days)
        self.assertEqual(None, site.sitecoordinator)
        self.assertEqual(True, site.is_open)

        self.assertEqual(len(starting_sites), len(Site.all()), 'Site.all() somehow altered the record count')
        
    def test_create_new(self):
        # Keep track of the initial set, so that we can discern which changes were caused by this test
        starting_sites = Site.all()

        site = Site()
        site.name = 'Chris\' Awesome Test Site #1'
        site.slug = 'chris-awesome-test-site-1'
        site.xstreet = '1234 Fake Street'
        site.xcity = 'Universal City'
        site.xzip = '78005'
        # site.latitude = Decimal('175.1')
        # site.longitude = Decimal('176.0')
        site.latitude = '175.1'
        site.longitude = '176.0'
        site.opentime = '10am'
        site.closetime = '6pm'
        site.days = 'M-T'
        site.sitecoordinator = None # TODO: test variations of this too
        site.sitetype = 'Tax Preparation'

        site.is_open = True

        result = site.save()
        self.assertEqual(200, result, 'Failed to save the new site')
        # Validate that the record was indeed written out to the DB
        self.assertEqual(len(starting_sites)+1, len(Site.all()), 'No Site record was actually written')

        # # Now fetch the site data back out
        site2 = Site.find('chris-awesome-test-site-1')
        self.assertEqual('Chris\' Awesome Test Site #1', site2.name)
        self.assertEqual('chris-awesome-test-site-1', site2.slug)
        self.assertEqual("1234 Fake Street", site2.xstreet)
        self.assertEqual('Universal City', site2.xcity)
        self.assertEqual('78005', site2.xzip)
        # self.assertEqual(Decimal('175.1'), site2.latitude)
        # self.assertEqual(Decimal('176.0'), site2.longitude)
        self.assertEqual('175.1', site2.latitude)
        self.assertEqual('176.0', site2.longitude)
        self.assertEqual('10am', site2.opentime)
        self.assertEqual('6pm', site2.closetime)
        self.assertEqual('M-T', site2.days)
        self.assertEqual(None, site2.sitecoordinator)
        self.assertEqual(True, site2.is_open)
        
        # Delete the newly created site
        self.assertEqual(200, site2.delete())
        self.assertEqual(len(starting_sites), len(Site.all()), 'The site creation test failed to clean up after itself')
    
    def test_site_validation(self):
        site = Site()
        self.assertFalse(site.is_valid(), 'Default site values should not validate due to empty name and slug')

        site.name = "Valid Site Name"
        site.slug = 'valid-site-name'
        self.assertTrue(site.is_valid(), 'These hand-coded values should be valid')

        # Test some known-bad slugs
        bad_slugs = [
            'valid site name', # no whitespace
            'valid--site--name', # no repeated hyphens
            'Valid-Site-Name', # No capital letters
            'chris\'-awesome-site', # No apostrophes
        ]
        for bad_slug in bad_slugs:
            site.name = 'Valid Site Name'
            site.slug = bad_slug
            self.assertFalse(site.is_valid(), 'This slug should have been invalid: \'%(slug)\'' % site.slug)

if __name__ == '__main__':
    unittest.main()
