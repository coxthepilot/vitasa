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
    public class C_SiteSchedule
    {
        public C_YMD Date;
        public string SiteSlug;
        public int EFilersNeeded;
        public int EFilersSignedUp;
        public bool IsClosed;
        public C_HMS OpenTime;
        public C_HMS CloseTime;
        public bool LoogedInUserSignedUp;

        public static readonly string N_Date = "date";
        public static readonly string N_SiteSlug = "slug";
        public static readonly string N_EFilersNeeded = "efilers_needed";
        public static readonly string N_EFilersSignedUp = "efilers_signed_up";
        public static readonly string N_IsClosed = "is_closed";
        public static readonly string N_OpenTime = "open";
        public static readonly string N_CloseTime = "close";
        public static readonly string N_LoogedInUserSignedUp = "this_user_signup";

        public C_SiteSchedule(JsonValue j, C_YMD date)
        {
			if (!(j is JsonObject))
				throw new ApplicationException("we can only work with an object");

            Date = date;

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

            if (j.ContainsKey(N_LoogedInUserSignedUp))
                LoogedInUserSignedUp = Tools.JsonProcessBool(j[N_LoogedInUserSignedUp], LoogedInUserSignedUp);
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
				res.Add(vs);
			}

			return res;
		}

		public static async Task<List<C_SiteSchedule>> FetchSitesSchedules(C_YMD from, C_YMD to)
        {
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();

			try
			{
				string sitesUrl = "/schedule?start=" + from.ToString("yyyy-mm-dd") + ";end=" + to.ToString("yyyy-mm-dd");
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				C_YMD date = null;
				string ds = await wc.DownloadStringTaskAsync(sitesUrl);

				JsonValue jdoc = JsonValue.Parse(ds);

                // scan through the dates
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
			catch (Exception e2)
			{
				Console.WriteLine(e2.Message);
				res = null;
			}

			return res;
        }

        public static List<C_SiteSchedule> GetSiteScheduleForSiteOnDate(string siteSlug, C_YMD onDate, List<C_SiteSchedule> sitesSchedules)
        {
            List<C_SiteSchedule> res = new List<C_SiteSchedule>();

			var ou = sitesSchedules.Where(ss => ((siteSlug == null) || (siteSlug == ss.SiteSlug))
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
