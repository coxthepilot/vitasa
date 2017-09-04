using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using UIKit;

namespace zsquared
{
	public enum E_SiteStatus { Closed, Accepting, NearLimit, NotAccepting, Unknown }

	public class C_VitaSite
    {
        public static List<string> N_SiteStatus = new List<string>() { "Closed", "Accepting", "Near Limit", "At Limit" };

        public int id = -1;
        public string Name;
        public string Slug;
        public string Street;
        public string City;
        public string State;
        public string Zip;
        public string Latitude;
        public string Longitude;
		public string PlaceID;
		public int PrimaryCoordinator; // user id of user with site coordinator
		public E_SiteStatus Status = E_SiteStatus.Unknown;
		public C_SiteCalendarEntry[] SiteCalendar;
		public int BackupCoordinator;
        public List<C_CalendarEntry> CalendarOverrides;
        public List<C_WorkItem> WorkHistory;
        public List<C_WorkItem> WorkIntents;

		public static readonly string N_ID = "id";
        public static readonly string N_Name = "name";
        public static readonly string N_Slug = "slug";
        public static readonly string N_Street = "street";
        public static readonly string N_City = "city";
        public static readonly string N_State = "state";
        public static readonly string N_Zip = "zip";
		public static readonly string N_Latitude = "latitude";
        public static readonly string N_Longitude = "longitude";
		public static readonly string N_PlaceID = "google_place_id";
		public static readonly string N_Coordinator = "sitecoordinator";
        public static readonly string N_Status = "sitestatus";
		public static readonly string N_BackupCoordinator = "backup_coordinator";
        public static readonly string N_CalendarOverrides = "calendar_overrides";
        public static readonly string N_WorkHistory = "work_history";
        public static readonly string N_WorkIntents = "work_intents";

		/// <summary>
		/// Create a new site with null values for all fields
		/// </summary>
		public C_VitaSite()
        {
            SiteCalendar = new C_SiteCalendarEntry[7];
            for (int ix = 0; ix != 7; ix++)
                SiteCalendar[ix] = new C_SiteCalendarEntry();
            CalendarOverrides = new List<C_CalendarEntry>();
            WorkHistory = new List<C_WorkItem>();
            WorkIntents = new List<C_WorkItem>();
        }

        /// <summary>
        /// Create a vita site from the json values, read from the web service
        /// </summary>
        /// <param name="j">Must be Parsed already</param>
        public C_VitaSite(JsonValue j)
        {
			SiteCalendar = new C_SiteCalendarEntry[7];
			for (int ix = 0; ix != 7; ix++)
				SiteCalendar[ix] = new C_SiteCalendarEntry();
			CalendarOverrides = new List<C_CalendarEntry>();
			WorkHistory = new List<C_WorkItem>();
			WorkIntents = new List<C_WorkItem>();

			if (!(j is JsonObject))
                throw new ApplicationException("we can only work with an object");

            try
            {
                if (j.ContainsKey(N_ID))
                    id = j[N_ID];

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

                if (j.ContainsKey(N_Coordinator))
                {
                    var cv = j[N_Coordinator];
                    if (cv == null)
                        PrimaryCoordinator = 0;
                    else
                    {
                        if (cv.JsonType == JsonType.Number)
                            PrimaryCoordinator = cv;
                        else
                        {
                            try
                            {
                                string s = cv;
                                PrimaryCoordinator = s == null ? 0 : Convert.ToInt32(s);
                            }
                            catch (Exception e)
                            {
                                Console.WriteLine(e.Message);
                            }
                        }
                    }
                }

                if (j.ContainsKey(N_BackupCoordinator))
				{
					var cv = j[N_BackupCoordinator];
					if (cv == null)
                        BackupCoordinator = 0;
					else
					{
						if (cv.JsonType == JsonType.Number)
							BackupCoordinator = cv;
						else
						{
							try
							{
								string s = cv;
								BackupCoordinator = s == null ? 0 : Convert.ToInt32(s);
							}
							catch (Exception e)
							{
								Console.WriteLine(e.Message);
							}
						}
					}
				}

				if (j.ContainsKey(N_PlaceID))
                    PlaceID = j[N_PlaceID];

                if (j.ContainsKey(N_Status))
                {
                    string ssv = j[N_Status];
                    Status = Tools.StringToEnum<E_SiteStatus>(ssv);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            try
            {
                if (j.ContainsKey(N_WorkHistory))
                {
                    if (j[N_WorkHistory] is JsonArray)
                    {
                        WorkHistory = new List<C_WorkItem>();
                        JsonArray ja = (JsonArray)j[N_WorkHistory];
                        foreach (JsonValue jav in ja)
                        {
                            C_WorkItem wi = new C_WorkItem(jav);
                            WorkHistory.Add(wi);
                        }
                    }
                }
            }
            catch (Exception e)
            {
				Console.WriteLine(e.Message);
			}

            try
            {
                if (j.ContainsKey(N_WorkIntents))
                {
                    if (j[N_WorkIntents] is JsonArray)
                    {
                        WorkIntents = new List<C_WorkItem>();
                        JsonArray ja = (JsonArray)j[N_WorkIntents];
                        foreach (JsonValue jav in ja)
                        {
                            C_WorkItem wi = new C_WorkItem(jav);
                            WorkIntents.Add(wi);
                        }
                    }
                }
            }
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
			}

			try
			{
                if (j.ContainsKey(N_CalendarOverrides))
				{
                    var jv = j[N_CalendarOverrides];
					if (jv is JsonArray)
					{
                        foreach (JsonValue jav in jv)
                        {
                            C_CalendarEntry ce = new C_CalendarEntry(jav);
                            CalendarOverrides.Add(ce);
							Console.WriteLine("found calendar overrides");
						}
					}
				}
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
			}

			try
            {
                // parse through the <day of week>_<open | close | efiler> values
                foreach (string k in ((JsonObject)j).Keys)
                {
                    if ((k.Contains("_open")) || (k.Contains("_close")) || (k.Contains("_efilers")))
                    {
                        int dow = FindDayOfWeekInKey(k);
                        if (dow != -1)
                        {
                            if (k.Contains("_open"))
                                SiteCalendar[dow].OpenTime = j[k];
                            else if (k.Contains("_close"))
                                SiteCalendar[dow].CloseTime = j[k];
                            else if (k.Contains("_efilers"))
                            {
								var cv = j[k];
								if (cv == null)
									SiteCalendar[dow].NumEFilers = 0;
								else
								{
									if (cv.JsonType == JsonType.Number)
										SiteCalendar[dow].NumEFilers = cv;
									else
									{
										try
										{
											string s = cv;
											SiteCalendar[dow].NumEFilers = s == null ? 0 : Convert.ToInt32(s);
										}
										catch (Exception e)
										{
											Console.WriteLine(e.Message);
										}
									}
								}
                            }
                        }
                    }
                }
            }
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
			}
		}

