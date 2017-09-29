using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;

//using UIKit;
using System.Linq;
//using Foundation;

namespace zsquared
{
    public class C_WorkItem
    {
        public int id;
        public string SiteSlug;
        public C_YMD Date;
        public int UserId;
        public float Hours;
        public bool Approved;
        public string SiteName;

        public bool Dirty;      // not saved or restored; used in SCVol and SCVolHours

        public static readonly string N_ID = "id";
        public static readonly string N_SiteSlug = "site";
        public static readonly string N_Date = "date";
        public static readonly string N_UserId = "user";
        public static readonly string N_Hours = "hours";
        public static readonly string N_Approved = "approved";
        public static readonly string N_Dirty = "dirty";
        public static readonly string N_SiteName = "site_name";

        public C_WorkItem(string siteSlug, C_YMD date, int userid, float hours)
        {
            SiteSlug = siteSlug;
            Date = date;
            UserId = userid;
            Hours = hours;
        }

        public C_WorkItem(JsonValue jv)
        {
            if (!(jv is JsonObject))
                throw new ApplicationException("expecting JsonObject");

            if (jv.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(jv[N_ID], id);

            if (jv.ContainsKey(N_SiteSlug))
                SiteSlug = Tools.JsonProcessString(jv[N_SiteSlug], SiteSlug);

            if (jv.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(jv[N_Date], Date);

            if (jv.ContainsKey(N_UserId))
                UserId = Tools.JsonProcessInt(jv[N_UserId], UserId);

            if (jv.ContainsKey(N_Hours))
                Hours = Tools.JsonProcessFloat(jv[N_Hours], Hours);

            if (jv.ContainsKey(N_Approved))
                Approved = Tools.JsonProcessBool(jv[N_Approved], Approved);

            if (jv.ContainsKey(N_SiteName))
                SiteName = Tools.JsonProcessString(jv[N_SiteName], SiteName);

            if (jv.ContainsKey(N_Dirty))
                Dirty = Tools.JsonProcessBool(jv[N_Dirty], Dirty);
        }

        public async Task<bool> AddIntent(C_Global Global, int userId)
        {
            C_VitaUser LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            bool res = await AddIntent(LoggedInUser.Token, userId);

            if (res)
                Global.WorkItems.Add(this);

            return res;
        }

        /// <summary>
        /// Get the signups for a given user. Returns either a list or null; No throws.
        /// </summary>
        /// <returns>The work items for user.</returns>
        /// <param name="token">Token.</param>
        /// <param name="userid">Userid.</param>
		public static async Task<List<C_WorkItem>> GetWorkItemsForUser(string token, int userid)
        {
            List<C_WorkItem> res = null;
            try
            {
                string submiturl = "/signups/?user_id=" + userid.ToString();

                WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrl
                };
                wc.Headers.Add(HttpRequestHeader.Cookie, token);
                wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.DownloadStringTaskAsync(submiturl);

                JsonValue responseJson = JsonValue.Parse(responseString);

                res = new List<C_WorkItem>();
                foreach (JsonValue jv in responseJson)
                {
                    C_WorkItem wi = new C_WorkItem(jv);
                    res.Add(wi);
                }
            }
            catch (Exception ex)
            {
#if DEBUG
                Console.WriteLine(ex.Message);
#endif
                res = null;
            }

            return res;
        }

        /// <summary>
        /// Adds an intent for the specified user
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
        public async Task<bool> AddIntent(string token, int userId)
        {
            string bodyjson = "{ "
                + "\"site\" : \"" + SiteSlug + "\""
                + ",\"date\" : \"" + Date.ToString("yyyy-mm-dd") + "\""
                + ",\"user_id\" : \"" + userId + "\""
                + "}";

            bool success = false;
            try
            {
                string submiturl = "/signups/";
                WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrl
                };
                wc.Headers.Add(HttpRequestHeader.Cookie, token);
                wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(submiturl, "POST", bodyjson);

                JsonValue responseJson = JsonValue.Parse(responseString);
                C_WorkItem wix = new C_WorkItem(responseJson);
                id = wix.id;

                success = true;
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                success = false;
            }

            return success;
        }

        public async Task<bool> UpdateIntent(C_Global Global)
        {
            C_VitaUser LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            bool res = await UpdateIntent(LoggedInUser.Token);

            // no need to change the intent since it came from the WorkItems list to start with
            // if it didn't, then should be an add

            return res;
        }

        /// <summary>
        /// Updates an existing intent
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
		public async Task<bool> UpdateIntent(string token)
        {
            bool success = false;
            try
            {
                string bodyjson = "{ "
                    + "\"approved\" : \"" + (Approved ? "true" : "false") + "\""
                    + ",\"hours\" : \"" + Hours.ToString() + "\""
                    + ",\"user_id\" : \"" + UserId + "\""
                    + "}";

                string submiturl = "/signups/" + id.ToString();
                WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrl
                };
                wc.Headers.Add(HttpRequestHeader.Cookie, token);
                wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(submiturl, "PUT", bodyjson);

#if DEBUG
                JsonValue responseJson = JsonValue.Parse(responseString);
                C_WorkItem wix = new C_WorkItem(responseJson);
                if (!(this.Equals(wix)))
                    throw new ApplicationException("update mismatch");
#endif

                success = true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                success = false;
            }

