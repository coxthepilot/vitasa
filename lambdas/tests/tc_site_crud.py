import unittest
import sys
sys.path.insert(0, ".")
from models.site import Site

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
    
    def test_get_all(self):
        starting_sites = Site.all()

        site1 = Site()
        site1.name = 'Chris\' Awesome All Site #1'
        site1.slug = 'chris-awesome-all-site-1'
        site1.xstreet = '1234 Fake Street'
        site1.xcity = 'Universal City'
        site1.xzip = '78005'
        site1.latitude = '175.1'
        site1.longitude = '176.0'
        site1.opentime = '10am'
        site1.closetime = '6pm'
        site1.days = 'M-T'
        site1.sitecoordinator = None # TODO: test variations of this too
        site1.sitetype = 'Tax Preparation'
        site1.is_open = True
        site1.save()

        site2 = Site()
        site2.name = 'Chris\' Awesome All Site #2'
        site2.slug = 'chris-awesome-all-site-2'
        site2.xstreet = '1234 Fake Street'
        site2.xcity = 'Universal City'
        site2.xzip = '78005'
        site2.latitude = '175.1'
        site2.longitude = '176.0'
        site2.opentime = '10am'
        site2.closetime = '6pm'
        site2.days = 'M-T'
        site2.sitecoordinator = None # TODO: test variations of this too
        site2.sitetype = 'Tax Preparation'
        site2.is_open = True
        site2.save()

        sites = Site.all()
        self.assertTrue( len(sites) > 0, 'No sites found with Site.all()')
        
        self.assertEqual(len(starting_sites) + 2, len(Site.all()), 'Site.all() somehow altered the record count')
        
        site1.delete()
        site2.delete()
        self.assertEqual(len(starting_sites), len(Site.all()), 'test_get_all failed to clean up after itself')
        
    def test_create_new(self):
        # Keep track of the initial set, so that we can discern which changes were caused by this test
        starting_sites = Site.all()

        site = Site()
        site.name = 'Chris\' Awesome Test Site #1'
        site.slug = 'chris-awesome-test-site-1'
        site.xstreet = '1234 Fake Street'
        site.xcity = 'Universal City'
        site.xzip = '78005'
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
            self.assertFalse(site.is_valid(), "This slug should have been invalid: " + site.slug)

    def test_site_auto_slugify(self):
        bad_slugs = {
            'invalid slug': 'invalid-slug',
            'InvalidSlug': 'invalidslug',
            'Chris\' awesome Site': 'chris-awesome-site',
            'invalid slug ': 'invalid-slug',
            'invalid slug-': 'invalid-slug',
            'invalid slug"': 'invalid-slug',
            'invalid slug&': 'invalid-slug',
        }
        
        for name, slug in bad_slugs.items():
            site = Site()
            site.name = name
            # Intentionally leave the slug field empty
            #site.slug = 'chris-awesome-test-site-slugification'
            site.xstreet = '1234 Fake Street'
            site.xcity = 'Universal City'
            site.xzip = '78005'
            site.latitude = '175.1'
            site.longitude = '176.0'
            site.opentime = '10am'
            site.closetime = '6pm'
            site.days = 'M-T'
            site.sitecoordinator = None # TODO: test variations of this too
            site.sitetype = 'Tax Preparation'
            site.is_open = True

            # This is an invalid site right now, due to the lack of a valid slug
            self.assertFalse(site.is_valid())

            # It should still save correctly, by automatically slugifying the site.name
            save_result = site.save()
            self.assertEqual(200, save_result)

            # So after the save, it should now be valid
            self.assertTrue(site.is_valid())
            self.assertEqual(slug, site.slug, 'The site did not correctly auto-slugify on save')

            # Cleanup
            site.delete()

if __name__ == '__main__':
    unittest.main()