        private int FindDayOfWeekInKey(string k)
        {
            int res = -1;

            if (k.Contains("monday"))
                res = 1;
            else if (k.Contains("tuesday"))
                res = 2;
			else if (k.Contains("wednesday"))
				res = 3;
			else if (k.Contains("thursday"))
				res = 4;
			else if (k.Contains("friday"))
				res = 5;
			else if (k.Contains("saturday"))
				res = 6;
			else if (k.Contains("sunday"))
				res = 0;

			return res;
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

        public static List<C_VitaSite> FetchSitesList()
        {
            List<C_VitaSite> siteslist = null;

            string sitesUrl = C_Vita.VitaCoreUrlSSL + "/sites";
            C_Vita.SetupCertificateHandling();

			WebClient wc = new WebClient()
            {
                BaseAddress = C_Vita.VitaCoreUrlSSL
            };
            wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
            wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

            try
            {
                string ds = wc.DownloadString(new Uri(sitesUrl));
                JsonValue jdoc = JsonValue.Parse(ds);
				siteslist = ImportSites(jdoc);
			}
            catch (Exception e2)
            {
                Console.WriteLine(e2.Message);
                siteslist = null;
            }

			return siteslist;
		}

        public async Task<bool> UpdateDefaultCalendar(int dayOfWeek, C_HMS openTime, C_HMS closeTime, int numefilers, string token)
        {
            if ((dayOfWeek < 0) || (dayOfWeek > 6))
                throw new ApplicationException("day of week value must be 0..6");
            if (numefilers < 0)
                throw new ApplicationException("number of efilers must be greater than 0");

            string dows = C_YMD.DayOfWeekNames[dayOfWeek].ToLower();
            string n_opentime = dows + "_open";
            string n_closetime = dows + "_close";
            string n_numefilers = dows + "_efilers";

            string bodyjson = "{"
                  + "\"" + n_opentime + "\" : \"" + openTime.ToString("hh:mm") + "\""
                  + ",\"" + n_closetime + "\" : \"" + closeTime.ToString("hh:mm") + "\""
                  + ",\"" + n_numefilers + "\" : \"" + numefilers.ToString() + "\""
                    + "}";

            bool success = false;
            try
            {
                JsonValue responseJson = await UpdateSite(bodyjson, token);

                bool bad = !responseJson.ContainsKey(n_opentime);
                bad |= !responseJson.ContainsKey(n_closetime);
                bad |= !responseJson.ContainsKey(n_numefilers);

                // todo: should check the values also...

                success = !bad;

                if (success)
                {
                    SiteCalendar[dayOfWeek].OpenTime = openTime.ToString("hh:mm");
                    SiteCalendar[dayOfWeek].CloseTime = closeTime.ToString("hh:mm");
                    SiteCalendar[dayOfWeek].NumEFilers = numefilers;
				}
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            return success;
        }

        public async Task<bool> CreateCalendarException(string token, C_CalendarEntry calEntry)
        {
            string isClosed = calEntry.OpenTime == calEntry.CloseTime ? "true" : "false";
			string bodyjson = "{ " 
                + "\"date\" : \"" + calEntry.Date.ToString("yyyy-mm-dd") + "\""
                + ",\"open\" : \"" + calEntry.OpenTime.ToString("hh:mm") + "\""
				+ ",\"close\" : \"" + calEntry.CloseTime.ToString("hh:mm") + "\""
                + ",\"is_closed\" : \"" + isClosed + "\""
                + ",\"efilers_needed\" : \"" + calEntry.NumEFilers.ToString() + "\""
				+ ",\"backup_coordinator_today\" : \"" + "false" + "\""
				+ "}";

			bool success = false;

			// todo: move over to use SSL; hangs if using SSL
			//SetupCertificateHandling(); // only needed if SSL

			string updateurl = "/sites/" + Slug + "/calendars/";
			//string fullUpdateurl = C_Vita.VitaCoreUrl + updateurl;
            C_Vita.SetupCertificateHandling();
			try
			{
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);

				byte[] responseBytes = await wc.UploadDataTaskAsync(updateurl, "POST", dataBytes);

				string responseString = Encoding.UTF8.GetString(responseBytes);

				JsonValue res = JsonValue.Parse(responseString);
                // verify that we got what we wanted

                Console.WriteLine("yipee");

                // add it to the current Site instance
                CalendarOverrides.Add(calEntry);

                success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to update site status failed: " + e.Message);
                success = false;
			}

			return success;
		}

		public async Task<bool> UpdateCalendarException(string token, C_CalendarEntry calEntry)
		{
			string isClosed = calEntry.OpenTime == calEntry.CloseTime ? "true" : "false";
			string bodyjson = "{ "
				+ "\"date\" : \"" + calEntry.Date.ToString("yyyy-mm-dd") + "\""
				+ ",\"open\" : \"" + calEntry.OpenTime.ToString("hh:mm") + "\""
				+ ",\"close\" : \"" + calEntry.CloseTime.ToString("hh:mm") + "\""
				+ ",\"efilers_needed\" : \"" + calEntry.NumEFilers.ToString() + "\""
				+ ",\"is_closed\" : \"" + isClosed + "\""
				+ ",\"backup_coordinator_today\" : \"" + "false" + "\""
				+ "}";

			bool success = false;

			// todo: move over to use SSL; hangs if using SSL
			//SetupCertificateHandling(); // only needed if SSL

            string updateurl = "/sites/" + Slug + "/calendars/" + calEntry.id.ToString();
            C_Vita.SetupCertificateHandling();
			try
			{
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);

				byte[] responseBytes = await wc.UploadDataTaskAsync(updateurl, "PUT", dataBytes);

				string responseString = Encoding.UTF8.GetString(responseBytes);

				JsonValue res = JsonValue.Parse(responseString);
				// verify that we got what we wanted

				Console.WriteLine("yipee");

                // should already be updated

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to update site status failed: " + e.Message);
				success = false;
			}

			return success;
		}

