using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;

namespace zsquared
{
	public enum E_SiteStatus { Closed, Accepting, NearLimit, NotAccepting, Unknown }

	public class C_VitaSite
    {
        public int ID = -1;
        public string Name = null;
        public string Slug = null;
        public string Street = null;
        public string City = null;
        public string State = null;
        public string Zip = null;
        public string Latitude = null;
        public string Longitude = null;
        public string Hours = null;
        public string PrimaryCoordinator = null;
        public string BackupCoordinator = null;
        public string Type = null;
        public string PlaceID = null;
        public E_SiteStatus Status = E_SiteStatus.Unknown;
        public string ManagingRegion = null;

		public static readonly string N_ID = "id";
        public static readonly string N_Name = "name";
        public static readonly string N_Slug = "slug";
        public static readonly string N_Street = "street";
        public static readonly string N_City = "city";
        public static readonly string N_State = "state";
        public static readonly string N_Zip = "zip";
		public static readonly string N_Latitude = "latitude";
        public static readonly string N_Longitude = "longitude";
        public static readonly string N_Hours = "hours";
        public static readonly string N_Coordinator = "sitecoordinator";
        public static readonly string N_BackupCoordinator = "sitebackupcoordinator";
		public static readonly string N_Type = "sitetype";
        public static readonly string N_Status = "sitestatus";
        public static readonly string N_PlaceID = "google_place_id";
        public static readonly string N_ManagingRegion = "managingregion";

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
            if (!(j is JsonObject))
                throw new ApplicationException("we can only work with an object");

            if (j.ContainsKey(N_ID))
                ID = j[N_ID];

			if (j.ContainsKey(N_Name))
                Name = j[N_Name];

            if (j.ContainsKey(N_Slug))
                Slug = j[N_Slug];

			if (j.ContainsKey(N_Street))
				Street = j[N_Street];

			if (j.ContainsKey(N_City))
                City = j[N_City];

			if (j.ContainsKey(N_State))
                State = j[N_State];

			if (j.ContainsKey(N_Zip))
                Zip = j[N_Zip];

			if (j.ContainsKey(N_Latitude))
                Latitude = j[N_Latitude];

			if (j.ContainsKey(N_Longitude))
                Longitude = j[N_Longitude];

			if (j.ContainsKey(N_Hours))
                Hours = j[N_Hours];

			if (j.ContainsKey(N_Coordinator))
                PrimaryCoordinator = j[N_Coordinator];

            if (j.ContainsKey(N_BackupCoordinator))
                BackupCoordinator = j[N_BackupCoordinator];

			if (j.ContainsKey(N_Type))
                Type = j[N_Type];

            if (j.ContainsKey(N_PlaceID))
                PlaceID = j[N_PlaceID];

            if (j.ContainsKey(N_ManagingRegion))
                ManagingRegion = j[N_ManagingRegion];

			if (j.ContainsKey(N_Status))
            {
                string ssv = j[N_Status];
                string ssvl = ssv.ToLower();

                foreach (E_SiteStatus ss in Enum.GetValues(typeof(E_SiteStatus)))
                {
                    string ssl = ss.ToString().ToLower();
                    if (ssvl == ssl)
                    {
                        Status = ss;
                        break;
                    }
                }
            }
		}

        /// <summary>
        /// Imports the sites.
        /// </summary>
        /// <returns>A list of sites found in the json</returns>
        /// <param name="json">the value from the backend services that has been Parsed</param>
        public static List<C_VitaSite> ImportSites(JsonValue json)
        {
            if (!(json is JsonArray))
                throw new ApplicationException("the sites list must be an array");

            // create the holding place for the results
            List<C_VitaSite> res = new List<C_VitaSite>();
            foreach(JsonValue j in json)
            {
                C_VitaSite vs = new C_VitaSite(j);
                res.Add(vs);
			}
            
            return res;
        }

		public static async Task<List<C_VitaSite>> FetchSitesList()
		{
            string sitesUrl = C_Vita.VitaCoreUrl + "/sites";
			// Create an HTTP web request using the URL:
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(new Uri(sitesUrl));
			//request.Headers.Add(HttpRequestHeader.Accept, "application/json");
            request.Accept = "application/json";
			//request.ContentType = "application/json";
			request.Method = "GET";

			// Send the request to the server and wait for the response:
			using (WebResponse response = await request.GetResponseAsync())
			{
				// Get a stream representation of the HTTP web response:
				using (Stream stream = response.GetResponseStream())
				{
                    // todo: make sure they responded with an application/json response
                    // todo: make sure we got response code 200 (ok)

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

                    List<C_VitaSite> siteslist = ImportSites(jv);

                    return siteslist;
				}
			}
		}

        public async Task<bool> UpdateSiteStatus(E_SiteStatus newSiteStatus, string token)
        {
            // post on {url}/sites/{site-slug}
            // body is json with the setting to update

            if ((Slug == null) || (Slug.Length == 0))
                throw new ApplicationException("slug must not be null or empty");

            if (Status == newSiteStatus)
                return true;

			// todo: move over to use SSL; hangs if using SSL
			//SetupCertificateHandling(); // only needed if SSL
			string updateurl = "/sites/" + Slug;
            string fullUpdateurl = C_Vita.VitaCoreUrl + updateurl;

            string bodyjson = "{ \"sitestatus\" : \"" + newSiteStatus.ToString() + "\"}";

            bool error = false;
            try
            {
                WebClient wc = new WebClient();
                wc.BaseAddress = C_Vita.VitaCoreUrl;

                wc.Headers.Add(HttpRequestHeader.Cookie, token);
                wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);

                byte[] responseBytes = await wc.UploadDataTaskAsync(updateurl, "PUT", dataBytes);

                string responseString = Encoding.UTF8.GetString(responseBytes);

                try
                {
                    JsonValue responseJson = JsonValue.Parse(responseString);

                    if (responseJson.ContainsKey(N_Status))
                    {
                        string ssv = responseJson[N_Status];
                        E_SiteStatus nss = E_SiteStatus.Unknown;
                        // convert string to enum
                        foreach (E_SiteStatus ss in Enum.GetValues(typeof(E_SiteStatus)))
                        {
                            if (ssv == ss.ToString())
                            {
                                nss = ss;
                                break;
                            }
                        }

                        if (nss != E_SiteStatus.Unknown)
                        {
                            // if the new site status is not what we asked for, then error
                            error = nss != newSiteStatus;
                            if (error)
                                Console.WriteLine("Site status after update was not what we requested");
                            else
                                // since no error, make our site status reflect the new value
                                Status = nss;
                        }
                        else
                        {
                            // the site status returned is not in our enum
                            error = true;
                            Console.WriteLine("Site status after update was not in our enum");
                        }
                    }
                    else
                    {
                        // response did not contain our site status
                        error = true;
						Console.WriteLine("Site status was not present in our response");
					}
                }
                catch (Exception e)
                {
                    Console.WriteLine("Attempt to parse response failed: " + e.Message);
                    error = true;
                }            
            }
            catch (Exception e)
            {
                Console.WriteLine("Attempt to update site status failed: " + e.Message);
                error = true;
            }

  			return !error;
        }

        public static int CompareSitesByNameAscending(C_VitaSite s1, C_VitaSite s2)
		{
			return s1.Name.CompareTo(s2.Name);
		}

	}
}
