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
    public enum E_ViewCameFrom { Unknown = 0, List, Map, MySignUps, SCSites, SCSite, Login, VolOptions, Suggestions, CalEntry, CalDefaults, Users, Main }

    public class C_Global
    {
        public static readonly string Name_Global = "global";

        /// <summary>
        /// Used in client; the message to show
        /// </summary>
        public E_Message MessageToShow;

		/// <summary>
		/// This is the id user that we logged into the system with. This is the user with the valid token.
		/// </summary>
		public int LoggedInUserId;

        /// <summary>
        /// A cache of sites we know about. 
        /// </summary>
        public List<C_VitaSite> SiteCache;
        public bool AllSitesFetched;

		/// <summary>
		/// A list of C_WorkItems found in Site and User data
		/// </summary>
		public List<C_SignUp> SignUps;

		/// <summary>
		/// List of known users; this is not a list of ALL users, just ones we have seen
		/// </summary>
		public List<C_VitaUser> UserCache;
        public bool AllUsersFetched;

        /// <summary>
        /// A list of all WorkShifts we've seen
        /// </summary>
        public List<C_WorkShift> WorkShifts;

		/// <summary>
		/// The slug of the current selected site
		/// </summary>
		public string SelectedSiteSlug;
		public string SelectedSiteName;

		/// <summary>
		/// The selected suggestion.
		/// </summary>
		public C_Suggestion SelectedSuggestion;

		/// <summary>
		/// In VC_Calendar, this is the date that the user picked, headed to SitesOnDate
		/// </summary>
		public C_YMD SelectedDate;

		/// <summary>
		/// The details view controller needs to know where to go "Back" to
		/// </summary>
		public E_ViewCameFrom ViewCameFrom = E_ViewCameFrom.Unknown;

		/// <summary>
		/// The open sites that need help. Used in SitesOnDateMap after launch from SitesOnDateList, and
        /// then in SitesOnDateList if return from Map; this is the slug for the site that needs help
		/// </summary>
		public List<string> OpenSitesThatNeedHelp;

        public List<C_WorkShiftSignUp> WorkShiftSignUpsOnDate; // used in SCVolunteers

		/// <summary>
		/// The Month and Year last used in the Calendar view.
		/// </summary>
		public C_YMD CalendarDate;

		public C_SignUp VolunteerSignUp;
        public C_WorkShiftSignUp VolunteerWorkShiftSignUp;

        // --- used in VC_Calendar ---
        public List<C_SiteSchedule> SitesSchedule;

        // used in ShiftDetails
        public C_WorkShift SelectedShift;

        // used in VC_SignUp
        public C_SignUp SelectedSignUp;

		Dictionary<int, List<C_SiteSchedule>> SitesScheduleCache;
        Dictionary<string, Dictionary<int, List<C_SiteSchedule>>> SiteScheduleBySiteCache;

        // used in vitaadmin, in Users for displaying signups for a user
        public C_VitaUser SelectedUser;

		public C_Global()
        {
            LoggedInUserId = -1;

            UserCache = new List<C_VitaUser>();
            SiteCache = new List<C_VitaSite>();
            SignUps = new List<C_SignUp>();
            WorkShifts = new List<C_WorkShift>();
        }

		// ================= sites cache mgmt =======================

		/// <summary>
		/// Imports the sites.
		/// </summary>
		/// <returns>A list of sites found in the json</returns>
		/// <param name="json">the value from the backend services that has been Parsed</param>
		private List<C_VitaSite> ImportSites(JsonValue json)
		{
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

		public async Task<List<C_VitaSite>> FetchAllSites()
		{
			List<C_VitaSite> siteslist = null;

            string sitesUrl = "/sites";

            string responseString = await Tools.Download(sitesUrl, null);

            if (responseString != null)
            {
                JsonValue responseJson = JsonValue.Parse(responseString);

                siteslist = ImportSites(responseJson);
            }

            return siteslist;
		}

        public List<C_VitaSite> GetAllSitesNoCache()
        {
            List<C_VitaSite> res = new List<C_VitaSite>();

            if (!AllSitesFetched)
                return res;

            foreach (C_VitaSite site in SiteCache)
                res.Add(site);

            return res;
        }

        private async static Task<C_VitaSite> FetchSite(string slug)
		{
			C_VitaSite site = null;

			string siteUrl = "/sites/" + slug;

            string responseString = await Tools.Download(siteUrl, null);

            if (responseString != null)
            {
                JsonValue responseJson = JsonValue.Parse(responseString);

                site = new C_VitaSite(responseJson)
                {
                    SampleTime = DateTime.Now
                };
            }

            return site;
		}

		public C_VitaSite GetSiteNoFetch(string slug)
        {
            var ou = SiteCache.Where(site => site.Slug == slug);
            return ou.FirstOrDefault();
        }

		public async Task<C_VitaSite> GetSiteFromCache(string slug)
		{
            C_VitaSite res = GetSiteNoFetch(slug);

            bool refetch = res == null;
            if (!refetch)
            {
                DateTime dt = res.SampleTime;
                TimeSpan ts = DateTime.Now - dt;
                refetch = ts.TotalMinutes > 30;
            }

            if (refetch)
			{
				res = await FetchSite(slug);
                if (res != null)
                {
					if (!SiteCacheContains(res.Slug))
						SiteCache.Add(res);
					CleanWorkItemsFromSite(res);
				}
			}

			return res;
		}

		public C_VitaSite GetSiteByNameNoFetch(string name)
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
				res = await FetchSite(slug);
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
			List<C_SignUp> intents = site.WorkIntentsX;
			site.WorkIntentsX = null;
			List<C_SignUp> history = site.WorkHistoryX;
			site.WorkHistoryX = null;

			foreach (C_SignUp wi in intents)
			{
				if (!SignUpsHasId(wi.id))
					SignUps.Add(wi);
			}

			foreach (C_SignUp wi in history)
			{
				if (!SignUpsHasId(wi.id))
					SignUps.Add(wi);
			}
		}

		public async Task<List<C_VitaSite>> GetOpenSitesOnDate(C_YMD onDate)
		{
			// at the current api level, the only option is to get data on ALL sites (slow, lots of data)
			if (!AllSitesFetched)
			{
				List<C_VitaSite> allSites = await FetchAllSites();
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
                List<C_VitaSite> allSites = await FetchAllSites();
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
                C_VitaSite site = GetSiteNoFetch(slug);
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

				Tools.UpdateBytesCounter(responseString.Length);

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
        public async Task<List<C_VitaUser>> FetchAllUsers(string token)
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
                    else
                    {
#if DEBUG
						Console.WriteLine(we.Message);
#endif
						res = null;
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

            AllUsersFetched |= res != null;

			return res;
		}

        public List<C_VitaUser> GetAllUsers()
        {
            List<C_VitaUser> res = new List<C_VitaUser>();
            if (!AllUsersFetched)
                return res;

            foreach (C_VitaUser user in UserCache)
                res.Add(user);
            
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
            C_VitaUser res = null;

			string usersUrl = "/users/" + id.ToString();

            string responseString = await Tools.Download(usersUrl, token);

            if (responseString != null)
            {
				JsonValue responseJson = JsonValue.Parse(responseString);

				res = new C_VitaUser(responseJson);
			}

            return res;
		}

        public async Task<bool> RemoveUser(int id, string token)
        {
			string usersUrl = "/users/" + id.ToString();

            string responseString = await Tools.Upload("DELETE", usersUrl, "", token);

            return responseString != null;
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
			List<C_SignUp> intents = user.WorkIntentsX;
			user.WorkIntentsX = null;
			List<C_SignUp> history = user.WorkHistoryX;
			user.WorkHistoryX = null;

			foreach (C_SignUp wi in intents)
			{
				if (!SignUpsHasId(wi.id))
					SignUps.Add(wi);
			}

			foreach (C_SignUp wi in history)
			{
				if (!SignUpsHasId(wi.id))
					SignUps.Add(wi);
			}
		}

        private bool UserCacheContains(int userId)
        {
            var ou = UserCache.Where(u => u.id == userId);
            return ou.Any();
        }

        // ---------------- SiteSchedule mgmt -----------

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

		public async Task<List<C_SiteSchedule>> GetSitesScheduleForSiteCached(int year, int month, string siteSlug)
		{
            if (SiteScheduleBySiteCache == null)
                SiteScheduleBySiteCache = new Dictionary<string, Dictionary<int, List<C_SiteSchedule>>>();

			List<C_SiteSchedule> res = null;

			int key = year * 12 + month;
			if (SiteScheduleBySiteCache.ContainsKey(siteSlug))
            {
                Dictionary<int, List<C_SiteSchedule>> d = SiteScheduleBySiteCache[siteSlug];
                if (d.ContainsKey(key))
                    res = d[key];
            }
            else
            {
                Dictionary<int, List<C_SiteSchedule>> d = new Dictionary<int, List<C_SiteSchedule>>();
                SiteScheduleBySiteCache.Add(siteSlug, d);
			}

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
				C_YMD start = new C_YMD(year, month, 1);
                C_YMD end = new C_YMD(start.Year, start.Month, DateTime.DaysInMonth(start.Year, start.Month));

                res = await C_SiteSchedule.FetchSiteSchedules(start, end, siteSlug);
                if (res != null)
                {
					Dictionary<int, List<C_SiteSchedule>> d = SiteScheduleBySiteCache[siteSlug];
                    d.Add(key, res);
                }
			}

			return res;
		}

        public void RemoveSiteFromSiteCache(string siteSlug)
        {
            if (SiteScheduleBySiteCache == null)
                return;
            
            if (SiteScheduleBySiteCache.ContainsKey(siteSlug))
                SiteScheduleBySiteCache.Remove(siteSlug);
        }
		
        public C_SiteSchedule GetSiteScheduleForDay(C_YMD onDate, string siteSlug)
        {
            C_SiteSchedule res = null;

            if (SitesScheduleCache == null)
                return res;

            int key = onDate.Year * 12 + onDate.Month;
            if (SitesScheduleCache.ContainsKey(key))
            {
                List<C_SiteSchedule> sslist = SitesScheduleCache[key];
                var ou = sslist.Where(ss => (ss.SiteSlug == siteSlug) && (ss.Date == onDate));
                List<C_SiteSchedule> sslist2 = ou.ToList();
                if (sslist2.Count != 0)
                    res = sslist2[0];
            }

            return res;
        }

        // ---------------- workitems mgmt --------------

        public async Task<C_SignUp> FetchSignUpById(string token, int userId, int signUpId)
        {
            C_SignUp res = null;

            string submitUrl = "/signups/" + signUpId.ToString();

            string responseString = await Tools.Download(submitUrl, token);

            if (responseString != null)
            {
                JsonValue responseJson = JsonValue.Parse(responseString);
                res = new C_SignUp(responseJson);
            }

            return res;
        }

        public void AddToSignUps(C_SignUp su)
        {
            if (!SignUps.Contains(su))
                SignUps.Add(su);
        }

        public void RemoveFromSignUps(C_SignUp su)
        {
            if (SignUps.Contains(su))
                SignUps.Remove(su);
        }

        public void AdjustSiteCacheForNewSignUp(C_SignUp su, C_VitaUser user, C_VitaSite site)
        {
            // find the actual shift for this signup
			C_CalendarEntry ce = site.GetCalendarEntryForDate(su.Date);
            C_WorkShift ws = null;
			if ((ce != null) && ce.HaveShifts)
			{
                var ou = ce.WorkShifts.Where(wsx => wsx.id == su.ShiftId);
                ws = ou.FirstOrDefault();
			}
            if (ws == null)
                return;

            // get the site schedule for us to adjust
			C_SiteSchedule ss = GetSiteScheduleForDay(su.Date, su.SiteSlug);
            if (ss == null)
                return;

            // now find the SiteSchedule WorkShift that matches the shift
            C_SiteScheduleShift sss = null;
            foreach(C_SiteScheduleShift sssx in ss.Shifts)
            {
                if ((ws.OpenTime == sssx.OpenTime) && (ws.CloseTime == sssx.CloseTime))
                {
                    sss = sssx;
                    break;
                }
            }
            if (sss == null)
                return;

            if (user.Certification == E_Certification.Basic)
                sss.eFilersSignedUpBasic++;
            else if (user.Certification == E_Certification.Advanced)
                sss.eFilersSignedUpAdvanced++;
        }

		public void AdjustSiteSchedueCacheForRemovedSignUp(C_SignUp su, C_VitaUser user, C_VitaSite site)
		{
            if (user == null)
                return;
            if (site == null) 
                return;

			// find the actual shift for this signup
			C_CalendarEntry ce = site.GetCalendarEntryForDate(su.Date);
			C_WorkShift ws = null;
			if ((ce != null) && ce.HaveShifts)
			{
				var ou = ce.WorkShifts.Where(wsx => wsx.id == su.ShiftId);
				ws = ou.FirstOrDefault();
			}
			if (ws == null)
				return;

			// get the site schedule for us to adjust
			C_SiteSchedule ss = GetSiteScheduleForDay(su.Date, su.SiteSlug);
			if (ss == null)
				return;

			// now find the SiteSchedule WorkShift that matches the shift
			C_SiteScheduleShift sss = null;
			foreach (C_SiteScheduleShift sssx in ss.Shifts)
			{
				if ((ws.OpenTime == sssx.OpenTime) && (ws.CloseTime == sssx.CloseTime))
				{
					sss = sssx;
					break;
				}
			}
			if (sss == null)
				return;

			if (user.Certification == E_Certification.Basic)
				sss.eFilersSignedUpBasic--;
			else if (user.Certification == E_Certification.Advanced)
				sss.eFilersSignedUpAdvanced--;
		}

		private bool SignUpsHasId(int id)
        {
            var ou = SignUps.Where(wi => wi.id == id);

            return ou.Any();
        }

		public List<C_SignUp> GetSignUpsForUser(int userId)
		{
			var ou = SignUps.Where(wi => wi.UserId == userId);
			List<C_SignUp> res = ou.ToList();

			return res;
		}

        public List<C_SignUp> GetSignUpsForSiteOnDate(C_YMD onDate, string siteSlug)
        {
            var ou = SignUps.Where(wi => ((wi.Date == onDate) && (wi.SiteSlug == siteSlug)));
            return ou.ToList();
        }

        public void ClearDirtyFlagOnSignUps()
        {
            foreach (C_SignUp wi in SignUps)
                wi.Dirty = false;
        }

        public List<C_SignUp> GetSignUpsByShiftId(int shiftId)
        {
            var ou = SignUps.Where(wi => wi.ShiftId == shiftId);
            return ou.ToList();
        }

        public int GetCountOfSignUpsByShiftId(int shiftId)
		{
			var ou = SignUps.Where(wi => wi.ShiftId == shiftId);
            return ou.Count();
		}

		// ------------- workshifts mgmt ----------------

		/// <summary>
		/// Create a new work shift
		/// </summary>
		/// <returns>true if successful</returns>
		/// <param name="token">Token.</param>
		/// <param name="shift">shift to create</param>
		/// <param name="calEntry">Calendar Entry to add the shift to</param>
		public async Task<bool> CreateShift(string token, string siteSlug, C_WorkShift shift, C_CalendarEntry calEntry)
		{
			string bodyjson = shift.ToJson();

			string updateurl = "/sites/" + siteSlug + "/calendars/" + calEntry.id.ToString() + "/shifts/";

			string responseString = await Tools.Upload("POST", updateurl, bodyjson, token);

			if (responseString != null)
			{
				JsonValue responseJson = JsonValue.Parse(responseString);

				C_WorkShift cex = new C_WorkShift(responseJson);
				shift.id = cex.id;
				if (cex.SiteSlug != null)
					shift.SiteSlug = cex.SiteSlug;

				// add it to the current Site instance
				calEntry.WorkShifts.Add(shift);
                WorkShifts.Add(shift);
			}

			return responseString != null;
		}

		/// <summary>
		/// Update a shift
		/// </summary>
		/// <returns>true if successful</returns>
		/// <param name="token">Token.</param>
		/// <param name="shift">shift to update</param>
		public async Task<bool> UpdateShift(string token, string siteSlug, C_WorkShift shift, C_CalendarEntry calEntry)
		{
			string bodyjson = shift.ToJson();

			string updateurl = "/sites/" + siteSlug + "/calendars/" + calEntry.id.ToString() + "/shifts/" + shift.id.ToString();

            string responseString = await Tools.Upload("PUT", updateurl, bodyjson, token);

            if (responseString != null)
            {
				JsonValue responseJson = JsonValue.Parse(responseString);

				C_WorkShift cex = new C_WorkShift(responseJson);
				shift.id = cex.id;
				//shift.SiteSlug = cex.SiteSlug;
                shift.Dirty = false;
			}

            return responseString != null;
		}

		/// <summary>
		/// Remove a shift
		/// </summary>
		/// <returns>true if successful</returns>
		/// <param name="token">Token.</param>
		/// <param name="shift">shift to remove</param>
		/// <param name="calEntry">Calendar Entry to remove the shift from</param>
		public async Task<bool> RemoveShift(string token, string siteSlug, C_WorkShift shift, C_CalendarEntry calEntry)
		{
			string bodyjson = shift.ToJson();

			string updateurl = "/sites/" + siteSlug + "/calendars/" + calEntry.id.ToString() + "/shifts/" + shift.id.ToString();

            string responseString = await Tools.Upload("DELETE", updateurl, bodyjson, token);

            calEntry.WorkShifts.Remove(shift);
            WorkShifts.Remove(shift);

            return responseString != null;
		}

        public async Task<bool> EnsureShiftsInCacheForSignUps(string token, List<C_SignUp> signups)
        {
            foreach(C_SignUp su in signups)
            {
                // see if the workshift is already in our cache
                C_WorkShift wsfid = GetWorkShiftById(su.ShiftId);
                if (wsfid == null)
                {
                    // if not, we need to fetch the calendar then the shift
                    C_VitaSite site = await GetSiteFromCache(su.SiteSlug);
                    C_CalendarEntry ce = site.GetCalendarEntryForDate(su.Date);
                    List<C_WorkShift> shifts = await FetchAllShiftsForCalendarEntry(token, su.SiteSlug, ce);
                }
            }

            return true;
        }

		/// <summary>
		/// Get a list of all shifts for a calendar entry
		/// </summary>
		/// <returns>list of shifts for this calendar item</returns>
		/// <param name="token">Token.</param>
		public async Task<List<C_WorkShift>> FetchAllShiftsForCalendarEntry(string token, string siteSlug, C_CalendarEntry calEntry)
		{
			List<C_WorkShift> shifts = new List<C_WorkShift>();
            calEntry.WorkShifts = shifts;

			string updateurl = "/sites/" + siteSlug + "/calendars/" + calEntry.id.ToString() + "/shifts";

			string responseString = await Tools.Download(updateurl, token);

			if (responseString != null)
			{
				JsonValue responseJson = JsonValue.Parse(responseString);

				foreach (JsonValue jv in responseJson)
				{
					C_WorkShift ws = new C_WorkShift(jv)
					{
						SiteSlug = siteSlug
					};
					shifts.Add(ws);

                    if (!WorkShifts.Contains(ws))
                        WorkShifts.Add(ws);
				}

				calEntry.WorkShifts = shifts;
				calEntry.HaveShifts = true;
			}
			else
			{
				shifts = new List<C_WorkShift>();
				calEntry.WorkShifts = shifts;
			}

			return shifts;
		}

        public async Task<C_WorkShift> FetchWorkShiftById(int shiftId, string token, string siteSlug, C_CalendarEntry ce)
		{
			C_WorkShift res = null;

            string shiftUrl = "/sites/" + siteSlug + "/calendars/" + ce.id.ToString() + "/shifts/" + shiftId.ToString();

            string responseString = await Tools.Download(shiftUrl, token);

            if (responseString != null)
            {
                JsonValue responseJson = JsonValue.Parse(responseString);

                res = new C_WorkShift(responseJson);

                if (!WorkShifts.Contains(res))
                    WorkShifts.Add(res);
            }

            return res;
		}

		public C_WorkShift GetWorkShiftById(int id)
        {
            var ou = WorkShifts.Where(ws => ws.id == id);
            return ou.FirstOrDefault();
        }
    }
}
