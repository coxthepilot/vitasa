using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using ModernHttpClient;
using Xamarin.Forms;

namespace vitasa
{
    // chris: slug being sent? ssl only on /login? login on root url; what to send on cookie?
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
        //public bool SiteIsOpen = false;
        public enum E_SiteStatus {Open, Closed, Accepting, NearLimit, NotAccepting, Unknown }
        public E_SiteStatus SiteStatus = E_SiteStatus.Unknown;

        public static readonly string N_SiteName = "name";
        public static readonly string N_SiteSlug = "slug";
        public static readonly string N_SiteStreet = "street";
        public static readonly string N_SiteCity = "city";
		public static readonly string N_SiteState = "state";
		public static readonly string N_SiteZip = "zip";
		public static readonly string N_SiteLatitude = "latitude";
		public static readonly string N_SiteLongitude = "longitude";
		public static readonly string N_SiteOpenTime = "opentime";
		public static readonly string N_SiteCloseTime = "closetime";
		public static readonly string N_SiteDays = "days";
		public static readonly string N_SiteCoordinator = "sitecoordinator";
		public static readonly string N_SiteType = "sitetype";
        //public static readonly string N_SiteIsOpen = "is_open";
        public static readonly string N_SiteStatus = "sitestatus";

		public static string vitaCoreUrl = "http://vitasa.abandonedfactory.net";
		public static string vitaCoreUrlSSL = "https://vitasa.abandonedfactory.net";
		//string vitaCoreUrl = "https://s3-us-west-2.amazonaws.com/vitasa-static-content-dev/sites.json";
		//string vitaCoreUrl = "https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites";

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
            // todo: validate the SystemJson.Json.Jsonvalue type

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

            //if (j.ContainsKey(N_SiteIsOpen))
            //    SiteIsOpen = j[N_SiteIsOpen];

            if (j.ContainsKey(N_SiteStatus))
            {
                string ssv = j[N_SiteStatus];
                foreach (E_SiteStatus ss in Enum.GetValues(typeof(E_SiteStatus)))
                {
                    if (ssv == ss.ToString())
                    {
                        SiteStatus = ss;
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
            // todo: validate the format of the input (somehow); JsonValue seems to be anything

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
            string sitesUrl = vitaCoreUrl + "/sites";
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
                    return jv;
				}
			}
		}

        public async Task<bool> UpdateSiteStatus(E_SiteStatus newSiteStatus, string token)
        {
            // post on {url}/sites/{site-slug}
            // body is json with the setting to update

            if ((SiteSlug == null) || (SiteSlug.Length == 0))
                throw new ApplicationException("slug must not be null or empty");

			// todo: move over to use SSL; hangs if using SSL
			//SetupCertificateHandling(); // only needed if SSL
			string updateurl = "/sites/" + SiteSlug;
            string fullUpdateurl = vitaCoreUrl + updateurl;

            string bodyjson = "{ \"sitestatus\" : \"" + newSiteStatus.ToString() + "\"}";

            bool error = false;
            try
            {
                WebClient wc = new WebClient();
                wc.BaseAddress = vitaCoreUrl;

                wc.Headers.Add(HttpRequestHeader.Cookie, token);
                wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);

                byte[] responseBytes = await wc.UploadDataTaskAsync(updateurl, "PUT", dataBytes);

                string responseString = Encoding.UTF8.GetString(responseBytes);

                try
                {
                    JsonValue responseJson = JsonValue.Parse(responseString);

                    if (responseJson.ContainsKey(N_SiteStatus))
                    {
                        string ssv = responseJson[N_SiteStatus];
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
                                SiteStatus = nss;
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

        public static async Task<string> PerformLogin(string userName, string userPassword)
        {
			string loginUrl = "/login";

			var client = new HttpClient();
            client.BaseAddress = new Uri(vitaCoreUrlSSL);

            string jsonData = "{\"email\" : \"" + userName + "\", \"password\" : \"" + userPassword + "\"}";

            SetupCertificateHandling();

            var content = new StringContent(jsonData, Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(loginUrl, content);

            var result = await response.Content.ReadAsStringAsync();

            if (response.StatusCode != HttpStatusCode.OK)
                return null;

            JsonValue jv = JsonValue.Parse(result);
            if (!jv.ContainsKey("message") || (jv["message"] != "Login successful"))
                return null;

            var headers = response.Headers;
            string setCookie = null;
            foreach (KeyValuePair<string, IEnumerable<string>> kvp in headers)
            {
                if (kvp.Key == "Set-Cookie")
                {
                    foreach (string sc in kvp.Value)
                    {
                        setCookie = sc;
                        break;
                    }
                }
            }

            string token = null;
            string[] tokens = setCookie.Split(new char[] { ';' });
            foreach(string tok in tokens)
            {
                if (tok.Contains("_rails-base_session"))
                {
                    token = tok;
                    break;
                }
            }

            return token;
		}

        private static void SetupCertificateHandling()
        {
			ServicePointManager.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) =>
			{
				System.Security.Cryptography.X509Certificates.X509Certificate cert = (System.Security.Cryptography.X509Certificates.X509Certificate)certificate;
				string issuer = cert.Issuer;
				string[] issuers = issuer.Split(new char[] { '=' });
				bool res = issuers.Length == 2;
				if (res)
					res = issuers[1] == "vitasa.abandonedfactory.net";

				return res;
			};

		}
	}
}
