using System;
using System.Collections.Generic;
using System.Json;
using System.Linq;
using System.Threading.Tasks;
using System.Text;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;

namespace zsquared
{
    public enum E_ViewCameFrom { Unknown = 0, List, Map, MySignUps, SCSites, SCSite, Login, VolOptions, Suggestions }

    public class C_Global
    {
        public static readonly string Name_Global = "global";

        /// <summary>
        /// Used in client; the message to show
        /// </summary>
        public E_Message MessageToShow;
        public static readonly string N_MessageToShow = "messagetoshow";

		/// <summary>
		/// This is the id user that we logged into the system with. This is the user with the valid token.
		/// </summary>
		public int LoggedInUserId;
        public static readonly string N_LoggedInUserId = "loggedinuserid";

        /// <summary>
        /// A cache of sites we know about. 
        /// </summary>
        public List<C_VitaSite> SiteCache;
        public static readonly string N_SiteCache = "sitecache";
        public bool AllSitesFetched;
        const string N_AllSitesFetched = "allsitesfetched";

		/// <summary>
		/// A list of C_WorkItems found in pulling Site and User data
		/// </summary>
		public List<C_WorkItem> WorkItems;
        public static readonly string N_WorkItems = "workitems";

		/// <summary>
		/// List of known users; this is not a list of ALL users, just ones we have seen
		/// </summary>
		public List<C_VitaUser> UserCache;
		public static readonly string N_UserCache = "usercache";

		/// <summary>
		/// The slug of the current selected site
		/// </summary>
		public string SelectedSiteSlug;
		public static readonly string N_SelectedSiteSlug = "selectedsiteslug";
		public string SelectedSiteName;
		public static readonly string N_SelectedSiteName = "selectedsiteslug";

		/// <summary>
		/// The selected suggestion.
		/// </summary>
		public C_Suggestion SelectedSuggestion;
		public static readonly string N_SelectedSuggestion = "selectedsuggestion";

		/// <summary>
		/// In VC_Calendar, this is the date that the user picked, headed to SitesOnDate
		/// </summary>
		public C_YMD SelectedDate;
		public static readonly string N_SelectedDate = "selecteddate";

		/// <summary>
		/// The details view controller needs to know where to go "Back" to
		/// </summary>
		public E_ViewCameFrom ViewCameFrom = E_ViewCameFrom.Unknown;
        public static readonly string N_ViewCameFrom = "viewcamefrom";

		/// <summary>
		/// From SCSiteCalendar to SCDefaults, the selected day of the week
		/// </summary>
		public int SelectedDayOfWeek = -1;
		public static readonly string N_SelectedDayOfWeek = "selecteddayofweek";

		/// <summary>
		/// The open sites that need help. Used in SitesOnDateMap after launch from SitesOnDateList, and
        /// then in SitesOnDateList if return from Map; this is the slug for the site that needs help
		/// </summary>
		public List<string> OpenSitesThatNeedHelp;
		public static readonly string N_OpenSitesThatNeedHelp = "opensitesthatneedhelp";

		///// <summary>
		///// Generated in VC_SitesOnDateList, used in ...Map and SignUp
		///// </summary>
		public List<C_WorkItem> WorkItemsOnSiteOnDate;
		public static readonly string N_WorksItemsOnSiteOnDate = "workitemsonsiteondate";

		/// <summary>
		/// The Month and Year last used in the Calendar view.
		/// </summary>
		public C_YMD CalendarDate;
		public static readonly string N_CalendarDate = "calendardate";

		// --- passed to SCVolunteer Hours ---
		// SelectedDate
		// SelectedSite
		public C_WorkItem VolunteerWorkItem;
        public static readonly string N_VolunteerWorkItem = "volunteerworkitem";

        // --- used in VC_Calendar ---
        public List<C_SiteSchedule> SitesSchedule;
		public static readonly string N_SitesSchedule = "sitesschedule";

		public C_Global()
        {
            LoggedInUserId = -1;

            UserCache = new List<C_VitaUser>();
            SiteCache = new List<C_VitaSite>();
            WorkItems = new List<C_WorkItem>();
        }

