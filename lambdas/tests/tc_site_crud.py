import unittest
import sys
sys.path.insert(0, ".")
from models.site import Site

class TCSiteCrud(unittest.TestCase):
    def test_get_one(self):
        # TODO: this test isn't too useful without implementing some Fixtures first
        # otherwise, it requires me to manually insert the appropriate row in the table before running any tests
        site = Site.find('test_site_1')
        self.assertEqual("123 Fake Street", site.xstreet)
        self.assertEqual('San Antonio', site.xcity)
        self.assertEqual('78006', site.xzip)
        self.assertEqual('test_site_1', site.name)
        self.assertEqual('Yellow', site.availability_status)
        self.assertEqual(False, site.is_open)
        self.assertEqual('8-4', site.hours)

    def test_get_all(self):
        sites = Site.all()
        self.assertEqual(1, len(sites), 'Incorrect number of sites fetched during scan')
        self.assertEqual("123 Fake Street", sites[0].address)

    def test_create_new(self):
        # Keep track of the initial set, so that we can discern which changes were caused by this test
        starting_sites = Site.all()

        site = Site()
        site.name = 'test_site_2'
        site.xstreet = '1234 Fake Street'
        site.xcity = 'Universal City'
        site.xzip = '78005'
        site.latitude = 175.1
        site.longitude = 176.0
        site.opentime = '10am'
        site.closetime = '6pm'
        site.days = 'M-T'
        site.sitecoordinator = None # TODO: test variations of this too
        site.sitetype = 'Tax Preparation'

        site.is_open = True

        result = site.save()
        self.assertTrue(result, 'Failed to save the new site')
        # Validate that the record was indeed written out to the DB
        self.assertEqual(len(starting_sites)+1, len(Site.all()))

        # Now fetch the site data back out
        site2 = Site.find('test_site_2')
        self.assertEqual('test_site_2', site.name)
        self.assertEqual("1234 Fake Street", site.xstreet)
        self.assertEqual('Universal City', site.xcity)
        self.assertEqual('78005', site.xzip)
        self.assertEqual(175.1, site.latitude)
        self.assertEqual(176.0, site.longitude)
        self.assertEqual('10am', site.opentime)
        self.assertEqual('6pm', site.closetime)
        self.assertEqual('M-T', site.days)
        self.assertEqual(None, site.sitecoordinator)
        self.assertEqual(True, site.is_open)
        
        # Delete the newly created site
        site2.delete()
        self.assertEqual(len(starting_sites), len(Site.all()), 'The site creation test failed to clean up after itself')
    

if __name__ == '__main__':
    unittest.main()