		public async Task<bool> RemoveCalendarException(string token, C_CalendarEntry calEntry)
		{
			bool success = false;

            string updateurl = "/sites/" + Slug + "/calendars/" + calEntry.id.ToString();
            C_Vita.SetupCertificateHandling();
			try
			{
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                byte[] dataBytes = Encoding.UTF8.GetBytes("{[]}");

				byte[] responseBytes = await wc.UploadDataTaskAsync(updateurl, "DELETE", dataBytes);

				string responseString = Encoding.UTF8.GetString(responseBytes);

				JsonValue res = JsonValue.Parse(responseString);
				// verify that we got what we wanted

				Console.WriteLine("yipee");

                // remove the calendar entry from this instance
                CalendarOverrides.Remove(calEntry);

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to update site status failed: " + e.Message);
				success = false;
			}

			return success;		
        }

		public async Task<bool> UpdateSiteStatus(E_SiteStatus newSiteStatus, string token)
        {
			// post on {url}/sites/{site-slug}
			// body is json with the setting to update

			if (string.IsNullOrEmpty(Slug))
                throw new ApplicationException("slug must not be null or empty");

            if (Status == newSiteStatus)
                return true;

            string bodyjson = "{ \"sitestatus\" : \"" + newSiteStatus.ToString() + "\"}";

            bool success = false;
			try
			{
                JsonValue responseJson = await UpdateSite(bodyjson, token);

                // make sure we got what we expected
				if (responseJson.ContainsKey(N_Status))
				{
					string ssv = responseJson[N_Status];
                    E_SiteStatus nss = Tools.StringToEnum<E_SiteStatus>(ssv);

					// if the new site status is not what we asked for, then error
                    success = nss == newSiteStatus;
                    if (!success)
                        Console.WriteLine("Site status after update was not what we requested");
                    else
                        // since no error, make our site status reflect the new value
                        Status = nss;
				}
				else
				{
					// response did not contain our site status
					Console.WriteLine("Site status was not present in our response");
				}
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to parse response failed: " + e.Message);
			}

            return success;
        }

