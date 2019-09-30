using System;
using System.Collections.Generic;
using Foundation;

namespace zsquared
{
    public static class C_PreferredSitesX
    {
        public static List<string> GetPreferredSites()
        {
            List<string> res = new List<string>();

            string psites = NSUserDefaults.StandardUserDefaults.StringForKey("preferredsites");
            if (string.IsNullOrWhiteSpace(psites))
                return res;

            string[] psitesa = psites.Split(new char[] { ',' });
            foreach (string s in psitesa)
                res.Add(s);

            res.Sort();

            return res;
        }

        public static void SetPreferredSite(string slug)
        {
            List<string> sites = GetPreferredSites();

            if (!sites.Contains(slug))
                sites.Add(slug);
            sites.Sort();

            string slugs = CombineSiteSlugs(sites);

            NSUserDefaults.StandardUserDefaults.SetString(slugs, "preferredsites");
        }

        public static void RemovePreferredSite(string slug)
        {
            List<string> sites = GetPreferredSites();

            if (sites.Contains(slug))
            {
                sites.Remove(slug);

                string slugs = CombineSiteSlugs(sites);

                NSUserDefaults.StandardUserDefaults.SetString(slugs, "preferredsites");
            }
        }

        private static string CombineSiteSlugs(List<string> sites)
        {
            string res = "";

            bool first = true;

            foreach(string site in sites)
            {
                if (!first)
                    res += ",";

                res += site;
                first = false;
            }

            return res;
        }
    }
}