		// ================= site cache mgmt =======================

		/// <summary>
		/// Imports the sites.
		/// </summary>
		/// <returns>A list of sites found in the json</returns>
		/// <param name="json">the value from the backend services that has been Parsed</param>
		private List<C_VitaSite> ImportSites(JsonValue json)
		{
#if DEBUG
			if (!(json is JsonArray))
				throw new ApplicationException("the sites list must be an array");
#endif
			// create the holding place for the results
			List<C_VitaSite> res = new List<C_VitaSite>();
			foreach (JsonValue j in json)
			{
				try
				{
					C_VitaSite vs = new C_VitaSite(j);
					res.Add(vs);

                    if (!SiteCacheContains(vs.Slug))
    					SiteCache.Add(vs);
                    
					CleanWorkItemsFromSite(vs);
				}
				catch (Exception e)
				{
#if DEBUG
					Console.WriteLine(e.Message);
#endif
				}
			}

            AllSitesFetched = true;

			return res;
		}

		public async Task<List<C_VitaSite>> FetchSitesList()
		{
			int retryCount = 0;
			bool retry = false;

			List<C_VitaSite> siteslist = null;
			do
			{
				try
				{
					retry = false;
					string sitesUrl = "/sites";
					WebClient wc = new WebClient()
					{
						BaseAddress = C_Vita.VitaCoreUrl
					};
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

					string responseString = await wc.DownloadStringTaskAsync(sitesUrl);

					JsonValue responseJson = JsonValue.Parse(responseString);

					siteslist = ImportSites(responseJson);
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						siteslist = null;
						retry = retryCount < 3;
						retryCount++;
					}
				}
				catch (Exception e)
				{
#if DEBUG
					Console.WriteLine(e.Message);
#endif
					siteslist = null;
					retry = false;
				}
			}
			while (retry);

			return siteslist;
		}

        private async static Task<C_VitaSite> FetchSitesDetails(string slug)
		{
			int retryCount = 0;
			bool retry = false;

			C_VitaSite site = null;
			do
			{
				try
				{
					retry = false;
					string siteUrl = "/sites/" + slug;
					WebClient wc = new WebClient()
					{
						BaseAddress = C_Vita.VitaCoreUrl
					};
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

					string responseString = await wc.DownloadStringTaskAsync(siteUrl);

					JsonValue responseJson = JsonValue.Parse(responseString);

					site = new C_VitaSite(responseJson)
					{
						SampleTime = DateTime.Now
					};
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						site = null;
						retry = retryCount < 3;
						retryCount++;
					}
				}
				catch (Exception e)
				{
#if DEBUG
					Console.WriteLine(e.Message);
#endif
					site = null;
				}
			}
			while (retry);