        /// <summary>
        /// Update a field or set of fields on this site
        /// </summary>
        /// <returns>true on success</returns>
        /// <param name="jsonString">Json string.</param>
        /// <param name="token">Token.</param>
        private async Task<JsonValue> UpdateSite(string jsonString, string token)
        {
			// todo: move over to use SSL; hangs if using SSL
			//SetupCertificateHandling(); // only needed if SSL
			string updateurl = "/sites/" + Slug;
            string fullUpdateurl = C_Vita.VitaCoreUrlSSL + updateurl;

            JsonValue res = null;
            C_Vita.SetupCertificateHandling();
			try
			{
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				byte[] dataBytes = Encoding.UTF8.GetBytes(jsonString);

				byte[] responseBytes = await wc.UploadDataTaskAsync(updateurl, "PUT", dataBytes);

				string responseString = Encoding.UTF8.GetString(responseBytes);

				res = JsonValue.Parse(responseString);
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to update site status failed: " + e.Message);
                res = null;
			}

            return res;
        }

        public static C_VitaSite GetSiteBySlug(string slug, List<C_VitaSite> sites)
        {
            C_VitaSite res = null;

            foreach(C_VitaSite s in sites)
            {
                if (s.Slug == slug)
                {
                    res = s;
                    break;
                }
            }

            return res;
        }

		public static List<C_VitaSite> SitesOpenOnDay(C_YMD onDate, List<C_VitaSite> sitesList)
		{
			List<C_VitaSite> res = new List<C_VitaSite>();

			int dayOfWeek = (int)onDate.DayOfWeek;
			foreach (C_VitaSite site in sitesList)
			{
                if (site.SiteIsOpenOnDay(onDate))
                    res.Add(site);
			}

			return res;
		}

        public static List<C_WorkItem> GetWorksItemsOnDateFromSites(C_YMD onDate, List<C_VitaSite> sitesList)
        {
            List<C_WorkItem> res = new List<C_WorkItem>();

            foreach(C_VitaSite site in sitesList)
            {
                foreach(C_WorkItem wi in site.WorkIntents)
                {
                    if (wi.Date == onDate)
                        res.Add(wi);
                }
            }

            return res;
        }

        public bool SiteIsOpenOnDay(C_YMD onDate)
        {
			int dayOfWeek = (int)onDate.DayOfWeek;

			bool siteIsOpenOnDate = SiteCalendar[dayOfWeek].OpenTime != SiteCalendar[dayOfWeek].CloseTime;

			// scan for an override
			foreach (C_CalendarEntry ce in CalendarOverrides)
			{
				if (ce.Date == onDate)
				{
					siteIsOpenOnDate = !ce.IsClosed;
					break;
				}
			}

            return siteIsOpenOnDate;
		}

        public int GetNumEFilersRequiredOnDate(C_YMD onDate)
        {
			int dayOfWeek = (int)onDate.DayOfWeek;

			int OverrideNumEFilers = SiteCalendar[dayOfWeek].NumEFilers; // set the default value

			// scan for an override
			foreach (C_CalendarEntry ce in CalendarOverrides)
			{
				if (ce.Date == onDate)
				{
					if (ce.NumEFilers != 0)
						OverrideNumEFilers = ce.NumEFilers;

					break;
				}
			}
            return OverrideNumEFilers;
		}

        public List<C_WorkItem> GetWorkItemsOnDate(C_YMD onDate)
        {
            List<C_WorkItem> res = new List<C_WorkItem>();

            foreach(C_WorkItem wi in WorkIntents)
            {
                if (wi.Date == onDate)
                    res.Add(wi);
            }

            return res;
        }

		public C_CalendarEntry GetCalendarExceptionForDateForSite(C_YMD ymd)
		{
			C_CalendarEntry res = null;

            foreach (C_CalendarEntry ce in CalendarOverrides)
			{
				if (ce.Date == ymd)
				{
					res = ce;
					break;
				}
			}

			return res;
		}

		public static int CompareSitesByNameAscending(C_VitaSite s1, C_VitaSite s2)
		{
			return string.Compare(s1.Name, s2.Name, StringComparison.Ordinal);
		}

	}
}
