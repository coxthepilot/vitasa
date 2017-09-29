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
    public enum E_ViewCameFrom { Unknown = 0, List, Map, MySignUps, SCSites, SCSite, Login, VolOptions }
    public enum E_Message { Unknown = 0, BeforeYoGo, Resources, About, BecomeAVolunteer, Using211, MyFreeTaxes }

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

        ///// <summary>
        ///// The date for the volunteer work item being modified; used in SCVolunteers and SCVolunteer to keep track
        ///// of the date in the date picker
        ///// </summary>

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

        public C_Global(JsonValue jv)
        {
			UserCache = new List<C_VitaUser>();
			SiteCache = new List<C_VitaSite>();
			WorkItems = new List<C_WorkItem>();

			if (jv.ContainsKey(N_MessageToShow))
                MessageToShow = Tools.StringToEnum <E_Message> (Tools.JsonProcessString(jv, MessageToShow.ToString()));

            if (jv.ContainsKey(N_LoggedInUserId))
                LoggedInUserId = Tools.JsonProcessInt(jv[N_LoggedInUserId], LoggedInUserId);

			if (jv.ContainsKey(N_SiteCache))
			{
				SiteCache = new List<C_VitaSite>();
				foreach (JsonValue jva in jv[N_SiteCache])
				{
					C_VitaSite s = new C_VitaSite(jva);
					SiteCache.Add(s);
				}
			}

			if (jv.ContainsKey(N_AllSitesFetched))
				AllSitesFetched = Tools.JsonProcessBool(jv[N_AllSitesFetched], AllSitesFetched);

			if (jv.ContainsKey(N_WorkItems))
			{
                WorkItems = new List<C_WorkItem>();
				foreach (JsonValue jva in jv[N_WorkItems])
				{
                    C_WorkItem s = new C_WorkItem(jva);
					WorkItems.Add(s);
				}
			}

			if (jv.ContainsKey(N_UserCache))
			{
                UserCache = new List<C_VitaUser>();
				foreach (JsonValue jva in jv[N_UserCache])
				{
					C_VitaUser s = new C_VitaUser(jva);
					UserCache.Add(s);
				}
			}

            if (jv.ContainsKey(N_SelectedSiteSlug))
                SelectedSiteSlug = Tools.JsonProcessString(jv[N_SelectedSiteSlug], SelectedSiteSlug);

            if (jv.ContainsKey(N_SelectedSiteName))
                SelectedSiteName = Tools.JsonProcessString(jv[N_SelectedSiteName], SelectedSiteName);

			if (jv.ContainsKey(N_SelectedSuggestion))
                SelectedSuggestion = new C_Suggestion(jv[N_SelectedSuggestion]);

            if (jv.ContainsKey(N_SelectedDate))
                SelectedDate = Tools.JsonProcessDate(jv[N_SelectedDate], SelectedDate);

            if (jv.ContainsKey(N_ViewCameFrom))
                ViewCameFrom = Tools.StringToEnum<E_ViewCameFrom>(Tools.JsonProcessString(jv[N_ViewCameFrom], ViewCameFrom.ToString()));

            if (jv.ContainsKey(N_SelectedDayOfWeek))
                SelectedDayOfWeek = Tools.JsonProcessInt(jv[N_SelectedDayOfWeek], SelectedDayOfWeek);

            if (jv.ContainsKey(N_OpenSitesThatNeedHelp))
			{
                OpenSitesThatNeedHelp = new List<string>();
				foreach (JsonValue jva in jv[N_OpenSitesThatNeedHelp])
				{
                    string s = Tools.JsonProcessString(jva, null);
                    if (s != null)
    					OpenSitesThatNeedHelp.Add(s);
				}
			}

            if (jv.ContainsKey(N_WorksItemsOnSiteOnDate))
			{
                WorkItemsOnSiteOnDate = new List<C_WorkItem>();
				foreach (JsonValue jva in jv[N_WorksItemsOnSiteOnDate])
				{
					C_WorkItem s = new C_WorkItem(jva);
					WorkItemsOnSiteOnDate.Add(s);
				}
			}

            if (jv.ContainsKey(N_CalendarDate))
                CalendarDate = Tools.JsonProcessDate(jv[N_CalendarDate], CalendarDate);
            
            if (jv.ContainsKey(N_VolunteerWorkItem))
                VolunteerWorkItem = new C_WorkItem(jv[N_VolunteerWorkItem]);

			if (jv.ContainsKey(N_SitesSchedule))
			{
				SitesSchedule = new List<C_SiteSchedule>();
				foreach (JsonValue jva in jv[N_SitesSchedule])
				{
					C_SiteSchedule s = new C_SiteSchedule(jva, null);
					SitesSchedule.Add(s);
				}
			}
		}

        // ================= site cache mgmt =======================

        public C_VitaSite GetSiteFromCacheNoFetch(string slug)
        {
            var ou = SiteCache.Where(site => site.Slug == slug);
            return ou.FirstOrDefault();
        }

		public async Task<C_VitaSite> GetSiteFromCache(string slug)
		{
            C_VitaSite res = GetSiteFromCacheNoFetch(slug);

			if (res == null)
			{
				res = await C_VitaSite.FetchSitesDetails(slug);
                if (res != null)
                {
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
				res = await C_VitaSite.FetchSitesDetails(slug);
                if (res != null)
                {
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
				List<C_VitaSite> allSites = await C_VitaSite.FetchSitesListX();
				AllSitesFetched = true;

				foreach (C_VitaSite site in allSites)
				{
					if (!SiteCacheContains(site.Slug))
						SiteCache.Add(site);
				}
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
                List<C_VitaSite> allSites = await C_VitaSite.FetchSitesListX();
                AllSitesFetched = true;

                foreach (C_VitaSite site in allSites)
                {
                    if (!SiteCacheContains(site.Slug))
                        SiteCache.Add(site);
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
			bool res = false;

			foreach (C_VitaSite site in SiteCache)
			{
				if (site.Slug == slug)
				{
					res = true;
					break;
				}
			}

			return res;
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
					BaseAddress = new Uri(C_Vita.VitaCoreUrlSSL)
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

				user = await C_VitaUser.FetchUserX(loggedInUser.Token, id);

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
                res = await C_VitaUser.FetchUserX(token, userid);
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
            else
            {
                int daysInMonth = DateTime.DaysInMonth(year, month);
                C_YMD start = new C_YMD(year, month, 1);
                C_YMD end = new C_YMD(year, month, daysInMonth);

                res = await C_SiteSchedule.FetchSitesSchedulesX(start, end);

                SitesScheduleCache.Add(key, res);
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
