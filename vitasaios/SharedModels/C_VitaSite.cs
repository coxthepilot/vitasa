using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using UIKit;
using System.Linq;

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
        public List<C_WorkItem> WorkHistoryX;
        public List<C_WorkItem> WorkIntentsX;
        public C_YMD SeasonFirstDate;
        public C_YMD SeasonLastDate;

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
        public static readonly string N_SeasonFirstDate = "season_first_date";
        public static readonly string N_SeasonLastDate = "season_last_date";

		/// <summary>
		/// Create a new site with null values for all fields
		/// </summary>
		public C_VitaSite()
        {
            SiteCalendar = new C_SiteCalendarEntry[7];
            for (int ix = 0; ix != 7; ix++)
                SiteCalendar[ix] = new C_SiteCalendarEntry();
            CalendarOverrides = new List<C_CalendarEntry>();
            WorkHistoryX = new List<C_WorkItem>();
            WorkIntentsX = new List<C_WorkItem>();

            // todo; get these from the json when supported by the api
            SeasonFirstDate = new C_YMD(2017, 09, 01);
            SeasonLastDate = new C_YMD(2018, 04, 15);
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
			WorkHistoryX = new List<C_WorkItem>();
			WorkIntentsX = new List<C_WorkItem>();

			SeasonFirstDate = new C_YMD(2017, 09, 01);
			SeasonLastDate = new C_YMD(2018, 04, 15);

            try
            {
                if (j.ContainsKey(N_ID))
                    id = Tools.JsonProcessInt(j[N_ID], id);

                if (j.ContainsKey(N_Name))
                    Name = Tools.JsonProcessString(j[N_Name], Name);

                if (j.ContainsKey(N_Slug))
					Slug = Tools.JsonProcessString(j[N_Slug], Slug);

                if (j.ContainsKey(N_Street))
					Street = Tools.JsonProcessString(j[N_Street], Street);

                if (j.ContainsKey(N_City))
					City = Tools.JsonProcessString(j[N_City], City);

                if (j.ContainsKey(N_State))
					State = Tools.JsonProcessString(j[N_State], State);

                if (j.ContainsKey(N_Zip))
                    Zip = Tools.JsonProcessString(j[N_Zip], Zip);

                if (j.ContainsKey(N_Latitude))
                    Latitude = Tools.JsonProcessString(j[N_Latitude], Latitude);

                if (j.ContainsKey(N_Longitude))
                    Longitude = Tools.JsonProcessString(j[N_Longitude], Longitude);

                if (j.ContainsKey(N_Coordinator))
                    PrimaryCoordinator = Tools.JsonProcessInt(j[N_Coordinator], PrimaryCoordinator);

                if (j.ContainsKey(N_BackupCoordinator))
                    BackupCoordinator = Tools.JsonProcessInt(j[N_BackupCoordinator], BackupCoordinator);

				if (j.ContainsKey(N_PlaceID))
                    PlaceID = j[N_PlaceID];

                if (j.ContainsKey(N_Status))
                {
                    string ssv = Tools.JsonProcessString(j[N_Status], "Unknown");
                    Status = Tools.StringToEnum<E_SiteStatus>(ssv);
                }

                if (j.ContainsKey(N_WorkHistory))
                {
                    if (j[N_WorkHistory] is JsonArray)
                    {
                        WorkHistoryX = new List<C_WorkItem>();
                        JsonArray ja = (JsonArray)j[N_WorkHistory];
                        foreach (JsonValue jav in ja)
                        {
                            C_WorkItem wi = new C_WorkItem(jav);
                            WorkHistoryX.Add(wi);
                        }
                    }
                }

                if (j.ContainsKey(N_WorkIntents))
                {
                    if (j[N_WorkIntents] is JsonArray)
                    {
                        WorkIntentsX = new List<C_WorkItem>();
                        JsonArray ja = (JsonArray)j[N_WorkIntents];
                        foreach (JsonValue jav in ja)
                        {
                            C_WorkItem wi = new C_WorkItem(jav);
                            WorkIntentsX.Add(wi);
                        }
                    }
                }

                if (j.ContainsKey(N_CalendarOverrides))
				{
                    var jv = j[N_CalendarOverrides];
					if (jv is JsonArray)
					{
                        foreach (JsonValue jav in jv)
                        {
                            C_CalendarEntry ce = new C_CalendarEntry(jav);
                            CalendarOverrides.Add(ce);
						}
					}
				}

                // parse through the <day of week>_<open | close | efiler> values
                foreach (string k in ((JsonObject)j).Keys)
                {
					int dow = FindDayOfWeekInKey(k);
                    if (((k.Contains("_open")) || (k.Contains("_close")) || (k.Contains("_efilers"))) && (dow != -1))
                    {
                        if (k.Contains("_open"))
                            SiteCalendar[dow].OpenTime = Tools.JsonProcessString(j[k], SiteCalendar[dow].OpenTime);
                        else if (k.Contains("_close"))
                            SiteCalendar[dow].CloseTime = Tools.JsonProcessString(j[k], SiteCalendar[dow].CloseTime);
                        else if (k.Contains("_efilers"))
                            SiteCalendar[dow].NumEFilers = Tools.JsonProcessInt(j[k], SiteCalendar[dow].NumEFilers);
                    }
                }
            }
            catch { }
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
        private static List<C_VitaSite> ImportSites(JsonValue json)
        {
            if (!(json is JsonArray))
                throw new ApplicationException("the sites list must be an array");

            // create the holding place for the results
            List<C_VitaSite> res = new List<C_VitaSite>();
            try
            {
                foreach (JsonValue j in json)
                {
                    C_VitaSite vs = new C_VitaSite(j);
                    res.Add(vs);
                }
            }
            catch {}
            
            return res;
        }

        public async static Task<List<C_VitaSite>> FetchSitesListX()
        {
            List<C_VitaSite> siteslist = null;

			try
			{
				string sitesUrl = "/sites";
    			WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrl
                };
                wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                wc.Headers.Add(HttpRequestHeader.Accept, "application/json");
                //wc.Headers.Add(HttpRequestHeader.AcceptLanguage, "en");

				string ds = await wc.DownloadStringTaskAsync(sitesUrl);

				JsonValue jdoc = JsonValue.Parse(ds);
				siteslist = ImportSites(jdoc);
			}
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                siteslist = null;
            }

			return siteslist;
		}

		public async static Task<C_VitaSite> FetchSitesDetails(string slug)
		{
			C_VitaSite site = null;

			try
			{
				string siteUrl = "/sites/" + slug;
    			WebClient wc = new WebClient()
    			{
    				BaseAddress = C_Vita.VitaCoreUrl
    			};
    			wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
    			wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				string ds = await wc.DownloadStringTaskAsync(siteUrl);

				JsonValue jdoc = JsonValue.Parse(ds);
                site = new C_VitaSite(jdoc);
			}
			catch
			{
                site = null;
			}

			return site;
		}

		public async Task<bool> UpdateDefaultCalendar(int dayOfWeek, C_HMS openTime, C_HMS closeTime, int numefilers, string token)
        {
            if ((dayOfWeek < 0) || (dayOfWeek > 6))
                throw new ApplicationException("day of week value must be 0..6");
            if (numefilers < 0)
                throw new ApplicationException("number of efilers must be greater than 0");

			bool success = false;
			try
			{
				string dows = C_YMD.DayOfWeekNames[dayOfWeek].ToLower();
                string n_opentime = dows + "_open";
                string n_closetime = dows + "_close";
                string n_numefilers = dows + "_efilers";

                string bodyjson = "{"
                      + "\"" + n_opentime + "\" : \"" + openTime.ToString("hh:mm") + "\""
                      + ",\"" + n_closetime + "\" : \"" + closeTime.ToString("hh:mm") + "\""
                      + ",\"" + n_numefilers + "\" : \"" + numefilers.ToString() + "\""
                      + "}";

                JsonValue responseString = await UpdateSite(bodyjson, token);

                success = true;
            }
            catch
            {
                success = false;
            }

            return success;
        }

        /// <summary>
        /// Calendar exceptions over all other information regarding open, close, and number of eFilers
        /// </summary>
        /// <returns>true if successful</returns>
        /// <param name="token">Token.</param>
        /// <param name="calEntry">Cal entry.</param>
        public async Task<bool> CreateCalendarException(string token, C_CalendarEntry calEntry)
        {
			bool success = false;
			try
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

				string updateurl = "/sites/" + Slug + "/calendars/";
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(updateurl, "POST", bodyjson);

				//string responseString = Encoding.UTF8.GetString(responseBytes);
				//JsonValue res = JsonValue.Parse(responseString);

                // add it to the current Site instance
                CalendarOverrides.Add(calEntry);

                success = true;
			}
			catch
			{
                success = false;
			}

			return success;
		}

		public async Task<bool> UpdateCalendarException(string token, C_CalendarEntry calEntry)
		{
			bool success = false;
			try
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

				string updateurl = "/sites/" + Slug + "/calendars/" + calEntry.id.ToString();
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(updateurl, "PUT", bodyjson);

				//JsonValue res = JsonValue.Parse(responseString);

				success = true;
			}
			catch
			{
				success = false;
			}

			return success;
		}

		public async Task<bool> RemoveCalendarException(string token, C_CalendarEntry calEntry)
		{
			bool success = false;
			try
			{
				string updateurl = "/sites/" + Slug + "/calendars/" + calEntry.id.ToString();
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(updateurl, "DELETE", "");

				//JsonValue res = JsonValue.Parse(responseString);

				// remove the calendar entry from this instance
				CalendarOverrides.Remove(calEntry);

				success = true;
			}
			catch
			{
				success = false;
			}

			return success;		
        }

		public async Task<bool> UpdateSiteStatus(E_SiteStatus newSiteStatus, string token)
        {
			if (string.IsNullOrEmpty(Slug))
                throw new ApplicationException("slug must not be null or empty");

            if (Status == newSiteStatus)
                return true;

			bool success = false;
			try
			{
				string bodyjson = "{ \"sitestatus\" : \"" + newSiteStatus.ToString() + "\"}";

                JsonValue responseJson = await UpdateSite(bodyjson, token);
                // we could check the boolean that is returned...

                success = true;
			}
			catch
            {
                success = false;
            }

            return success;
        }

        /// <summary>
        /// Update a field or set of fields on this site
        /// </summary>
        /// <returns>true on success</returns>
        /// <param name="jsonString">Json string of items to update.</param>
        /// <param name="token">Token.</param>
        private async Task<bool> UpdateSite(string jsonString, string token)
        {
            bool res = false;
			try
			{
				string updateurl = "/sites/" + Slug;
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(updateurl, "PUT", jsonString);

                //JsonValue jvResponse = JsonValue.Parse(responseString);

                res = true;
			}
            catch (Exception e)
			{
                Console.WriteLine(e.Message);
                res = false;
			}

            return res;
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

		/// <summary>
		/// Gets the open and close times for the Site on the given date accounting for 
		/// possible overrides. [0] is the open time, [1] is the close time.
		/// </summary>
		/// <returns>The open close time on date.</returns>
		/// <param name="onDate">On date.</param>
		public C_HMS[] GetOpenCloseTimeOnDate(C_YMD onDate)
		{
			int dayOfWeek = (int)onDate.DayOfWeek;

			C_HMS openTime = new C_HMS(SiteCalendar[dayOfWeek].OpenTime);
			C_HMS closeTime = new C_HMS(SiteCalendar[dayOfWeek].CloseTime);

			// scan for an override
			foreach (C_CalendarEntry ce in CalendarOverrides)
			{
				if (ce.Date == onDate)
				{
					openTime = ce.OpenTime;
					closeTime = ce.CloseTime;

					break;
				}
			}

			C_HMS[] res = new C_HMS[2];
			res[0] = openTime;
			res[1] = closeTime;

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

		// ------------ static methods -----------

		/// <summary>
		/// Find the Site in the list based on the Slug.
		/// </summary>
		/// <returns>The Site.</returns>
		/// <param name="slug">Slug.</param>
		/// <param name="sites">Sites.</param>
		public static C_VitaSite GetSiteBySlug(string slug, List<C_VitaSite> sites)
        {
            var ou = sites.Where(s => s.Slug == slug);
            return ou.First();
        }

        /// <summary>
        /// Returns a list of Sites that open on the indicated date, from the supplied list. Open 
        /// is determined based on weekly calendar, seasonal dates, and lastly any calendar exception.
        /// </summary>
        /// <returns>List of sites open on the date</returns>
        /// <param name="onDate">On date.</param>
        /// <param name="sitesList">Sites list.</param>
		public static List<C_VitaSite> SitesOpenOnDay(C_YMD onDate, List<C_VitaSite> sitesList)
		{
            var ou = sitesList.Where(s => s.SiteIsOpenOnDay(onDate));
            return ou.ToList();
		}

        public bool SiteIsOpenOnDay(C_YMD onDate)
        {
			int dayOfWeek = (int)onDate.DayOfWeek;

            bool siteIsOpenOnDate =
                (SiteCalendar[dayOfWeek].OpenTime != SiteCalendar[dayOfWeek].CloseTime)
                && (onDate >= SeasonFirstDate)
                && (onDate <= SeasonLastDate);

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

		public static int CompareSitesByNameAscending(C_VitaSite s1, C_VitaSite s2)
		{
			return string.Compare(s1.Name, s2.Name, StringComparison.Ordinal);
		}
	}
}
