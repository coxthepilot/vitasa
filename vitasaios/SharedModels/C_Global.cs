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
    public enum E_Reports { Unknown = 0, WorkLog, Volunteers };
    public enum E_ViewCameFrom { Unknown = 0, List, Map, MySignUps, SCSites, SCSite, Login, VolOptions, Suggestions, CalEntry, CalDefaults, 
        Users, User, Main, SCOptions, Admin, AdminSiteCalendar, AdminSiteCalReset, SiteCalendar, AdminMobileDate }
    public enum E_IOResultCode { NoError, NoConfig, OutDate, Offline, WebException, Exception, VerOutOfDate, RetryFailure, ParseError }

    public class C_Global
    {
        public static readonly string[] StateNames = {
            "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
            "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
            "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
            "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
            "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY" };

        public static string[] AbrevDayOfWeek = { "Su", "M", "Tu", "W", "Th", "F", "Sa" };

        /// <summary>
        /// Number of minutes that the site all fetch data is valid; After expiration, the
        /// sites data is refetched.
        /// </summary>
        public static int SitesExpirationTime = 10;

        /// <summary>
        /// Number of minutes that the user all fetch data is valid; After expiration, the
        /// users data is refetched.
        /// </summary>
        public static int UsersExpirationTime = 10;

        public static readonly string Name_Global = "global";

        /// <summary>
        /// This is the id user that we logged into the system with. This is the user with the valid token.
        /// </summary>
        public int LoggedInUserId = -1;

        /// <summary>
        /// A cache of sites we know about. 
        /// </summary>
        public List<C_VitaSite> SiteCache;
        public bool AllSitesFetched;
        public C_YMDhms AllSitesFetchTime;

        /// <summary>
        /// List of known users; this is not a list of ALL users, just ones we have seen
        /// </summary>
        public List<C_VitaUser> UserCache;
        public bool AllUsersFetched;
        public C_YMDhms AllUsersFetchTime;

        /// <summary>
        /// The slug of the current selected site
        /// </summary>
        public string SelectedSiteSlug;
        public string SelectedSiteName; // null if not known

        /// <summary>
        /// The details view controller needs to know where to go "Back" to
        /// </summary>
        public E_ViewCameFrom ViewCameFrom = E_ViewCameFrom.Unknown;

        /// <summary>
        /// The Month and Year last used in the Calendar view.
        /// </summary>
        public C_YMD CalendarDate;

        // These are used to pass selections from screen to screen
        public C_VitaUser SelectedUser;
        public C_VitaUser SelectedUserTemp;
        public C_VitaSite SelectedSiteTemp;
        public C_WorkLogItem SelectedWorkItem;
        public C_Suggestion SelectedSuggestion;
        public C_Notification SelectedNotification;
        public E_Reports SelectedReport;
        public List<C_CalendarEntry> DOWCalendar;
        public DayOfWeek SelectedDOW;

        public C_CalendarDateDetails CalendarDateDetails;

        // a tally of the amount of traffic we have received over the network
        public long BytesReceived;

        public bool UsingTestData;
        public List<C_Suggestion> _SuggestionCache; // only used with test data
        public List<C_Notification> _NotificationCache; // only used with test data

        public C_Global()
        {
            LoggedInUserId = -1;

            UserCache = new List<C_VitaUser>();
            SiteCache = new List<C_VitaSite>();

            _SuggestionCache = new List<C_Suggestion>();
            _NotificationCache = new List<C_Notification>();

            BytesReceived = 0;

            UsingTestData = false;
        }

        public void UseTestData(string sitesjson, string usersjson)
        {
            JsonValue jsonsites = JsonValue.Parse(sitesjson);
            ImportSites(jsonsites);

            int sid = 0;
            foreach (C_VitaSite s in SiteCache)
                s.id = sid++;

            JsonValue jsonusers = JsonValue.Parse(usersjson);
            List<C_VitaUser> users = new List<C_VitaUser>();
            foreach (JsonValue jv1 in jsonusers)
            {
                C_VitaUser vu = new C_VitaUser(jv1);
                users.Add(vu);

                UserCache.Add(vu);
            }
            int uid = 0;
            foreach (C_VitaUser u in UserCache)
                u.id = uid++;

            // fix up the site coordinator id/name in each site (the base data is missing this)
            foreach(C_VitaSite site in SiteCache)
            {
                // find all users that support this site
                List<C_VitaUser> scusers = new List<C_VitaUser>();
                foreach(C_VitaUser user in UserCache)
                {
                    if (!user.HasSiteCoordinator)
                        continue;

                    var ou = user.SitesCoordinated.Where(sc => sc.SiteId == site.id);
                    if (ou.Any())
                        scusers.Add(user);
                }
                if (scusers.Count != 0)
                {
                    List<int> scids = new List<int>();
                    List<string> scnames = new List<string>();
                    foreach(C_VitaUser u in scusers)
                    {
                        scids.Add(u.id);
                        scnames.Add(u.Name);
                    }
                    //site.SiteCoordinatorsIds = scids;
                    //site.SiteCoordinatorNames = scnames;
                }

                // fix the SiteId in any calendar entries in case there were not set correctly
                foreach (C_CalendarEntry ce in site.SiteCalendar)
                    ce.SiteID = site.id;
            }

            _SuggestionCache = new List<C_Suggestion>();
            _NotificationCache = new List<C_Notification>();

            AllUsersFetched = true;

            UsingTestData = true;
        }

        // ================= sites mgmt =======================

        /// <summary>
        /// Create a site calendar entry (shifts are updated separately)
        /// </summary>
        /// <returns>true if successful</returns>
        /// <param name="token">Token.</param>
        /// <param name="calEntry">Cal entry.</param>
        public async Task<C_IOResult> CreateCalendarEntry(C_VitaSite site, string token, C_CalendarEntry calEntry)
        {
            if (UsingTestData)
            {
                calEntry.id = GetLargestCalendarEntryId() + 1;
                calEntry.SiteID = site.id;

                // add it to the current Site instance
                site.SiteCalendar.Add(calEntry);

                calEntry.Dirty = false;

                return new C_IOResult { Success = true };
            }

            string bodyjson = calEntry.ToJson();

            string updateurl = "/sites/" + site.Slug + "/calendars/";

            C_IOResult ior = await Upload("POST", updateurl, bodyjson, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    C_CalendarEntry cex = new C_CalendarEntry(responseJson, site.id);
                    calEntry.id = cex.id;
                    calEntry.SiteID = cex.SiteID;

                    // add it to the current Site instance
                    site.SiteCalendar.Add(calEntry);

                    calEntry.Dirty = false;
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.Exception;
                ior.ErrorMessage = e.Message;
            }

            return ior;
        }

        /// <summary>
        /// Update an existing site calendar entry
        /// </summary>
        /// <returns>The calendar entry.</returns>
        /// <param name="site">Site.</param>
        /// <param name="token">Token.</param>
        /// <param name="calEntry">Cal entry.</param>
        public async Task<C_IOResult> UpdateCalendarEntry(C_VitaSite site, string token, C_CalendarEntry calEntry)
        {
            if (UsingTestData)
            {
                // return success
                return new C_IOResult { Success = true };
            }

            string bodyjson = calEntry.ToJson();

            string updateurl = "/sites/" + site.Slug + "/calendars/" + calEntry.id.ToString();

            C_IOResult ior = await Upload("PUT", updateurl, bodyjson, token);

            if (ior.Success)
                calEntry.Dirty = false;

            return ior;
        }

        /// <summary>
        /// Remove a calendar entry
        /// </summary>
        /// <returns>The calendar entry.</returns>
        /// <param name="site">Site.</param>
        /// <param name="token">Token.</param>
        /// <param name="calEntry">Cal entry.</param>
        public async Task<C_IOResult> RemoveCalendarEntry(C_VitaSite site, string token, C_CalendarEntry calEntry)
        {
            if (UsingTestData)
            {
                site.SiteCalendar.Remove(calEntry);

                // return success
                return new C_IOResult { Success = true };
            }

            string bodyjson = "";

            string updateurl = "/sites/" + site.Slug + "/calendars/" + calEntry.id.ToString();

            C_IOResult ior = await Upload("DELETE", updateurl, bodyjson, token);

            if (ior.Success)
                site.SiteCalendar.Remove(calEntry);

            return ior;
        }

        private int GetLargestCalendarEntryId()
        {
            int res = -1;

            foreach (C_VitaSite site in SiteCache)
            {
                foreach (C_CalendarEntry ce in site.SiteCalendar)
                {
                    if (ce.id > res) res = ce.id;
                }
            }

            return res;
        }

        /// <summary>
        /// Update selected fields in a site definition
        /// </summary>
        /// <returns>The simple fields.</returns>
        /// <param name="site">Site.</param>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> UpdateSite(C_VitaSite site, string token)
        {
            if (UsingTestData)
            {
                // return success
                return new C_IOResult { Success = true };
            }

            C_IOResult ior = null;
            try
            {
                C_JsonBuilder jb = new C_JsonBuilder();
                jb.Add(site.Name, C_VitaSite.N_Name);
                jb.Add(site.Street, C_VitaSite.N_Street);
                jb.Add(site.City, C_VitaSite.N_City);
                jb.Add(site.State, C_VitaSite.N_State);
                jb.Add(site.Zip, C_VitaSite.N_Zip);
                jb.Add(site.Latitude, C_VitaSite.N_Latitude);
                jb.Add(site.Longitude, C_VitaSite.N_Longitude);
                jb.Add(site.PlaceID, C_VitaSite.N_PlaceID);
                jb.Add(site.ContactName, C_VitaSite.N_ContactName);
                jb.Add(site.ContactPhone, C_VitaSite.N_ContactPhone);
                jb.Add(site.Notes, C_VitaSite.N_Notes);

                jb.StartArray(C_VitaSite.N_SiteCoordinators);
                foreach(C_SiteCoordinator sc in site.SiteCoordinators)
                    jb.AddArrayObject(sc.ToJson());
                jb.EndArray();

                string bodyjson = jb.ToString();

                ior = await UpdateSiteFields(site, bodyjson, token);
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.ParseError;
                ior.ErrorMessage = "Unable to update site details";
            }

            return ior;
        }

        /// <summary>
        /// Update site capabilities list
        /// </summary>
        /// <returns>The site capabilities.</returns>
        /// <param name="site">Site.</param>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> UpdateSiteCapabilities(C_VitaSite site, string token)
        {
            if (UsingTestData)
            {
                // return success
                return new C_IOResult { Success = true };
            }

            C_IOResult ior = null;
            try
            {
                C_JsonBuilder jb = new C_JsonBuilder();
                jb.StartArray(C_VitaSite.N_SiteCapabilities);
                foreach (E_SiteCapabilities sc in site.SiteCapabilities)
                    jb.AddArrayElement(sc.ToString());
                jb.EndArray();
                jb.Add(site.Slug, C_VitaSite.N_Slug);
                string bodyjson = jb.ToString();

                ior = await UpdateSiteFields(site, bodyjson, token);
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.ParseError;
                ior.ErrorMessage = "Unable to update site capabilities";
            }

            return ior;
        }

        /// <summary>
        /// Update a field or set of fields on this site
        /// </summary>
        /// <returns>true on success</returns>
        /// <param name="jsonString">Json string of items to update.</param>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> UpdateSiteFields(C_VitaSite site, string jsonString, string token)
        {
            if (UsingTestData)
            {
                return new C_IOResult() { Success = true };
            }

            string updateurl = "/sites/" + site.Slug;

            C_IOResult ior = await Upload("PUT", updateurl, jsonString, token);

            return ior;
        }

        /// <summary>
        /// Create a new site
        /// </summary>
        /// <returns>true on success</returns>
        /// <param name="jsonString">Json string of items to update.</param>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> CreateSite(C_VitaSite site, string jsonString, string token)
        {
            if (UsingTestData)
            {
                int id = -1;
                foreach (C_VitaSite s in SiteCache)
                    if (s.id > id) id = s.id;
                site.id = id + 1;

                site.Slug = BuildSlug(site);

                // build the slug for the site

                SiteCache.Add(site);

                return new C_IOResult() { Success = true, Site = site };
            }

            string updateurl = "/sites/";

            C_IOResult ior = await Upload("POST", updateurl, jsonString, token);

            if (ior.Success)
            {
                JsonValue responseJson = JsonValue.Parse(ior.ResponseString);
                C_VitaSite newsite = new C_VitaSite(responseJson);
                ior.Site = newsite;
                SiteCache.Add(newsite);
            }

            return ior;
        }

        private string BuildSlug(C_VitaSite site)
        {
            if (!string.IsNullOrWhiteSpace(site.Slug))
                return site.Slug;

            string res = site.Name.Trim();
            res = res.ToLower();
            res = res.Replace(' ', '-');
            res = System.Net.WebUtility.UrlEncode(res);

            return res;
        }

        /// <summary>
        /// Delete a new site
        /// </summary>
        /// <returns>true on success</returns>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> RemoveSite(C_VitaSite site, string token)
        {
            if (UsingTestData)
            {
                var ou = SiteCache.Where(s => s.Slug == site.Slug);
                C_VitaSite site2 = ou.FirstOrDefault();
                int ix2 = SiteCache.IndexOf(site2);
                SiteCache.RemoveAt(ix2);

                return new C_IOResult() { Success = true };
            }

            string updateurl = "/sites/" + site.id.ToString();

            C_IOResult ior = await Upload("DELETE", updateurl, "", token);

            if (ior.Success)
            {
                var ou = SiteCache.Where(s => s.Slug == site.Slug);
                C_VitaSite site2 = ou.FirstOrDefault();
                int ix2 = SiteCache.IndexOf(site2);
                SiteCache.RemoveAt(ix2);
            }

            return ior;
        }

        public async Task<List<C_VitaSite>> FetchAllSites(string token = null)
        {
            if (UsingTestData)
            {
                AllSitesFetched = true;

                return SiteCache;
            }

            if (AllSitesFetched)
            {
                try
                {
                    C_YMDhms expireTime = AllSitesFetchTime.AddMinutes(SitesExpirationTime);

                    // use the current data until the expire time
                    if (C_YMDhms.Now < expireTime)
                        return SiteCache;
                }
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                }
            }

            List<C_VitaSite> siteslist = null;

            C_IOResult ior = await Download("/sites", token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    siteslist = ImportSites(responseJson);

                    AllSitesFetched = true;
                    AllSitesFetchTime = C_YMDhms.Now;
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.Exception;
                ior.ErrorMessage = e.Message;
            }

            return siteslist;
        }

        public List<C_VitaSite> GetAllSitesNoFetch()
        {
            List<C_VitaSite> res = new List<C_VitaSite>();

            if (!AllSitesFetched)
                return res;

            foreach (C_VitaSite site in SiteCache)
                res.Add(site);

            return res;
        }

        public C_VitaSite GetSiteFromSlugNoFetch(string slug)
        {
            var ou = SiteCache.Where(site => site.Slug == slug);
            return ou.FirstOrDefault();
        }

        public C_VitaSite GetSiteFromIDNoFetch(int id)
        {
            var ou = SiteCache.Where(site => site.id == id);
            return ou.FirstOrDefault();
        }

        public C_VitaSite GetSiteByNameNoFetch(string name)
        {
            var ou = SiteCache.Where(s => s.Name == name);
            return ou.FirstOrDefault();
        }

        public async Task<C_VitaSite> FetchSiteWithSlug(string slug)
        {
            C_VitaSite res = GetSiteFromSlugNoFetch(slug);

            bool refetch = res == null;
            if (!refetch)
            {
                DateTime dt = res.SampleTime;
                TimeSpan ts = DateTime.Now - dt;
                refetch = ts.TotalMinutes > 30;
            }

            if (refetch && !UsingTestData)
            {
                res = await FetchSite(slug);
                if (res != null)
                {
                    if (!SiteCacheContains(res.Slug))
                        SiteCache.Add(res);
                }
            }

            return res;
        }

        public async Task<bool> EnsureSiteInCache(string slug)
        {
            var ou = SiteCache.Where(site => site.Slug == slug);
            C_VitaSite res = ou.FirstOrDefault();

            if ((res == null) && !UsingTestData)
            {
                res = await FetchSite(slug);
                if (res != null)
                {
                    if (!SiteCacheContains(res.Slug))
                        SiteCache.Add(res);
                    //CleanWorkItemsFromSite(res);
                }
            }

            return res != null;
        }

        private async Task<C_VitaSite> FetchSite(string slug)
        {
            if (UsingTestData)
            {
                return GetSiteFromSlugNoFetch(slug);
            }

            C_VitaSite site = null;

            string siteUrl = "/sites/" + slug;

            C_IOResult ior = await Download(siteUrl, null);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    site = new C_VitaSite(responseJson);
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                site = null;
            }

            return site;
        }

        /// <summary>
        /// Imports the sites.
        /// </summary>
        /// <returns>A list of sites found in the json</returns>
        /// <param name="json">the value from the backend services that has been Parsed</param>
        private List<C_VitaSite> ImportSites(JsonValue json)
        {
            List<C_VitaSite> res = new List<C_VitaSite>();
            try
            {
                foreach (JsonValue j in json)
                {
                    C_VitaSite aa = new C_VitaSite();

                    C_VitaSite vs = new C_VitaSite(j);
                    res.Add(vs);

                    //// -------- testing only ---------------
                    //C_YMD now = C_YMD.Now;
                    //foreach (C_CalendarEntry ce in vs.SiteCalendar)
                    //{
                    //    if (ce.Date < now)
                    //    {
                    //        Console.WriteLine(">>>>> " + vs.Name + " has old dates.");
                    //        break;
                    //    }
                    //}
                    //// -------- testing only ---------------

                    if (!SiteCacheContains(vs.Slug))
                        SiteCache.Add(vs);

                    AllSitesFetched = true;
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
            }

            return res;
        }

        public List<C_VitaSite> GetSitesUsingFilterNoFetch(C_SitesFilter filter, bool userHasMobile)
        {
            C_YMD date = filter.GetDateForFilter();

            List<C_VitaSite> res = new List<C_VitaSite>();
            foreach(C_VitaSite site in SiteCache)
            {
                bool openOnDay = true;
                if (date != null)
                    openOnDay = site.SiteIsOpenOnDay(date);
                bool hasCapabilities = filter.SiteHasCapabilities(site, userHasMobile);

                if (openOnDay && hasCapabilities)
                    res.Add(site);
            }

            return res;
        }

        private bool SiteCacheContains(string slug)
        {
            var ou = SiteCache.Where(s => s.Slug == slug);
            return ou.Any();
        }

        public string AllSitesToJson()
        {
            C_JsonBuilder jb = new C_JsonBuilder();

            jb.StartArray("site");
            foreach (C_VitaSite site in SiteCache)
                jb.AddArrayObject(site.ToJson());
            jb.EndArray();

            string jsonstring = jb.ToString();

            // just for fun, do a parse...
            JsonValue testjv = JsonValue.Parse(jsonstring);

            return jsonstring;
        }

        // ----------------- user mgmt ---------------------

        /// <summary>
        /// Do the login using the provided email and password. This function makes the API call and
        /// either returns null or a C_VitaUser with a valid token. No throws from this function.
        /// </summary>
        /// <returns>The login.</returns>
        /// <param name="email">Email.</param>
        /// <param name="userPassword">User password.</param>
        public async Task<C_IOResult> PerformLogin(string email, string userPassword)
        {
            if (UsingTestData)
            {
                // for testing, the email only has to be in our user list to get approved; no password needed
                bool emailFound = false;
                C_VitaUser fuser = null;
                foreach(C_VitaUser user in UserCache)
                {
                    if (user.Email == email)
                    {
                        emailFound = true;
                        fuser = user;
                        break;
                    }
                }

                C_IOResult tior = new C_IOResult();

                if (emailFound)
                {
                    tior.Success = true;
                    tior.ErrorMessage = "";
                    tior.ResultCode = E_IOResultCode.NoError;
                    tior.User = fuser;
                }
                else
                {
                    tior.Success = false;
                    tior.ErrorMessage = "Bad email";
                    tior.ResultCode = E_IOResultCode.WebException;
                    tior.User = null;
                }

                return tior;
            }

            bool b = await CheckConfig();

            C_IOResult res = StartIOResult();

            if (res.ResultCode != E_IOResultCode.NoError)
                return res;

            try
            {
                // do the login with the api's
                var client = new HttpClient()
                {
                    BaseAddress = new Uri(Config.BackendUrl)
                };
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                C_JsonBuilder jb = new C_JsonBuilder();
                jb.Add(email, C_VitaUser.N_Email);
                jb.Add(userPassword, C_VitaUser.N_Password);
                string bodyjson = jb.ToString();

                var content = new StringContent(bodyjson, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync("/login", content);

                var responseString = await response.Content.ReadAsStringAsync();

                BytesReceived += responseString.Length;

                if (response.StatusCode == HttpStatusCode.Unauthorized)
                {
                    res.Success = false;
                    res.ResultCode = E_IOResultCode.WebException;
                    res.ErrorMessage = "Bad email or password.";

                    return res;
                }
                else if (response.StatusCode != HttpStatusCode.OK)
                {
                    res.Success = false;
                    res.ResultCode = E_IOResultCode.WebException;
                    res.ErrorMessage = "error in login (" + response.StatusCode + ")";

                    return res;
                }

                // success should include the user details
                JsonValue responseJson = JsonValue.Parse(responseString);

                res.User = new C_VitaUser(responseJson);

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

                res.User.Token = token;
                LoggedInUserId = res.User.id;

                C_VitaUser ux = GetUserFromCacheNoFetch(LoggedInUserId);
                if (ux == null)
                    UserCache.Add(res.User);
                else
                    ux.Token = res.User.Token;

                res.Success = true;
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif               
                res.Success = false;
                res.User = null;
                res.ResultCode = E_IOResultCode.Exception;
                res.ErrorMessage = e.Message;
            }

            return res;
        }

        public async Task<C_IOResult> UpdateUserFields(C_JsonBuilder jb, C_VitaUser user, string token)
        {
            if (UsingTestData)
            {
                return new C_IOResult() { Success = true };
            }

            string bodyjson = jb.ToString();

            string submiturl = "/users/" + user.id.ToString();

            if (token == null)
                token = user.Token;

            C_IOResult ior = await Upload("PUT", submiturl, bodyjson, token);
#if DEBUG
            if (ior.Success)
            {
                JsonValue jvu = JsonValue.Parse(ior.ResponseString);
                C_VitaUser tuser = new C_VitaUser(jvu);

                if ((tuser.Name != user.Name)
                    || (tuser.Phone != user.Phone)
                    || (tuser.Email != user.Email)
                    || (tuser.Certification != user.Certification)
                    || (tuser.Roles.Count != user.Roles.Count))
                    ior.ResponseString = null;

                if (tuser.Roles.Count == user.Roles.Count)
                {
                    tuser.Roles.Sort();
                    user.Roles.Sort();
                    foreach (E_VitaUserRoles role in tuser.Roles)
                    {
                        bool found = false;
                        foreach (E_VitaUserRoles r in user.Roles)
                        {
                            if (role == r)
                            {
                                found = true;
                                break;
                            }
                        }
                        if (!found)
                        {
                            ior.ResponseString = null;
                            break;
                        }
                    }
                }
            }
#endif
            return ior;
        }

        /// <summary>
        /// Fetchs the users list. Must have admin privilege to run.
        /// </summary>
        /// <returns>The users list.</returns>
        /// <param name="token">Token.</param>
        public async Task<List<C_VitaUser>> FetchAllUsers(string token)
        {
            if (UsingTestData)
                return UserCache;

            if (AllUsersFetched)
            {
                C_YMDhms expireTime = AllUsersFetchTime.AddMinutes(UsersExpirationTime);
                if (C_YMDhms.Now < expireTime)
                    return UserCache;
            }

            List<C_VitaUser> res = null;
            AllUsersFetched = false;

            string usersUrl = "/users";

            try
            {
                C_IOResult ior = await Download(usersUrl, token);

                JsonValue jv = JsonValue.Parse(ior.ResponseString);

                try
                {
                    res = new List<C_VitaUser>();
                    foreach (JsonValue jv1 in jv)
                    {
                        C_VitaUser vu = new C_VitaUser(jv1);
                        res.Add(vu);

                        var ou = UserCache.Where(u => u.id == vu.id);
                        if (!ou.Any())
                            UserCache.Add(vu);
                    }
                }
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                }

                AllUsersFetched = true;
                AllUsersFetchTime = C_YMDhms.Now;
            }
            catch (Exception e)
            {
                res = null;
                AllUsersFetched = false;
#if DEBUG
                Console.WriteLine(e.Message);
#endif
            }

            return res;
        }

        public List<C_VitaUser> GetAllUsersNoCache()
        {
            List<C_VitaUser> res = new List<C_VitaUser>();
            if (!AllUsersFetched)
                return res;

            foreach (C_VitaUser user in UserCache)
                res.Add(user);

            return res;
        }

        public async Task<C_IOResult> RemoveUser(int id, string token)
        {
            if (UsingTestData)
            {
                C_VitaUser user = null;
                foreach(C_VitaUser u in UserCache)
                {
                    if (u.id == id)
                    {
                        user = u;
                        break;
                    }
                }
                if (user != null)
                    UserCache.Remove(user);

                return new C_IOResult() { Success = true };
            }

            string usersUrl = "/users/" + id.ToString();

            C_IOResult ior = await Upload("DELETE", usersUrl, "", token);

            if (ior.Success)
            {
                C_VitaUser u = GetUserFromCacheNoFetch(id);
                if (u != null)
                    UserCache.Remove(u);
            }

            return ior;
        }

        public async Task<C_IOResult> CreateUser(C_VitaUser user, string token)
        {
            if (UsingTestData)
            {
                if (!UserCache.Contains(user))
                {
                    // find the largest id in use so we can pick one higher for this user
                    int nid = -1;
                    foreach (C_VitaUser u in UserCache)
                        if (u.id > nid) nid = u.id;

                    foreach (C_VitaUser u in UserCache)
                        if (u.id == -1) u.id = ++nid;

                    user.id = ++nid;
                    UserCache.Add(user);
                }

                return new C_IOResult() { Success = true, User = user };
            }
            string usersUrl = "/users/";

            string userjson = user.ToJson();

            C_IOResult ior = await Upload("POST", usersUrl, userjson, token);

            if (ior.Success)
            {
                JsonValue jv = JsonValue.Parse(ior.ResponseString);
                C_VitaUser u = new C_VitaUser(jv);
                ior.User = u;
                UserCache.Add(ior.User);
            }

            return ior;
        }

        public C_VitaUser GetUserFromCacheNoFetch(int id)
        {
            var ou = UserCache.Where(u => u.id == id);
            return ou.FirstOrDefault();
        }

        public C_VitaUser GetUserFromCacheNoFetch(string email)
        {
            var ou = UserCache.Where(u => u.Email == email);
            return ou.FirstOrDefault();
        }

        private bool UserCacheContains(int userId)
        {
            var ou = UserCache.Where(u => u.id == userId);
            return ou.Any();
        }

        public async Task<C_VitaUser> FetchUserWithId(int userid)
        {
            C_VitaUser user = GetUserFromCacheNoFetch(userid);

            // if not found them pull from the API and store off the workintents
            if (user == null)
            {
                C_VitaUser loggedInUser = GetUserFromCacheNoFetch(LoggedInUserId);

                if ((loggedInUser == null) || UsingTestData)
                    return null;

                user = await FetchUser(loggedInUser.Token, userid);

                if (user != null)
                {
                    UserCache.Add(user);
                    //CleanWorkItemsFromUser(user);
                }
            }

            return user;
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

            res = GetUserFromCacheNoFetch(id);
            if (res != null)
                return res;

            string usersUrl = "/users/" + id.ToString();

            C_IOResult ior = await Download(usersUrl, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    res = new C_VitaUser(responseJson);
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                res = null;
            }

            return res;
        }

        public async Task<C_IOResult> SubscribeUserToMobileSites(C_VitaUser user, string token, bool subscribe)
        {
            user.SubscribeMobile = subscribe;

            if (UsingTestData)
            {
                return new C_IOResult() { Success = true };
            }

            C_IOResult ior = await UpdateUserFields(user.ToJsonAsJsonBuilder(), user, token);


            return ior;
        }

        // --------------------- work log items -------------------
        const double EPSILON = 0.01d;

        public async Task<C_IOResult> AddWorkLogItem(C_VitaUser user, string token, C_WorkLogItem workLogItem)
        {
            if (UsingTestData)
            {
                workLogItem.id = GetLargestWorkLogItemID() + 1;
                user.WorkItems.Add(workLogItem);

                return new C_IOResult() { Success = true };
            }

            string usersUrl = "/users/" + user.id.ToString() + "/work_logs/";

            //workLogItem.UserId = user.id;
            string worklogjson = workLogItem.ToJson();

            C_IOResult ior = await Upload("POST", usersUrl, worklogjson, token);

            if (ior.Success)
            {
                // the response string is that of a user with the worklog embedded
                JsonValue rjv = JsonValue.Parse(ior.ResponseString);
                C_VitaUser ux = new C_VitaUser(rjv);
                // find the worklog we just created to get its id
                foreach(C_WorkLogItem wix in ux.WorkItems)
                {
                    if ((wix.Date == workLogItem.Date) && (Math.Abs(wix.Hours - workLogItem.Hours) < EPSILON) && (wix.SiteSlug == workLogItem.SiteSlug))
                    {
                        workLogItem.id = wix.id;
                        break;
                    }
                }
                user.WorkItems.Add(workLogItem);

                // and add it to the site's list as well
                C_VitaSite site = GetSiteFromSlugNoFetch(workLogItem.SiteSlug);

                if (site != null)
                    site.WorkLogItems.Add(workLogItem);
            }

            return ior;
        }

        public async Task<C_IOResult> UpdateWorkLogItem(C_VitaUser user, string token, C_WorkLogItem workLogItem)
        {
            if (workLogItem.id == -1)
                throw new ApplicationException("id must not be -1 for an update");

            if (UsingTestData)
            {
                return new C_IOResult() { Success = true };
            }

            string usersUrl = "/users/" + user.id.ToString() + "/work_logs/" + workLogItem.id.ToString();

            string worklogjson = workLogItem.ToJson();

            C_IOResult ior = await Upload("PUT", usersUrl, worklogjson, token);

            // note that the ior.responsestring is that of a user/json, not a worklog
            if (ior.Success)
            {
                // we need to make sure the copy of this item on the server
                C_VitaSite site = GetSiteFromSlugNoFetch(workLogItem.SiteSlug);
                if (site != null)
                {
                    foreach (C_WorkLogItem wix in site.WorkLogItems)
                    {
                        if (wix.id == workLogItem.id)
                        {
                            wix.Approved = workLogItem.Approved;
                            wix.Date = workLogItem.Date;
                            wix.Hours = workLogItem.Hours;

                            break;
                        }
                    }
                }
            }

            return ior;
        }

        public async Task<C_IOResult> RemoveWorkLogItem(C_VitaUser user, string token, C_WorkLogItem workLogItem)
        {
            if (workLogItem.id == -1)
                throw new ApplicationException("id must not be -1 for a delete");

            if (UsingTestData)
            {
                user.WorkItems.Remove(workLogItem);

                return new C_IOResult() { Success = true };
            }

            string usersUrl = "/users/" + user.id.ToString() + "/work_logs/" + workLogItem.id.ToString();

            string worklogjson = workLogItem.ToJson();

            C_IOResult ior = await Upload("DELETE", usersUrl, worklogjson, token);

            if (ior.Success)
            {
                user.WorkItems.Remove(workLogItem);
                // and find this workitem in the site side
                C_VitaSite site = GetSiteFromSlugNoFetch(workLogItem.SiteSlug);
                if (site != null)
                {
                    int wiix = -1;
                    for(int ix = 0; ix != site.WorkLogItems.Count; ix++)
                    {
                        C_WorkLogItem wix = site.WorkLogItems[ix];
                        if (wix.id == workLogItem.id)
                        {
                            wiix = ix;
                            break;
                        }
                    }
                    if (wiix != -1)
                        site.WorkLogItems.RemoveAt(wiix);
                }
            }
                
            return ior;
        }

        private int GetLargestWorkLogItemID()
        {
            int res = -1;

            foreach(C_VitaUser u in UserCache)
            {
                foreach(C_WorkLogItem wi in u.WorkItems)
                    if (wi.id > res) res = wi.id;
            }

            return res;
        }

        // ==================== suggestion mgmt ==================

        public async Task<List<C_Suggestion>> FetchAllSuggestions(string token)
        {
            if (UsingTestData)
            {
                return _SuggestionCache;
            }

            List<C_Suggestion> res = null;

            string submiturl = "/suggestions";

            C_IOResult ior = await Download(submiturl, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    res = ImportSuggestions(responseJson);
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.Exception;
                ior.ErrorMessage = e.Message;
            }

            return res;
        }

        private static List<C_Suggestion> ImportSuggestions(JsonValue jv)
        {
            // create the holding place for the results
            List<C_Suggestion> res = new List<C_Suggestion>();
            foreach (JsonValue j in jv)
            {
                try
                {
                    C_Suggestion vs = new C_Suggestion(j);
                    res.Add(vs);
                }
                catch (Exception e)
                {
#if DEBUG
                    Console.WriteLine(e.Message);
#endif
                }
            }

            return res;
        }

        public async Task<C_IOResult> CreateSuggestion(C_Suggestion sug, string token)
        {
            if (UsingTestData)
            {
                _SuggestionCache.Add(sug);

                return new C_IOResult() { Success = true };
            }

            string escapedText = sug.Text.Replace("\n", "\\n");

            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(sug.Subject, C_Suggestion.N_Subject);
            jb.Add(escapedText, C_Suggestion.N_Text);
            jb.Add(sug.FromPublic, C_Suggestion.N_FromPublic);
            string bodyjson = jb.ToString();

            string submiturl = "/suggestions";

            C_IOResult ior = await Upload("POST", submiturl, bodyjson, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    C_Suggestion nsug = new C_Suggestion(responseJson);
                    sug.id = nsug.id;
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.Exception;
                ior.ErrorMessage = e.Message;
            }

            return ior;
        }

        /// <summary>
        /// Makes the API call to add a Suggestion. If successful, also adds to the User Suggestions list.
        /// </summary>
        /// <returns>true on success</returns>
        public async Task<C_IOResult> UpdateSuggestion(C_Suggestion sug, string token)
        {
            if (UsingTestData)
            {
                return new C_IOResult() { Success = true };
            }

            string escapedText = sug.Text.Replace("\n", "\\n");

            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(sug.Subject, C_Suggestion.N_Subject);
            jb.Add(escapedText, C_Suggestion.N_Text);
            jb.Add(sug.Status.ToString(), C_Suggestion.N_Status);
            string bodyjson = jb.ToString();

            string submiturl = "/suggestions/" + sug.id.ToString();

            C_IOResult ior = await Upload("PUT", submiturl, bodyjson, token);

            return ior;
        }

        /// <summary>
        /// Makes the API call to remove the Suggestion; on success, removes from this users Suggestions list
        /// </summary>
        /// <returns>True on success</returns>
        public async Task<C_IOResult> RemoveSuggestion(C_Suggestion sug, string token)
        {
            if (UsingTestData)
            {
                _SuggestionCache.Remove(sug);

                return new C_IOResult() { Success = true };
            }

            string submiturl = "/suggestions/" + sug.id.ToString();

            C_IOResult ior = await Upload("DELETE", submiturl, "", token);

            return ior;
        }

        // ================ register notification token ========

        /// <summary>
        /// Registers a token with the backend for use in sending notifications.
        /// </summary>
        /// <returns>The notification token.</returns>
        /// <param name="platform">Platform.</param>
        /// <param name="deviceToken">This is the token that we are to save, obtained from the push provider</param>
        /// <param name="authToken">this is the cookie that allows us to access the backend</param>
        public async Task<C_IOResult> RegisterNotificationToken(E_Platform platform, string deviceToken, string authToken)
        {
            if (UsingTestData)
                return new C_IOResult() { Success = true };

            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(deviceToken, C_Notifications.N_RegistrationToken);
            jb.Add(platform.ToString().ToLower(), C_Notifications.N_Platform);
            string bodyjson = jb.ToString();

            string submiturl = "/notification_registrations";

            C_IOResult ior = await Upload("POST", submiturl, bodyjson, authToken);

            return ior;
        }

        // ========================== notifications ================

        public async Task<List<C_Notification>> FetchAllNotifications(string token)
        {
            if (UsingTestData)
            {
                return _NotificationCache;
            }

            List<C_Notification> res = new List<C_Notification>();

            string url = "/notification_requests/";

            C_IOResult ior = await Download(url, token);

            if (ior.Success)
            {
                JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                foreach (JsonValue jv in responseJson)
                {
                    C_Notification n = new C_Notification(jv);
                    res.Add(n);
                }
            }

            return res;
        }

        public async Task<C_IOResult> UpdateNotification(C_Notification notification, string token)
        {
            if (UsingTestData)
            {
                if (notification.id == -1)
                {
                    int xid = -1;
                    foreach(C_Notification n in _NotificationCache)
                    {
                        if (n.id > -1) xid = n.id;
                    }
                    notification.id = ++xid;

                    _NotificationCache.Add(notification);
                }

                return new C_IOResult() { Success = true };
            }

            C_IOResult ior = null;

            string auds = notification.Audience == E_NotificationAudience.Volunteers ? "volunteers" : "sc";

            string escapedMessage = notification.Message.Replace("\n", "\\n");

            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(escapedMessage, C_Notification.N_Message);
            jb.Add(auds, C_Notification.N_Audience);
            string bodyjson = jb.ToString();

            // check to see if this is a create or update
            if (notification.id == -1)
            {
                // is a create
                string url = "/notification_requests/";

                ior = await Upload("POST", url, bodyjson, token);

                JsonValue responseJson = JsonValue.Parse(ior.ResponseString);
                if (responseJson.ContainsKey(C_Notification.N_Id))
                    notification.id = Tools.JsonProcessInt(responseJson[C_Notification.N_Id], notification.id);
            }
            else
            {
                // is an update
                string url = "/notification_requests/" + notification.id.ToString();

                ior = await Upload("PUT", url, bodyjson, token);
            }

            notification.Dirty &= !ior.Success;

            return ior;
        }

        public async Task<C_IOResult> RemoveNotification(C_Notification notification, string token)
        {
            if (UsingTestData)
            {
                _NotificationCache.Remove(notification);

                return new C_IOResult() { Success = true };
            }

            if (notification.id == -1)
            {
                C_IOResult res = new C_IOResult()
                {
                    Success = true
                };
                return res;
            }

            string url = "/notification_requests/" + notification.id.ToString();

            C_IOResult ior = await Upload("DELETE", url, "", token);

            return ior;
        }

        public async Task<C_IOResult> SendNotification(C_Notification notification, string token)
        {
            if (UsingTestData)
            {
                notification.SentDT = DateTime.Now;
                return new C_IOResult() { Success = true };
            }

            string url = "/notification_requests/" + notification.id.ToString() + "/resend/";
            if (notification.SentDT == DateTime.MinValue)
                url = "/notification_requests/" + notification.id.ToString() + "/send/";

            C_IOResult ior = await Upload("POST", url, "", token);

            return ior;
        }

        // =================== core upload/download =================

        public C_Config Config;
        public const string N_ConfigURL = "https://s3-us-west-2.amazonaws.com/vitasa/";
        public const string N_ConfigName = "config.json";

        public async Task<bool> CheckConfig()
        {
            bool res = true;
            if ((Config == null) || !Config.IsValid())
            {
                try
                {
                    WebClient wc = new WebClient()
                    {
                        BaseAddress = N_ConfigURL
                    };

                    string rs = await wc.DownloadStringTaskAsync(N_ConfigName);

                    JsonValue responseJson = JsonValue.Parse(rs);

                    Config = new C_Config(responseJson);

                    res = true;
                }
                catch (Exception e)
                {
                    Config = new C_Config();
                    res = false;
#if DEBUG
                    Console.WriteLine(e.Message);
#endif
                }
            }

            return res;
        }

        private C_IOResult StartIOResult()
        {
            C_IOResult res = new C_IOResult()
            {
                Success = false,
                ResponseString = null,
                ResultCode = E_IOResultCode.NoError,
                ErrorMessage = null
            };

            if (Config.Offline)
            {
                res.Success = false;
                res.ResultCode = E_IOResultCode.Offline;
                res.ErrorMessage = "Unfortunately, applications services are currently offline. Please check back shortly.";
            }
            else
            {
                bool ourVerOk = true;

                string configKey = C_Config.N_IOS_Vol_Phone;
#if __ADMIN
                configKey = C_Config.N_IOS_Admin_Tablet;
#endif

#if __IOS__
                string ourVerString = Foundation.NSBundle.MainBundle.InfoDictionary["CFBundleShortVersionString"].ToString();
                string minVerString = null;
                if (Config.MinimumVersions.ContainsKey(configKey))
                    minVerString = Config.MinimumVersions[configKey];
                ourVerOk = true;
                if ((ourVerString != null) && (minVerString != null))
                    ourVerOk = CheckMinVersion(ourVerString, minVerString);
#endif

#if __ANDROID__
                string ourVerString = C_ToolsExtra.GetVersion();
                string minVerString = null;
                if (Config.MinimumVersions.ContainsKey(C_Config.N_Android_Vol_Phone))
                    minVerString = Config.MinimumVersions[C_Config.N_Android_Vol_Phone];
				ourVerOk = true;
				if ((ourVerString != null) && (minVerString != null))
					ourVerOk = CheckMinVersion(ourVerString, minVerString);
#endif
				if (!ourVerOk)
                {
                    res.Success = false;
                    res.ResultCode = E_IOResultCode.VerOutOfDate;
                    res.ErrorMessage = "The application is out of date. Please update.";
                }
			}

            return res;
        }

        private bool CheckMinVersion(string ourVer, string minVer)
        {
            Version oVer = new Version(minVer);
            Version mVer = new Version(ourVer);

            int vcomp = mVer.CompareTo(oVer);

            return vcomp >= 0;
        }

		public async Task<C_IOResult> Upload(string httpOp, string submiturl, string bodyjson, string token, string acceptLanguage = null)
		{
			bool b = await CheckConfig();

            C_IOResult res = StartIOResult();

            if (res.ResultCode != E_IOResultCode.NoError)
                return res;

            int retryCount = 0;
			bool retry = false;
			do
			{
				try
				{
					retry = false;

					WebClient wc = new WebClient()
					{
                        BaseAddress = Config.BackendUrl
					};
					if (token != null)
						wc.Headers.Add(HttpRequestHeader.Cookie, token);
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");
                    if (acceptLanguage != null)
    					wc.Headers.Add(HttpRequestHeader.AcceptLanguage, acceptLanguage);

					res.ResponseString = await wc.UploadStringTaskAsync(submiturl, httpOp, bodyjson);

                    BytesReceived += res.ResponseString.Length;

                    res.Success = true;
                    res.ResultCode = E_IOResultCode.NoError;
                    res.ErrorMessage = null;
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						retry = retryCount < 3;
						retryCount++;
#if DEBUG
                        Console.WriteLine(we.Message);
#endif
                        if (!retry)
                        {
                            res.Success = false;
                            res.ResultCode = E_IOResultCode.RetryFailure;
                            res.ErrorMessage = "Unable to access the DB (retry error).";
                        }
					}
					else
					{
#if DEBUG
                        Console.WriteLine(we.Message);
#endif
						retry = false;
                        res.Success = false;
                        res.ResultCode = E_IOResultCode.WebException;
                        res.ErrorMessage = we.Message;
					}
				}
				catch (Exception e)
				{
#if DEBUG
                    Console.WriteLine(e.Message);
#endif
                    retry = false;
                    res.Success = false;
                    res.ResultCode = E_IOResultCode.Exception;
                    res.ErrorMessage = e.Message;
				}
			}
			while (retry);

			return res;
		}

		public async Task<C_IOResult> Download(string submiturl, string token = null, string acceptLanguage = null)
		{
            bool b = await CheckConfig();

            C_IOResult res = StartIOResult();

            if (res.ResultCode != E_IOResultCode.NoError)
                return res;

            int retryCount = 0;
            bool retry = false;
			do
			{
				try
				{
					retry = false;

					WebClient wc = new WebClient()
					{
						BaseAddress = Config.BackendUrl
					};
					if (token != null)
						wc.Headers.Add(HttpRequestHeader.Cookie, token);
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");
					if (acceptLanguage != null)
						wc.Headers.Add(HttpRequestHeader.AcceptLanguage, acceptLanguage);

                    if (!submiturl.EndsWith("/", StringComparison.Ordinal))
                        submiturl = submiturl + "/";
                    
					res.ResponseString = await wc.DownloadStringTaskAsync(submiturl);

					BytesReceived += res.ResponseString.Length;

                    res.Success = true;
					res.ResultCode = E_IOResultCode.NoError;
					res.ErrorMessage = null;
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						retry = retryCount < 3;
						retryCount++;
#if DEBUG
                        Console.WriteLine(we.Message);
#endif
						if (!retry)
						{
							res.Success = false;
							res.ResultCode = E_IOResultCode.RetryFailure;
							res.ErrorMessage = "Unable to access the DB (retry error).";
						}
					}
					else
					{
#if DEBUG
                        Console.WriteLine(we.Message);
#endif
						retry = false;
						res.Success = false;
						res.ResultCode = E_IOResultCode.WebException;
						res.ErrorMessage = we.Message;
					}
				}
				catch (Exception e)
				{
#if DEBUG
                    Console.WriteLine(e.Message);
#endif
					retry = false;
					res.Success = false;
					res.ResultCode = E_IOResultCode.Exception;
					res.ErrorMessage = e.Message;
				}
			}
			while (retry);

			return res;
		}
    }
}
