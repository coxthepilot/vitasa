import unittest
import sys
sys.path.insert(0, ".")
from models.site import Site

class TCSiteSlugify(unittest.TestCase):
    def test_slugify_good(self):
        good_slugs = [ 'valid-slug', 'validslug', 'v', 'numbersareokay123', '456evenatthestart' ]
        for slug in good_slugs:
            self.assertEqual(slug, Site.slugify(slug))

    def test_bad_slugs(self):
        bad_slugs = {
            'invalid slug': 'invalid-slug',
            'InvalidSlug': 'invalidslug',
            'Chris\' awesome Site': 'chris-awesome-site',
            'invalid slug ': 'invalid-slug',
            'invalid slug-': 'invalid-slug',
            'invalid slug"': 'invalid-slug',
            'invalid slug&': 'invalid-slug',
        }
        for bad_slug, good_slug in bad_slugs.items():
            self.assertEqual(good_slug, Site.slugify(bad_slug), "Failed to correctly slugify '{}' into '{}'".format(bad_slug, good_slug))

if __name__ == '__main__':
    unittest.main()
