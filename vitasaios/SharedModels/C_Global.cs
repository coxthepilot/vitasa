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
    public enum E_IOResultCode { NoError, NoConfig, OutDate, Offline, WebException, Exception, VerOutOfDate, RetryFailure, ParseError }

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
        public List<C_SignUp> SignUpsList;
        // int = year * 12 + month
        public Dictionary<int, bool> SignUpsFetched;

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
        public string SelectedSiteName; // null if not known

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
        // string = site-slug, int = year & month
        Dictionary<string, Dictionary<int, List<C_SiteSchedule>>> SiteScheduleBySiteCache;

        // used in vitaadmin, in Users for displaying signups for a user
        public C_VitaUser SelectedUser;

        public long BytesReceived;

        public C_Global()
        {
            LoggedInUserId = -1;

            UserCache = new List<C_VitaUser>();
            SiteCache = new List<C_VitaSite>();
            SignUpsList = new List<C_SignUp>();
            SignUpsFetched = new Dictionary<int, bool>();
            WorkShifts = new List<C_WorkShift>();

            BytesReceived = 0;
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
            string bodyjson = calEntry.ToJson(false);

            string updateurl = "/sites/" + site.Slug + "/calendars/";

            C_IOResult ior = await Upload("POST", updateurl, bodyjson, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    C_CalendarEntry cex = new C_CalendarEntry(responseJson);
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
            string bodyjson = calEntry.ToJson(false);

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
            string bodyjson = "";

            string updateurl = "/sites/" + site.Slug + "/calendars/" + calEntry.id.ToString();

            C_IOResult ior = await Upload("DELETE", updateurl, bodyjson, token);

            if (ior.Success)
                site.SiteCalendar.Remove(calEntry);

            return ior;
        }

        /// <summary>
        /// Update selected fields in a site definition
        /// </summary>
        /// <returns>The simple fields.</returns>
        /// <param name="site">Site.</param>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> UpdateSimpleFields(C_VitaSite site, string token)
        {
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
                jb.Add(site.PrimaryCoordinatorId, C_VitaSite.N_PrimaryCoordinatorId);
                jb.Add(site.BackupCoordinatorId, C_VitaSite.N_BackupCoordinatorIdForPut);
                jb.Add(site.SeasonFirstDate, C_VitaSite.N_SeasonFirstDate);
                jb.Add(site.SeasonLastDate, C_VitaSite.N_SeasonLastDate);
                string bodyjson = jb.ToString();

                ior = await UpdateSite(site, bodyjson, token);
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
        /// Update site status
        /// </summary>
        /// <returns>The site status.</returns>
        /// <param name="site">Site.</param>
        /// <param name="newClientSiteStatus">New client site status.</param>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> UpdateSiteStatus(C_VitaSite site, E_ClientSiteStatus newClientSiteStatus, string token)
        {
            if (site.ClientStatus == newClientSiteStatus)
            {
                C_IOResult res = new C_IOResult()
                {
                    Success = true,
                    ResultCode = E_IOResultCode.NoError
                };
                return res;
            }

            C_IOResult ior = null;
            try
            {
                C_JsonBuilder jb = new C_JsonBuilder();
                jb.Add(newClientSiteStatus.ToString(), C_VitaSite.N_ClientStatus);
                string bodyjson = jb.ToString();

                ior = await UpdateSite(site, bodyjson, token);

                if (ior.Success)
                    site.ClientStatus = newClientSiteStatus;
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.ParseError;
                ior.ErrorMessage = "Unable to update site status";
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
            C_IOResult ior = null;
            try
            {
                //StringBuilder sb = new StringBuilder();

                //sb.Append("{ \"site_features\" : [");
                //for (int ix = 0; ix != site.SiteCapabilities.Count; ix++)
                //{
                //    if (ix != 0)
                //        sb.Append(",");
                //    sb.Append("\"" + site.SiteCapabilities[ix].ToString() + "\"");
                //}

                //sb.Append("]");
                //sb.Append(",");
                //sb.Append("\"" + C_VitaSite.N_Slug + "\" : \"" + site.Slug + "\"");
                //sb.Append("}");

                //string bodyjson = sb.ToString();

                C_JsonBuilder jb = new C_JsonBuilder();
                jb.StartArray(C_VitaSite.N_SiteCapabilities);
                foreach (E_SiteCapabilities sc in site.SiteCapabilities)
                    jb.AddArrayElement(sc.ToString());
                jb.EndArray();
                jb.Add(site.Slug, C_VitaSite.N_Slug);
                string bodyjson = jb.ToString();

                ior = await UpdateSite(site, bodyjson, token); // verify that bj == bodyjson, if so remove the manual version
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
        private async Task<C_IOResult> UpdateSite(C_VitaSite site, string jsonString, string token)
        {
            string updateurl = "/sites/" + site.Slug;

            C_IOResult ior = await Upload("PUT", updateurl, jsonString, token);

            return ior;
        }

        public async Task<List<C_VitaSite>> FetchAllSites()
        {
            List<C_VitaSite> siteslist = null;

            C_IOResult ior = await Download("/sites");

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    siteslist = ImportSites(responseJson);
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

        public C_VitaSite GetSiteByNameNoFetch(string name)
        {
            var ou = SiteCache.Where(s => s.Name == name);
            return ou.FirstOrDefault();
        }

        public async Task<C_VitaSite> GetSiteFromCache(string slug)
        {
            C_VitaSite res = GetSiteFromSlugNoFetch(slug);

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

        private async Task<C_VitaSite> FetchSite(string slug)
        {
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
            foreach (JsonValue j in json)
            {
                try
                {
                    C_VitaSite vs = new C_VitaSite(j)
                    {
                        SampleTime = DateTime.Now
                    };
                    res.Add(vs);

                    if (!SiteCacheContains(vs.Slug))
                        SiteCache.Add(vs);

                    CleanWorkItemsFromSite(vs);

                    AllSitesFetched = true;
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

        private void CleanWorkItemsFromSite(C_VitaSite site)
        {
            List<C_SignUp> intents = site.WorkIntentsX;
            site.WorkIntentsX = null;
            List<C_SignUp> history = site.WorkHistoryX;
            site.WorkHistoryX = null;

            foreach (C_SignUp wi in intents)
            {
                if (!SignUpsHasId(wi.id))
                    SignUpsList.Add(wi);
            }

            foreach (C_SignUp wi in history)
            {
                if (!SignUpsHasId(wi.id))
                    SignUpsList.Add(wi);
            }
        }

        //public async Task<List<C_VitaSite>> GetOpenSitesOnDate(C_YMD onDate)
        //{
        //    // at the current api level, the only option is to get data on ALL sites (slow, lots of data)
        //    if (!AllSitesFetched)
        //    {
        //        List<C_VitaSite> sites = await FetchAllSites();
        //    }

        //    List<C_VitaSite> res = new List<C_VitaSite>();

        //    foreach (C_VitaSite site in SiteCache)
        //    {
        //        if (site.SiteIsOpenOnDay(onDate))
        //            res.Add(site);
        //    }

        //    return res;
        //}

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
            foreach (string slug in SiteSlugsForOpenSites)
            {
                C_VitaSite site = GetSiteFromSlugNoFetch(slug);
                res.Add(site);
            }

            return res;
        }

        private bool SiteCacheContains(string slug)
        {
            var ou = SiteCache.Where(s => s.Slug == slug);
            return ou.Any();
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

                //string jsonData = "{"
                //+ "\"email\" : \"" + email + "\""
                //+ ",\"password\" : \"" + userPassword + "\""
                //+ "}";

                C_JsonBuilder jb = new C_JsonBuilder();
                jb.Add(email, C_VitaUser.N_Email);
                jb.Add(userPassword, C_VitaUser.N_Password);
                string bodyjson = jb.ToString();

                var content = new StringContent(bodyjson, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync("/login", content);

                var responseString = await response.Content.ReadAsStringAsync();

                BytesReceived += responseString.Length;

                if (response.StatusCode != HttpStatusCode.OK)
                {
                    res.Success = false;
                    res.ResultCode = E_IOResultCode.WebException;
                    res.ErrorMessage = "error in login (bad http status code)";

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
                if (!UserCacheContains(res.User.id))
                {
                    UserCache.Add(res.User);
                    CleanWorkItemsFromUser(res.User);
                }

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

        public async Task<C_IOResult> UpdateUserPassword(C_VitaUser user, string token)
        {
            if (token == null)
                token = user.Token;

            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(user.Password, C_VitaUser.N_Password);
            jb.Add(user.Password, C_VitaUser.N_PasswordConfirmation);
            string bodyjson = jb.ToString();

            string submiturl = "/users/" + user.id.ToString();

            C_IOResult ior = await Upload("PUT", submiturl, bodyjson, token);

            return ior;
        }

        //public async Task<C_IOResult> UpdateUserProfile(C_VitaUser user)
        //{
        //    C_JsonBuilder jb = new C_JsonBuilder();
        //    jb.Add(user.Name, C_VitaUser.N_Name);
        //    jb.Add(user.Phone, C_VitaUser.N_Phone);
        //    string bodyjson = jb.ToString();

        //    string submiturl = "/users/" + user.id.ToString();

        //    C_IOResult ior = await Upload("PUT", submiturl, bodyjson, user.Token);

        //    return ior;
        //}

        public async Task<C_IOResult> UpdateUserProfile(C_VitaUser user, string token = null)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(user.Name, C_VitaUser.N_Name);
            jb.Add(user.Phone, C_VitaUser.N_Phone);
            jb.Add(user.Email, C_VitaUser.N_Email);
            jb.Add(user.Certification.ToString(), C_VitaUser.N_Certification);
            jb.StartArray(C_VitaUser.N_Roles);
            foreach (E_VitaUserRoles role in user.Roles)
                jb.AddArrayElement(role.ToString());
            jb.EndArray();
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
            List<C_VitaUser> res = null;
            AllUsersFetched = false;

            string usersUrl = "/users";

            try
            {
                C_IOResult ior = await Download(usersUrl, token);

                JsonValue jv = JsonValue.Parse(ior.ResponseString);

                res = new List<C_VitaUser>();
                foreach (JsonValue jv1 in jv)
                {
                    C_VitaUser vu = new C_VitaUser(jv1);
                    res.Add(vu);

                    UserCache.Add(vu);
                    CleanWorkItemsFromUser(vu);
                }

                AllUsersFetched = true;
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

        public C_VitaUser GetUserFromCacheNoFetch(int id)
        {
            var ou = UserCache.Where(u => u.id == id);
            return ou.FirstOrDefault();
        }

        private bool UserCacheContains(int userId)
        {
            var ou = UserCache.Where(u => u.id == userId);
            return ou.Any();
        }

        public async Task<C_VitaUser> GetUserFromCache(int userid)
        {
            C_VitaUser user = GetUserFromCacheNoFetch(userid);

            // if not found them pull from the API and store off the workintents
            if (user == null)
            {
                C_VitaUser loggedInUser = GetUserFromCacheNoFetch(LoggedInUserId);

                if (loggedInUser == null)
                    return null;

                user = await FetchUser(loggedInUser.Token, userid);

                if (user != null)
                {
                    UserCache.Add(user);
                    CleanWorkItemsFromUser(user);
                }
            }

            return user;
        }

        //public async Task<bool> EnsureUserInCache(int userid, string token)
        //{
        //    C_VitaUser res = GetUserFromCacheNoFetch(userid);

        //    if (res == null)
        //    {
        //        res = await FetchUser(token, userid);
        //        if (res != null)
        //        {
        //            UserCache.Add(res);
        //            CleanWorkItemsFromUser(res);
        //        }
        //    }

        //    return res != null;
        //}

        private void CleanWorkItemsFromUser(C_VitaUser user)
        {
            List<C_SignUp> intents = user.WorkIntentsX;
            user.WorkIntentsX = null;
            List<C_SignUp> history = user.WorkHistoryX;
            user.WorkHistoryX = null;

            foreach (C_SignUp wi in intents)
            {
                if (!SignUpsHasId(wi.id))
                    SignUpsList.Add(wi);
            }

            foreach (C_SignUp wi in history)
            {
                if (!SignUpsHasId(wi.id))
                    SignUpsList.Add(wi);
            }
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

        // ---------------- SiteSchedule mgmt -----------

        private List<C_SiteSchedule> ImportSitesSchedules(JsonValue json, C_YMD date)
        {
#if DEBUG
            if (!(json is JsonArray))
                throw new ApplicationException("the sites list must be an array");
#endif

            // create the holding place for the results
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();
            foreach (JsonValue j in json)
            {
                C_SiteSchedule vs = new C_SiteSchedule(j, date)
                {
                    SampleTime = DateTime.Now
                };
                res.Add(vs);
            }

            return res;
        }

        private async Task<List<C_SiteSchedule>> FetchSitesSchedules(C_YMD from, C_YMD to)
        {
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();
            C_YMD date = null;

            string sitesUrl = "/schedule/?start=" + from.ToString("yyyy-mm-dd") + ";end=" + to.ToString("yyyy-mm-dd");

            C_IOResult ior = await Download(sitesUrl, null);

            if (ior.Success)
            {
                JsonValue jdoc = JsonValue.Parse(ior.ResponseString);

                foreach (JsonValue jv in jdoc)
                {
                    if (jv.ContainsKey("date"))
                        date = Tools.JsonProcessDate(jv["date"], date);

                    if (jv.ContainsKey("sites"))
                    {
                        JsonValue jvx = jv["sites"];
                        List<C_SiteSchedule> resx = ImportSitesSchedules(jvx, date);
                        res.AddRange(resx);
                    }
                }
            }

            return res;
        }

        private async Task<List<C_SiteSchedule>> FetchSiteSchedules(C_YMD from, C_YMD to, string siteSlug)
        {
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();
            C_YMD date = null;

            string sitesUrl = "/schedule/?start=" + from.ToString("yyyy-mm-dd") + ";end=" + to.ToString("yyyy-mm-dd") + ";site=" + siteSlug;

            C_IOResult ior = await Download(sitesUrl, null);

            if (ior.Success)
            {
                JsonValue jdoc = JsonValue.Parse(ior.ResponseString);

                foreach (JsonValue jv in jdoc)
                {
                    if (jv.ContainsKey("date"))
                        date = Tools.JsonProcessDate(jv["date"], date);

                    if (jv.ContainsKey("sites"))
                    {
                        JsonValue jvx = jv["sites"];
                        List<C_SiteSchedule> resx = ImportSitesSchedules(jvx, date);
                        res.AddRange(resx);
                    }
                }
            }

            return res;
        }



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
                List<C_SiteSchedule> sslist = await FetchSitesSchedules(start, end);

                // split into the 2 different months since that is how we cache them
                List<C_SiteSchedule> month0 = new List<C_SiteSchedule>();
                List<C_SiteSchedule> month1 = new List<C_SiteSchedule>();
                foreach (C_SiteSchedule ss in sslist)
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

                res = await FetchSiteSchedules(start, end, siteSlug);
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

        public async Task<List<C_SignUp>> GetSignUpsForSiteInDateRangeCached(string token, int year, int month, string siteSlug)
        {
            int key = year * 12 + month;

            List<C_SignUp> res = new List<C_SignUp>();

            if (!SignUpsFetched.ContainsKey(key))
            {
                bool success = await FetchSignsUpsForDateRangeForSite(token, year, month, siteSlug);
            }

            var ou = SignUpsList.Where(su => (su.Date.Year == year) && (su.Date.Month == month) && (su.SiteSlug == siteSlug));
            res = ou.ToList();

            return res;
        }

        public async Task<bool> FetchSignsUpsForDateRangeForSite(string token, int year, int month, string siteSlug)
        {
            C_YMD firstDate = new C_YMD(year, month, 1);
            C_YMD lastDate = new C_YMD(year, month, DateTime.DaysInMonth(year, month));

            string submitUrl = "/signups/?start=" + firstDate.ToString("yyyymmdd") + ";end=" + lastDate.ToString("yyyymmdd") + ";site=" + siteSlug;

            C_IOResult ior = await Download(submitUrl, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    foreach (JsonValue jv in responseJson)
                    {
                        C_SignUp su = new C_SignUp(jv);

                        var ou = SignUpsList.Where(sux => sux.id == su.id);
                        if (!ou.Any())
                            SignUpsList.Add(su);
                    }

                    int key = year * 12 + month;
                    if (SignUpsFetched.ContainsKey(key))
                        SignUpsFetched.Add(key, true);
                    else
                        SignUpsFetched[key] = true;

                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.ParseError;
                ior.ErrorMessage = e.Message;
            }

            return ior.Success;
        }

        public async Task<List<C_SignUp>> FetchAllSignUps(string token)
        {
            string submitUrl = "/signups/";

            C_IOResult ior = await Download(submitUrl, token);

            List<C_SignUp> res = new List<C_SignUp>();

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    foreach (JsonValue jv in responseJson)
                    {
                        C_SignUp su = new C_SignUp(jv);

                        res.Add(su);

                        //var ou = SignUpsList.Where(sux => sux.id == su.id);
                        //if (!ou.Any())
                            //SignUpsList.Add(su);
                    }
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                ior.Success = false;
                ior.ResultCode = E_IOResultCode.ParseError;
                ior.ErrorMessage = e.Message;
            }

            return res;

        }

        public C_SignUp GetSignUpFromUserIdWithShiftId(int userid, int shiftid)
        {
            var ou = SignUpsList.Where(sux => (sux.UserId == userid) && (sux.ShiftId == shiftid));
            return ou.FirstOrDefault();
        }

//        public void UpdateSignUpsListEntry(C_SignUp su, bool approved, bool dirty)
//        {
//            var ou = SignUpsList.Where(sux => sux.id == su.id);
//            C_SignUp suk = ou.FirstOrDefault();
//            if (suk != null)
//            {
//                suk.Approved = approved;
//                suk.Dirty = dirty;
//            }
//            else
//            {
//#if DEBUG
//                Console.WriteLine("How did we get the signup?");
//#endif
        //    }
        //}

        public async Task<C_IOResult> FetchSignUpBySignUpId(string token, int signUpId)
        {
            var ou = SignUpsList.Where(sui => sui.id == signUpId);
            if (ou.Any())
            {
                C_IOResult ior1 = new C_IOResult()
                {
                    Success = true,
                    SignUp = ou.FirstOrDefault()
                };
                return ior1;
            }
            else
            {
#if DEBUG
                Console.WriteLine("Should already have this signup");
#endif
            }

            string submitUrl = "/signups/" + signUpId.ToString();

            C_IOResult ior = await Download(submitUrl, token);

            if (ior.Success)
            {
                JsonValue responseJson = JsonValue.Parse(ior.ResponseString);
                ior.SignUp = new C_SignUp(responseJson);
            }

            return ior;
        }

        public void AddToSignUps(C_SignUp su)
        {
            if (!SignUpsList.Contains(su))
                SignUpsList.Add(su);
        }

        public void RemoveFromSignUps(C_SignUp su)
        {
            if (SignUpsList.Contains(su))
                SignUpsList.Remove(su);
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
            var ou = SignUpsList.Where(wi => wi.id == id);

            return ou.Any();
        }

        public List<C_SignUp> GetSignUpsForUser(int userId)
        {
            var ou = SignUpsList.Where(wi => wi.UserId == userId);
            List<C_SignUp> res = ou.ToList();

            return res;
        }

        public List<C_SignUp> GetSignUpsForSiteOnDate(C_YMD onDate, string siteSlug)
        {
            var ou = SignUpsList.Where(wi => ((wi.Date == onDate) && (wi.SiteSlug == siteSlug)));
            return ou.ToList();
        }

        public void ClearDirtyFlagOnSignUps()
        {
            foreach (C_SignUp wi in SignUpsList)
                wi.Dirty = false;
        }

        public List<C_SignUp> GetSignUpsByShiftId(int shiftId)
        {
            var ou = SignUpsList.Where(wi => wi.ShiftId == shiftId);
            return ou.ToList();
        }

        //public int GetCountOfSignUpsByShiftId(int shiftId)
        //{
        //    var ou = SignUps.Where(wi => wi.ShiftId == shiftId);
        //    return ou.Count();
        //}

        // ------------- workshifts mgmt ----------------

        /// <summary>
        /// Create a new work shift
        /// </summary>
        /// <returns>true if successful</returns>
        /// <param name="token">Token.</param>
        /// <param name="shift">shift to create</param>
        /// <param name="calEntry">Calendar Entry to add the shift to</param>
        public async Task<C_IOResult> CreateShift(string token, string siteSlug, C_WorkShift shift, C_CalendarEntry calEntry)
        {
            string bodyjson = shift.ToJson();

            string updateurl = "/sites/" + siteSlug + "/calendars/" + calEntry.id.ToString() + "/shifts/";

            C_IOResult ior = await Upload("POST", updateurl, bodyjson, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    C_WorkShift cex = new C_WorkShift(responseJson);
                    shift.id = cex.id;
                    if (cex.SiteSlug != null)
                        shift.SiteSlug = cex.SiteSlug;

                    // add it to the current Site instance
                    calEntry.WorkShifts.Add(shift);
                    WorkShifts.Add(shift);
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
        /// Update a shift
        /// </summary>
        /// <returns>true if successful</returns>
        /// <param name="token">Token.</param>
        /// <param name="shift">shift to update</param>
        public async Task<C_IOResult> UpdateShift(string token, string siteSlug, C_WorkShift shift, C_CalendarEntry calEntry)
        {
            string bodyjson = shift.ToJson();

            string updateurl = "/sites/" + siteSlug + "/calendars/" + calEntry.id.ToString() + "/shifts/" + shift.id.ToString();

            C_IOResult ior = await Upload("PUT", updateurl, bodyjson, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

                    C_WorkShift cex = new C_WorkShift(responseJson);
                    shift.id = cex.id;
                    //shift.SiteSlug = cex.SiteSlug;
                    shift.Dirty = false;
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
        /// Remove a shift
        /// </summary>
        /// <returns>true if successful</returns>
        /// <param name="token">Token.</param>
        /// <param name="shift">shift to remove</param>
        /// <param name="calEntry">Calendar Entry to remove the shift from</param>
        public async Task<C_IOResult> RemoveShift(string token, string siteSlug, C_WorkShift shift, C_CalendarEntry calEntry)
        {
            string bodyjson = shift.ToJson();

            string updateurl = "/sites/" + siteSlug + "/calendars/" + calEntry.id.ToString() + "/shifts/" + shift.id.ToString();

            C_IOResult ior = await Upload("DELETE", updateurl, bodyjson, token);

            try
            {
                if (ior.Success)
                {
                    calEntry.WorkShifts.Remove(shift);
                    WorkShifts.Remove(shift);
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

        public async Task<bool> EnsureShiftsInCacheForSignUps(string token, List<C_SignUp> signups)
        {
            foreach (C_SignUp su in signups)
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

            C_IOResult ior = await Download(updateurl, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

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

            return shifts;
        }

        //public async Task<C_IOResult> FetchWorkShiftById(int shiftId, string token, string siteSlug, C_CalendarEntry ce)
        //{
        //    string shiftUrl = "/sites/" + siteSlug + "/calendars/" + ce.id.ToString() + "/shifts/" + shiftId.ToString();

        //    C_IOResult ior = await Download(shiftUrl, token);

        //    if (ior.Success)
        //    {
        //        JsonValue responseJson = JsonValue.Parse(ior.ResponseString);

        //        ior.WorkShift = new C_WorkShift(responseJson);

        //        if (!WorkShifts.Contains(ior.WorkShift))
        //            WorkShifts.Add(ior.WorkShift);
        //    }

        //    return ior;
        //}

        public C_WorkShift GetWorkShiftById(int id)
        {
            var ou = WorkShifts.Where(ws => ws.id == id);
            return ou.FirstOrDefault();
        }

        // ==================== suggestion mgmt ==================

        public async Task<List<C_Suggestion>> FetchAllSuggestions(string token)
        {
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

        public async Task<C_IOResult> AddSuggestion(C_Suggestion sug, string token)
        {
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
            string submiturl = "/suggestions/" + sug.id.ToString();

            C_IOResult ior = await Upload("DELETE", submiturl, "", token);

            return ior;
        }

        // ================= signups =============

        /// <summary>
        /// Adds an intent for the specified user
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> AddSignUp(C_SignUp signup, string token, int userId)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(signup.SiteSlug, C_SignUp.N_SiteSlug);
            jb.Add(signup.Date, C_SignUp.N_Date);
            jb.Add(userId, C_SignUp.N_UserId);
            jb.Add(signup.ShiftId, C_SignUp.N_ShiftId);
            string bodyjson = jb.ToString();

            string submiturl = "/signups/";

            C_IOResult ior = await Upload("POST", submiturl, bodyjson, token);

            try
            {
                if (ior.Success)
                {
                    JsonValue responseJson = JsonValue.Parse(ior.ResponseString);
                    C_SignUp wix = new C_SignUp(responseJson);
                    signup.id = wix.id;
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
        /// Updates an existing intent
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> UpdateSignUp(C_SignUp signup, string token)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(signup.Approved, C_SignUp.N_Approved);
            jb.Add(signup.Hours, C_SignUp.N_Hours);
            jb.Add(signup.UserId, C_SignUp.N_UserId);
            string bodyjson = jb.ToString();

            string submiturl = "/signups/" + signup.id.ToString();

            C_IOResult ior = await Upload("PUT", submiturl, bodyjson, token);

            return ior;
        }

        /// <summary>
        /// Removes the intent from the DB
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
        public async Task<C_IOResult> RemoveIntent(C_SignUp signup, string token)
        {
            string submiturl = "/signups/" + signup.id.ToString();

            C_IOResult ior = await Upload("DELETE", submiturl, "", token);

            return ior;
        }

        // ================= registration ================

        public async Task<C_IOResult> SubmitRegistration(string username, string email, string password, string phone, E_Certification cert)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(username, C_Registration.N_Name);
            jb.Add(email, C_Registration.N_Email);
            jb.Add(password, C_Registration.N_Password);
            jb.Add(password, C_Registration.N_PasswordConfirmation);
            jb.Add(phone, C_Registration.N_Phone);
            jb.Add(cert.ToString(), C_Registration.N_Certification);
            string bodyjson = jb.ToString();

            string submiturl = "/users/";

            C_IOResult ior = await Upload("POST", submiturl, bodyjson, null);

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

        public async Task<C_IOResult> DeleteNotification(C_Notification notification, string token)
        {
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
            string url = "/notification_requests/" + notification.id.ToString() + "/resend/";
            if (notification.SentDT == DateTime.MinValue)
                url = "/notification_requests/" + notification.id.ToString() + "/send/";

            C_IOResult ior = await Upload("POST", url, "", token);

            return ior;
        }

        // ========================== messages ====================

        public async Task<C_IOResult> GetMessage(E_Language language, string slug)
        {
            string acceptLanguage = language == E_Language.Spanish ? "es" : "en";

            string submiturl = "/resources/" + slug + "/";

            C_IOResult ior = await Download(submiturl, null, acceptLanguage);

            if (ior.Success)
            {
                JsonValue responseJson = JsonValue.Parse(ior.ResponseString);
                ior.Message = new C_Message(responseJson);
            }

            return ior;
        }

        public async Task<C_IOResult> AddMessage(string token, C_Message english, C_Message spanish)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(english.Slug, "slug");
            jb.Add(EscapeText(english.Text), "text_en");
            jb.Add(EscapeText(spanish.Text), "text_es");
            string bodyjson = jb.ToString();

            C_IOResult ior = await Upload("POST", "/resources", bodyjson, token);

            return ior;
        }

        private static string EscapeText(string s)
        {
            return s.Replace("\n", "\\n");
        }

        public async Task<C_IOResult> UpdateMessage(C_Message message, string token)
        {
            string submiturl = "/resources/" + message.Slug + "/";

            string messageLanguage = message.Language == E_Language.Spanish ? "text_es" : "text_en";

            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(message.Text, messageLanguage);
            string bodyjson = jb.ToString();

            C_IOResult ior = await Upload("PUT", submiturl, bodyjson, token);

            return ior;
        }

        public async Task<C_IOResult> RemoveMessage(C_Message message, string token)
        {
            string submiturl = "/resources/" + message.Slug + "/";

            C_IOResult ior = await Upload("DELETE", submiturl, "", token);

            return ior;
        }

        // =================== core upload/download =================

        //public static string VitaCoreUrl = "https://vitasa.abandonedfactory.net";

        public C_Config Config;

        public const string N_ConfigURL = "http://s3-us-west-2.amazonaws.com/vita-static-content-prod/";
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