            return success;
        }

        /// <summary>
        /// Removes an intent from the DB and our onboard cache
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="global">Global.</param>
        public async Task<bool> RemoveIntent(C_Global global)
        {
            C_VitaUser LoggedInUser = global.GetUserFromCacheNoFetch(global.LoggedInUserId);
            bool res = await RemoveIntent(LoggedInUser.Token);

            if (res && global.WorkItems.Contains(this))
                global.WorkItems.Remove(this);

            return res;
        }

        /// <summary>
        /// Removes the intent from the DB
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
		public async Task<bool> RemoveIntent(string token)
        {
#if DEBUG
            if (id == -1)
                throw new ApplicationException("must be an existing id; can't delete one that hasn't been added");
#endif

            int retryCount = 0;
            bool success = false;
            bool retry = false;
            do
            {
                try
                {
                    retry = false;
                    string submiturl = "/signups/" + id.ToString();
                    WebClient wc = new WebClient()
                    {
                        BaseAddress = C_Vita.VitaCoreUrl
                    };
                    wc.Headers.Add(HttpRequestHeader.Cookie, token);
                    wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                    wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                    string responseString = await wc.UploadStringTaskAsync(submiturl, "DELETE", "");

                    success = true;
                }
                catch (WebException we)
                {
                    success = false;
                    if (we.Status == WebExceptionStatus.ReceiveFailure)
                    {
                        if (retryCount < 3)
                        {
                            retry = true;
                            retryCount++;
                        }
                        else
                            Console.WriteLine("exceeded retry");
                    }
                }
                catch (Exception e)
                {
#if DEBUG
                    Console.WriteLine(e.Message);
#endif
                    success = false;
                }
            }
            while (!success && retry);

			return success;
		}

        /// <summary>
        /// Returns a subset of the workItems list based on items for the date. List
        /// may be empty; will never return null. No throws.
        /// </summary>
        /// <returns>The work items for date.</returns>
        /// <param name="onDate">On date.</param>
        /// <param name="workItems">Work items.</param>
        public static List<C_WorkItem> GetWorkItemsForDate(C_YMD onDate, List<C_WorkItem> workItems)
        {
            List<C_WorkItem> res = new List<C_WorkItem>();
            try
            {
                var ou = workItems.Where(wi => wi.Date == onDate);

                if (ou.Any())
                    res = ou.ToList();

                // don't know why ToList would ever return null, but just in case
                if (res == null)
                    res = new List<C_WorkItem>();
            }
            catch 
            {
                res = new List<C_WorkItem>();
            }

            return res;
        }

		public override bool Equals(System.Object obj)
        {
            const float EPSILON = 0.001f;

			if (obj == null)
				return false;

            C_WorkItem g = obj as C_WorkItem;
			if ((System.Object)g == null)
				return false;

			bool res = true;

			res &= id == g.id;
            if (SiteSlug != null)
				res &= SiteSlug == g.SiteSlug;
            if (Date != null)
				res &= Date == g.Date;
            res &= UserId == g.UserId;
            res &= Math.Abs(Hours - g.Hours) < EPSILON;
            res &= Approved == g.Approved;
            res &= SiteName == g.SiteName;
			res &= Dirty == g.Dirty;

			return res;
		}

		public static bool operator ==(C_WorkItem a, C_WorkItem b)
		{
			// If both are null, or both are same instance, return true.
			if (System.Object.ReferenceEquals(a, b))
			{
				return true;
			}

			// If one is null, but not both, return false.
			if (((object)a == null) || ((object)b == null))
			{
				return false;
			}

			// Return true if the fields match:
			return a.Equals(b);
		}

		public static bool operator !=(C_WorkItem a, C_WorkItem b)
		{
			return !(a == b);
		}

		public override int GetHashCode()
		{
			int hash = 269;
			hash = (hash * 47) * id.GetHashCode();
            hash = (hash * 47) * SiteSlug.GetHashCode();
            hash = (hash * 47) * Date.GetHashCode();
            hash = (hash * 47) * UserId.GetHashCode();
            hash = (hash * 47) * Hours.GetHashCode();
            hash = (hash * 47) * Approved.GetHashCode();
            hash = (hash * 47) * Dirty.GetHashCode();
            hash = (hash * 47) * SiteName.GetHashCode();

			return hash;
		}

        public static int CompareByDateAscending(C_WorkItem wi1, C_WorkItem wi2)
        {
            return wi1.Date.CompareTo(wi2.Date);
        }
    }
}
