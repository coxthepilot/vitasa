using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace zsquared
{
    public class C_SiteSchedule
    {
        public C_YMD Date;
        public string SiteSlug;
        public int EFilersNeeded;
        public int EFilersSignedUp;
        public bool IsClosed;
        public C_HMS OpenTime;
        public C_HMS CloseTime;
        public bool LoggedInUserSignedUp;
        public DateTime SampleTime;

        public static readonly string N_Date = "date";
        public static readonly string N_SiteSlug = "slug";
        public static readonly string N_EFilersNeeded = "efilers_needed";
        public static readonly string N_EFilersSignedUp = "efilers_signed_up";
        public static readonly string N_IsClosed = "is_closed";
        public static readonly string N_OpenTime = "open";
        public static readonly string N_CloseTime = "close";
        public static readonly string N_LoggedInUserSignedUp = "this_user_signup";
        public static readonly string N_SampleTime = "sampletime";

        public C_SiteSchedule(JsonValue j, C_YMD date)
        {
            if (!(j is JsonObject))
                throw new ApplicationException("we can only work with an object");

            if (date != null)
                Date = date;
            else if (j.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(j[N_Date], Date);

            if (j.ContainsKey(N_SiteSlug))
                SiteSlug = Tools.JsonProcessString(j[N_SiteSlug], SiteSlug);

            if (j.ContainsKey(N_EFilersNeeded))
                EFilersNeeded = Tools.JsonProcessInt(j[N_EFilersNeeded], EFilersNeeded);

            if (j.ContainsKey(N_EFilersSignedUp))
                EFilersSignedUp = Tools.JsonProcessInt(j[N_EFilersSignedUp], EFilersSignedUp);

            if (j.ContainsKey(N_IsClosed))
                IsClosed = Tools.JsonProcessBool(j[N_IsClosed], IsClosed);

            if (j.ContainsKey(N_OpenTime))
                OpenTime = Tools.JsonProcessTime(j[N_OpenTime], OpenTime);

            if (j.ContainsKey(N_CloseTime))
                CloseTime = Tools.JsonProcessTime(j[N_CloseTime], CloseTime);

            if (j.ContainsKey(N_LoggedInUserSignedUp))
                LoggedInUserSignedUp = Tools.JsonProcessBool(j[N_LoggedInUserSignedUp], LoggedInUserSignedUp);

            if (j.ContainsKey(N_SampleTime))
                SampleTime = DateTime.Parse(Tools.JsonProcessString(j[N_SampleTime], null), null, System.Globalization.DateTimeStyles.RoundtripKind);
        }

        public override bool Equals(System.Object obj)
        {
            if (obj == null)
                return false;

            C_SiteSchedule g = obj as C_SiteSchedule;
            if ((System.Object)g == null)
                return false;

            bool res = true;

            res &= Date == g.Date;
            res &= SiteSlug == g.SiteSlug;
            res &= EFilersNeeded == g.EFilersNeeded;
            res &= EFilersSignedUp == g.EFilersSignedUp;
            res &= IsClosed == g.IsClosed;
            res &= OpenTime == g.OpenTime;
            res &= CloseTime == g.CloseTime;
            res &= LoggedInUserSignedUp == g.LoggedInUserSignedUp;
            res &= SampleTime == g.SampleTime;

            return res;
        }

        public static bool operator ==(C_SiteSchedule a, C_SiteSchedule b)
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

        public static bool operator !=(C_SiteSchedule a, C_SiteSchedule b)
        {
            return !(a == b);
        }

        public override int GetHashCode()
        {
            int hash = 269;
            hash = (hash * 47) * Date.GetHashCode();
            hash = (hash * 47) * SiteSlug.GetHashCode();
            hash = (hash * 47) * EFilersNeeded.GetHashCode();
            hash = (hash * 47) * EFilersSignedUp.GetHashCode();
            hash = (hash * 47) * IsClosed.GetHashCode();
            hash = (hash * 47) * OpenTime.GetHashCode();
            hash = (hash * 47) * CloseTime.GetHashCode();
            hash = (hash * 47) * LoggedInUserSignedUp.GetHashCode();

            return hash;
        }

        private static List<C_SiteSchedule> ImportSitesSchedules(JsonValue json, C_YMD date)
        {
            if (!(json is JsonArray))
                throw new ApplicationException("the sites list must be an array");

            // create the holding place for the results
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();
            foreach (JsonValue j in json)
            {
                C_SiteSchedule vs = new C_SiteSchedule(j, date);
                vs.SampleTime = DateTime.Now;
                res.Add(vs);
            }

            return res;
        }

        public static async Task<List<C_SiteSchedule>> FetchSitesSchedulesX(C_YMD from, C_YMD to)
        {
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();

            int retryCount = 0;
            bool retry = false;
            do
            {
                try
                {
                    retry = false;

                    bool success = await FetchSitesScheduleX_func(from, to, res);
                }
                catch (WebException we)
                {
                    if (we.Status == WebExceptionStatus.ReceiveFailure)
                    {
                        res = new List<C_SiteSchedule>();
                        if (retryCount < 3)
                        {
                            retry = true;
                            retryCount++;
                        }
                    }
                }
                catch (Exception e2)
                {
#if DEBUG
                    Console.WriteLine(e2.Message);
#endif
                    res = new List<C_SiteSchedule>();
                }
            }
            while (retry);

			return res;
        }

        public static async Task<bool> FetchSitesScheduleX_func(C_YMD from, C_YMD to, List<C_SiteSchedule> res)
        {
			string sitesUrl = "/schedule/?start=" + from.ToString("yyyy-mm-dd") + ";end=" + to.ToString("yyyy-mm-dd");
			WebClient wc = new WebClient()
			{
				BaseAddress = C_Vita.VitaCoreUrl
			};
			wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
			wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

			C_YMD date = null;
			string ds = await wc.DownloadStringTaskAsync(sitesUrl);

			JsonValue jdoc = JsonValue.Parse(ds);

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

            return true;
		}

        public static List<C_SiteSchedule> GetSiteScheduleForSiteOnDate(string siteSlug, C_YMD onDate, List<C_SiteSchedule> sitesSchedules)
        {
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();

			var ou = sitesSchedules.Where(ss => (
                (siteSlug == null) || (siteSlug == ss.SiteSlug))
			 && ((onDate == null) || (onDate == ss.Date)));

            res = ou.ToList();

            return res;
        }

        public static bool AllSitesClosed(List<C_SiteSchedule> sitesSchedule)
        {
            bool res = true;

            foreach(C_SiteSchedule ss in sitesSchedule)
            {
                if (!ss.IsClosed)
                {
                    res = false;
                    break;
                }
            }


            return res;
        }
    }
}
