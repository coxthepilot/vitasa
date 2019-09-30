using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;

using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.Gms.Common.Apis;

using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Locations;

namespace zsquared
{
    public static class C_PreferredSites
    {
        public static List<string> GetPreferredSites(Android.App.Activity a)
        {
            List<string> res = new List<string>();

            string psites = C_SharedPreferences.GetSharedPreferences(a, "preferredsites");

            if (string.IsNullOrWhiteSpace(psites))
                return res;

            string[] psitesa = psites.Split(new char[] { ',' });
            foreach (string s in psitesa)
                res.Add(s);

            res.Sort();

            return res;
        }

        public static void AddPreferredSite(Android.App.Activity a, string slug)
        {
            List<string> sites = GetPreferredSites(a);

            if (!sites.Contains(slug))
                sites.Add(slug);
            sites.Sort();

            string slugs = CombineSiteSlugs(sites);

            C_SharedPreferences.PutSharedPreferences(a, "preferredsites", slugs);
        }

        public static void RemovePreferredSite(Android.App.Activity a, string slug)
        {
            List<string> sites = GetPreferredSites(a);

            if (sites.Contains(slug))
            {
                sites.Remove(slug);

                string slugs = CombineSiteSlugs(sites);

                C_SharedPreferences.PutSharedPreferences(a, "preferredsites", slugs);
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
