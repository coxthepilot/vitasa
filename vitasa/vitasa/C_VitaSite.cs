using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace vitasa
{
    public class C_VitaSite
    {
        public string SiteName = null;
        public string SiteSlug = null;
        public string SiteStreet = null;
        public string SiteCity = null;
        public string SiteState = null;
        public string SiteZip = null;
        public string SiteLatitude = null;
        public string SiteLongitude = null;
        public string SiteOpenTime = null;
        public string SiteCloseTime = null;
        public string SiteDays = null;
        public string SiteCoordinator = null;
        public string SiteType = null;
        public string SiteIsOpen = null;

        public static readonly string N_SiteName = "name";
        public static readonly string N_SiteSlug = "slug";
        public static readonly string N_SiteStreet = "xstreet";
        public static readonly string N_SiteCity = "xcity";
		public static readonly string N_SiteState = "xstate";
		public static readonly string N_SiteZip = "xzip";
		public static readonly string N_SiteLatitude = "latitude";
		public static readonly string N_SiteLongitude = "longitude";
		public static readonly string N_SiteOpenTime = "opentime";
		public static readonly string N_SiteCloseTime = "closetime";
		public static readonly string N_SiteDays = "days";
		public static readonly string N_SiteCoordinator = "sitecoordinator";
		public static readonly string N_SiteType = "sitetype";
        public static readonly string N_SiteIsOpen = "isopen";

        /// <summary>
        /// Create a new site with null values for all fields
        /// </summary>
		public C_VitaSite()
        {
        }

        /// <summary>
        /// Create a vita site from the json values, read from the web service
        /// </summary>
        /// <param name="j">Must be Parsed already</param>
        public C_VitaSite(JsonValue j)
        {
            // todo: validate the jsonvalue type

			if (j.ContainsKey(N_SiteName))
                SiteName = j[N_SiteName];

            if (j.ContainsKey(N_SiteSlug))
                SiteSlug = j[N_SiteSlug];

			if (j.ContainsKey(N_SiteStreet))
				SiteStreet = j[N_SiteStreet];

			if (j.ContainsKey(N_SiteCity))
                SiteCity = j[N_SiteCity];

			if (j.ContainsKey(N_SiteState))
                SiteState = j[N_SiteState];

			if (j.ContainsKey(N_SiteZip))
                SiteZip = j[N_SiteZip];

			if (j.ContainsKey(N_SiteLatitude))
                SiteLatitude = j[N_SiteLatitude];

			if (j.ContainsKey(N_SiteLongitude))
                SiteLongitude = j[N_SiteLongitude];

			if (j.ContainsKey(N_SiteOpenTime))
                SiteOpenTime = j[N_SiteOpenTime];

			if (j.ContainsKey(N_SiteCloseTime))
                SiteCloseTime = j[N_SiteCloseTime];

			if (j.ContainsKey(N_SiteDays))
                SiteDays = j[N_SiteDays];

			if (j.ContainsKey(N_SiteCoordinator))
                SiteCoordinator = j[N_SiteCoordinator];

			if (j.ContainsKey(N_SiteType))
                SiteType = j[N_SiteType];

            if (j.ContainsKey(N_SiteIsOpen))
                SiteIsOpen = j[N_SiteIsOpen];
		}

        /// <summary>
        /// Imports the sites.
        /// </summary>
        /// <returns>A list of sites found in the json</returns>
        /// <param name="json">the value from the backend services that has been Parsed</param>
        public static List<C_VitaSite> ImportSites(JsonValue json)
        {
            // todo: validate the format of the inpute (somehow); JsonValue seems to be anything

            // create the holding place for the results
            List<C_VitaSite> res = new List<C_VitaSite>();
            foreach(JsonValue j in json)
            {
                C_VitaSite vs = new C_VitaSite(j);
                res.Add(vs);
			}
            
            return res;
        }

		public static async Task<JsonValue> FetchSitesList()
		{
            string vitaCoreUrl = "https://s3-us-west-2.amazonaws.com/vitasa-static-content-dev/sites.json";
			//string vitaCoreUrl = "https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites";

			// Create an HTTP web request using the URL:
			HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(new Uri(vitaCoreUrl));
			request.ContentType = "application/json";
			request.Method = "GET";

			// Send the request to the server and wait for the response:
			using (WebResponse response = await request.GetResponseAsync())
			{
				// Get a stream representation of the HTTP web response:
				using (Stream stream = response.GetResponseStream())
				{
					// Use this stream to build a JSON document object:
					JsonValue jsonDoc = await Task.Run(() => JsonObject.Load(stream));
					//Console.Out.WriteLine("Response: {0}", jsonDoc.ToString());

					JsonValue jv = jsonDoc;
                    if (jsonDoc is JsonObject)
                    {
                        try { jv = JsonValue.Parse(jsonDoc); }
                        catch (Exception e) 
                        { 
                            Console.WriteLine(e.Message); 
                        }
                    }

					// Return the JSON document:
                    return jv;
				}
			}
		}

        public static void AddDummySites(List<C_VitaSite> SitesList)
        {
			// for testing only
			C_VitaSite s0 = new C_VitaSite();
			s0.SiteName = "Guadalupe Community Center";
			s0.SiteSlug = "guadalupe-community-center";
			s0.SiteStreet = "1801 W Cesar Chavez Blvd";
			s0.SiteCity = "San Antonio";
			s0.SiteState = "TX";
			s0.SiteZip = "78207";
			s0.SiteLatitude = "29.4230749";
			s0.SiteLongitude = "-98.5198977";
			s0.SiteOpenTime = "8:30";
			s0.SiteCloseTime = "16:30";
			s0.SiteDays = "mwf";
			s0.SiteCoordinator = "Rosio";
			s0.SiteType = "permanent";
			s0.SiteIsOpen = "true";
			SitesList.Add(s0);

			C_VitaSite s1 = new C_VitaSite();
			s1.SiteName = "Presa Community Center";
			s1.SiteSlug = "presa-community-center";
			s1.SiteStreet = "3721 S Presa Street";
			s1.SiteCity = "San Antonio";
			s1.SiteState = "TX";
			s1.SiteZip = "78210";
			s1.SiteLatitude = "29.386249";
			s1.SiteLongitude = "-98.4815702";
			s1.SiteOpenTime = "8:30";
			s1.SiteCloseTime = "16:30";
			s1.SiteDays = "tw";
			s1.SiteCoordinator = "Fred";
			s1.SiteType = "permanent";
			s1.SiteIsOpen = "false";
			SitesList.Add(s1);

			C_VitaSite s2 = new C_VitaSite();
			s2.SiteName = "Claude Black Community Center";
			s2.SiteSlug = "claude-black-community-center";
			s2.SiteStreet = "2915 E Commerce Street";
			s2.SiteCity = "San Antonio";
			s2.SiteState = "TX";
			s2.SiteZip = "78203";
			s2.SiteLatitude = "29.4200353";
			s2.SiteLongitude = "-98.44685";
			s2.SiteOpenTime = "8:30";
			s2.SiteCloseTime = "16:30";
			s2.SiteDays = "sasu";
			s2.SiteCoordinator = "Jaquie";
			s2.SiteType = "permanent";
			s2.SiteIsOpen = "true";
			SitesList.Add(s2);
		}

	}
}