			return site;
		}

		public C_VitaSite GetSiteFromCacheNoFetch(string slug)
        {
            var ou = SiteCache.Where(site => site.Slug == slug);
            return ou.FirstOrDefault();
        }

		public async Task<C_VitaSite> GetSiteFromCache(string slug)
		{
            C_VitaSite res = GetSiteFromCacheNoFetch(slug);

            bool refetch = res == null;
            if (!refetch)
            {
                DateTime dt = res.SampleTime;
                TimeSpan ts = DateTime.Now - dt;
                refetch = ts.TotalMinutes > 30;
            }

            if (refetch)
			{
				res = await FetchSitesDetails(slug);
                if (res != null)
                {
					if (!SiteCacheContains(res.Slug))
						SiteCache.Add(res);
					CleanWorkItemsFromSite(res);
				}
			}

			return res;
		}

		public C_VitaSite GetSiteFromCacheByNameNoFetch(string name)
		{
            var ou = SiteCache.Where(s => s.Name == name);
            return ou.FirstOrDefault();
		}

		public async Task<bool> EnsureSiteInCache(string slug)
		{
            var ou = SiteCache.Where(site => site.Slug == slug);
            C_VitaSite res = ou.FirstOrDefault();

            if (res == null)
			{
				res = await FetchSitesDetails(slug);
                if (res != null)
                {
					if (!SiteCacheContains(res.Slug))
						SiteCache.Add(res);
                    CleanWorkItemsFromSite(res);
                }
			}

			return res != null;
		}

        private void CleanWorkItemsFromSite(C_VitaSite site)
		{
			List<C_WorkItem> intents = site.WorkIntentsX;
			site.WorkIntentsX = null;
			List<C_WorkItem> history = site.WorkHistoryX;
			site.WorkHistoryX = null;

			foreach (C_WorkItem wi in intents)
			{
				if (!WorkItemsHasId(wi.id))
					WorkItems.Add(wi);
			}

			foreach (C_WorkItem wi in history)
			{
				if (!WorkItemsHasId(wi.id))
					WorkItems.Add(wi);
			}
		}

		public async Task<List<C_VitaSite>> GetOpenSitesOnDate(C_YMD onDate)
		{
			// at the current api level, the only option is to get data on ALL sites (slow, lots of data)
			if (!AllSitesFetched)
			{
				List<C_VitaSite> allSites = await FetchSitesList();
			}

			List<C_VitaSite> res = new List<C_VitaSite>();

            foreach (C_VitaSite site in SiteCache)
			{
				if (site.SiteIsOpenOnDay(onDate))
					res.Add(site);
			}

			return res;
		}

        public async Task<List<C_VitaSite>> GetOpenSitesInDateRange(C_YMD from, C_YMD to)
		{
            // at the current api level, the only option is to get data on ALL sites (slow, lots of data)
            // todo: get an API to fetch just exactly what we want
            if (!AllSitesFetched)
            {
                List<C_VitaSite> allSites = await FetchSitesList();
                AllSitesFetched = true;

                foreach (C_VitaSite site in allSites)
                {
                    if (!SiteCacheContains(site.Slug))
                        SiteCache.Add(site);
                    CleanWorkItemsFromSite(site);
                }
            }

			List<string> SiteSlugsForOpenSites = new List<string>();
            foreach (C_VitaSite site in SiteCache)
			{
                // scan through the dates
                C_YMD date = new C_YMD(from);
                while (date <= to)
                {
                    if ((site.SiteIsOpenOnDay(date)) && (!SiteSlugsForOpenSites.Contains(site.Slug)))
                        SiteSlugsForOpenSites.Add(site.Slug);

					date = date.AddDays(1);
                }
			}

			List<C_VitaSite> res = new List<C_VitaSite>();
			foreach(string slug in SiteSlugsForOpenSites)
            {
                C_VitaSite site = GetSiteFromCacheNoFetch(slug);
                res.Add(site);
            }

			return res;
		}

		private bool SiteCacheContains(string slug)
		{
            var ou = SiteCache.Where(s => s.Slug == slug);
            return ou.Any();
		}

		// ----------------- user cache mgmt ---------------------

		/// <summary>
		/// Do the login using the provided email and password. This function makes the API call and
		/// either returns null or a C_VitaUser with a valid token. No throws from this function.
		/// </summary>
		/// <returns>The login.</returns>
		/// <param name="email">Email.</param>
		/// <param name="userPassword">User password.</param>
		public async Task<C_VitaUser> PerformLogin(string email, string userPassword)
		{
			C_VitaUser user = null;
			try
			{
				// do the login with the api's
				string loginUrl = "/login";
				var client = new HttpClient()
				{
					BaseAddress = new Uri(C_Vita.VitaCoreUrl)
				};
				client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

				string jsonData = "{"
					+ "\"email\" : \"" + email + "\""
					+ ",\"password\" : \"" + userPassword + "\""
					+ "}";

				var content = new StringContent(jsonData, Encoding.UTF8, "application/json");
				HttpResponseMessage response = await client.PostAsync(loginUrl, content);

                var responseString = await response.Content.ReadAsStringAsync();

				if (response.StatusCode != HttpStatusCode.OK)
					return null;

				// success should include the user details
                JsonValue responseJson = JsonValue.Parse(responseString);

				user = new C_VitaUser(responseJson);

				// the headers should contain our token in the 'Set-Cookie' header
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
				foreach (string tok in tokens)
				{
					if (tok.Contains("_rails-base_session"))
					{
						token = tok;
						break;
					}
				}

				user.Token = token;
                LoggedInUserId = user.id;
                if (!UserCacheContains(user.id))
                {
                    UserCache.Add(user);
                    CleanWorkItemsFromUser(user);
                }
			}
			catch (Exception e)
			{
#if DEBUG
                Console.WriteLine(e.Message);
#endif               
                user = null;
			}

			return user;
		}

		/// <summary>
		/// Fetchs the users list. Must have admin privilege to run.
		/// </summary>
		/// <returns>The users list.</returns>
		/// <param name="token">Token.</param>
        public async Task<List<C_VitaUser>> FetchUsersList(string token)
		{
			int retryCount = 0;
			bool retry = false;

			List<C_VitaUser> res = null;
			do
			{
				try
				{
					retry = false;
					string usersUrl = "/users";
					WebClient wc = new WebClient()
					{
						BaseAddress = C_Vita.VitaCoreUrl
					};
					wc.Headers.Add(HttpRequestHeader.Cookie, token);
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

					string resp = await wc.DownloadStringTaskAsync(usersUrl);

					JsonValue jv = JsonValue.Parse(resp);

#if DEBUG
					// we are expecting an array
					if (!(jv is JsonArray))
						throw new ApplicationException("must be an array");
#endif

					res = new List<C_VitaUser>();
					foreach (JsonValue jv1 in jv)
					{
						C_VitaUser vu = new C_VitaUser(jv1);
						res.Add(vu);

						UserCache.Add(vu);
						CleanWorkItemsFromUser(vu);

					}
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						res = null;
						retry = retryCount < 3;
						retryCount++;
					}
				}
				catch (Exception ex)
				{
#if DEBUG
					Console.WriteLine(ex.Message);
#endif
					res = null;
				}
			}
			while (retry);

			return res;
		}

		/// <summary>
		/// Get the data for the specified user from the backend.
		/// </summary>
		/// <returns>The user</returns>
		/// <param name="token">security token (required)</param>
		/// <param name="id">id of the user to get details on</param>
        private async Task<C_VitaUser> FetchUser(string token, int id)
		{
			int retryCount = 0;
			bool retry = false;

			C_VitaUser res = null;
			do
			{
				try
				{
					retry = false;
					string usersUrl = "/users/" + id.ToString();
					WebClient wc = new WebClient()
					{
						BaseAddress = C_Vita.VitaCoreUrl
					};
					wc.Headers.Add(HttpRequestHeader.Cookie, token);
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

					string ss = await wc.DownloadStringTaskAsync(usersUrl);

					JsonValue jv = JsonValue.Parse(ss);

#if DEBUG
					if (!(jv is JsonObject))
						throw new ApplicationException("must be an object");
#endif

					res = new C_VitaUser(jv);
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						res = null;
						retry = retryCount < 3;
						retryCount++;
					}
				}
				catch (Exception ex)
				{
#if DEBUG
					Console.WriteLine(ex.Message);
#endif
					res = null;
				}
			}
			while (retry);

			return res;
		}

		public C_VitaUser GetUserFromCacheNoFetch(int id)
        {
            var ou = UserCache.Where(u => u.id == id);
            return ou.FirstOrDefault();
        }

        public async Task<C_VitaUser> GetUserFromCache(int id)
        {
            C_VitaUser user = GetUserFromCacheNoFetch(id);

			// if not found them pull from the API and store off the workintents
			if (user == null)
			{
				C_VitaUser loggedInUser = GetUserFromCacheNoFetch(LoggedInUserId);

                if (loggedInUser == null)
                    return null;

				user = await FetchUser(loggedInUser.Token, id);

				if (user != null)
				{
                    UserCache.Add(user);
                    CleanWorkItemsFromUser(user);
				}
			}

			return user;
        }

		public async Task<bool> EnsureUserInCache(int userid, string token)
		{
            C_VitaUser res = GetUserFromCacheNoFetch(userid);
           
            if (res == null)
			{
                res = await FetchUser(token, userid);
				if (res != null)
				{
					UserCache.Add(res);
					CleanWorkItemsFromUser(res);
				}
			}

			return res != null;
		}

		private void CleanWorkItemsFromUser(C_VitaUser user)
        {
			List<C_WorkItem> intents = user.WorkIntentsX;
			user.WorkIntentsX = null;
			List<C_WorkItem> history = user.WorkHistoryX;
			user.WorkHistoryX = null;

			foreach (C_WorkItem wi in intents)
			{
				if (!WorkItemsHasId(wi.id))
					WorkItems.Add(wi);
			}

			foreach (C_WorkItem wi in history)
			{
				if (!WorkItemsHasId(wi.id))
					WorkItems.Add(wi);
			}
		}

        private bool UserCacheContains(int userId)
        {
            var ou = UserCache.Where(u => u.id == userId);
            return ou.Any();
        }

        // ---------------- SiteSchedule mgmt -----------

        Dictionary<int, List<C_SiteSchedule>> SitesScheduleCache;

        public async Task<List<C_SiteSchedule>> GetSitesScheduleCached(int year, int month)
        {
            if (SitesScheduleCache == null)
                SitesScheduleCache = new Dictionary<int, List<C_SiteSchedule>>();

            List<C_SiteSchedule> res = null;

            int key = year * 12 + month;
            if (SitesScheduleCache.ContainsKey(key))
                res = SitesScheduleCache[key];

            // if the siteschedule we fetched has expired data, then we need to force a refetch
            bool refetch = res == null;
            if (!refetch && (res.Count != 0))
            {
                DateTime dt = res[0].SampleTime;
                TimeSpan ts = DateTime.Now - dt;
                refetch = ts.TotalMinutes > 30;
            }

            if (refetch)
            {
                // if we fetch any data, we will always fetch 2 months at once
                C_YMD start = new C_YMD(year, month, 1);
                C_YMD nextMonth = new C_YMD(start);
                nextMonth.AddMonths(1);
                int daysInMonth = DateTime.DaysInMonth(nextMonth.Year, nextMonth.Month);
                C_YMD end = new C_YMD(nextMonth.Year, nextMonth.Month, daysInMonth);

                // get the siteschedules in our time range (2 months)
                List<C_SiteSchedule> sslist = await C_SiteSchedule.FetchSitesSchedules(start, end);

                // split into the 2 different months since that is how we cache them
                List<C_SiteSchedule> month0 = new List<C_SiteSchedule>();
                List<C_SiteSchedule> month1 = new List<C_SiteSchedule>();
                foreach(C_SiteSchedule ss in sslist)
                {
                    if ((ss.Date.Year == year) && (ss.Date.Month == month))
                        month0.Add(ss);
                    else
                        month1.Add(ss);
                }

                // build the keys for the 2 months
                int key0 = key;
                int key1 = nextMonth.Year * 12 + nextMonth.Month;

                // if those entries are already there, remove them
                if (SitesScheduleCache.ContainsKey(key0))
                    SitesScheduleCache.Remove(key0);
				if (SitesScheduleCache.ContainsKey(key1))
					SitesScheduleCache.Remove(key1);

                // finally, add the new month schedule into the cache
				SitesScheduleCache.Add(key0, month0);
                SitesScheduleCache.Add(key1, month1);

                // and return the one the user was actually asking for...
                res = month0;
            }

            return res;
		}

        // ---------------- workitems mgmt --------------

        private bool WorkItemsHasId(int id)
        {
            var ou = WorkItems.Where(wi => wi.id == id);

            return ou.Any();
        }

		public List<C_WorkItem> GetWorkItemsForUser(int userId)
		{
			var ou = WorkItems.Where(wi => wi.UserId == userId);
			List<C_WorkItem> res = ou.ToList();

			return res;
		}

        public List<C_WorkItem> GetWorkItemsForSiteOnDate(C_YMD onDate, string siteSlug)
        {
            var ou = WorkItems.Where(wi => ((wi.Date == onDate) && (wi.SiteSlug == siteSlug)));
            return ou.ToList();
        }

        public void ClearDirtyFlagOnIntents()
        {
            foreach (C_WorkItem wi in WorkItems)
                wi.Dirty = false;
        }
    }
}
