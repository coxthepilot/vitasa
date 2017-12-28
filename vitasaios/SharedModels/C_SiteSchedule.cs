using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

namespace zsquared
{
    /// <summary>
    /// This is the data structure for the specialty API call to get a summary of signups.
    /// </summary>
    public class C_SiteSchedule
    {
        public C_YMD Date;
        public bool SiteIsOpen;
        public string SiteSlug;
        public List<C_SiteScheduleShift> Shifts;

        public const string N_IsClosed = "is_closed";
        public const string N_Shifts = "shifts";
        public const string N_Slug = "slug";

        public bool LoggedInUserSignedUp;
        public DateTime SampleTime;

        public C_SiteSchedule(JsonValue j, C_YMD date)
        {
            Date = date;

            if (j.ContainsKey(N_IsClosed))
                SiteIsOpen = !Tools.JsonProcessBool(j[N_IsClosed], !SiteIsOpen);

            if (j.ContainsKey(N_Slug))
                SiteSlug = Tools.JsonProcessString(j[N_Slug], SiteSlug);

            if (j.ContainsKey(N_Shifts))
            {
                Shifts = new List<C_SiteScheduleShift>();
                JsonValue jj = j[N_Shifts];
                foreach(JsonValue jv in jj)
                {
                    C_SiteScheduleShift sss = new C_SiteScheduleShift(jv);
                    Shifts.Add(sss);
                }
            }
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

            foreach (C_SiteSchedule ss in sitesSchedule)
            {
                if (ss.SiteIsOpen)
                {
                    res = false;
                    break;
                }
            }


            return res;
        }
    }

    public class C_SiteScheduleShift
    {
        public C_HMS OpenTime;
        public C_HMS CloseTime;
        public int eFilersNeededAdvanced;
        public int eFilersNeededBasic;
        public int eFilersSignedUpAdvanced;
        public int eFilersSignedUpBasic;

        public const string N_OpenTime = "open";
        public const string N_CloseTime = "close";
        public const string N_eFilersNeededAdvanced = "efilers_needed_advanced";
		public const string N_eFilersNeededBasic = "efilers_needed_basic";
		public const string N_eFilersSignedUpAdvanced = "efilers_signed_up_advanced";
		public const string N_eFilersSignedUpBasic = "efilers_signed_up_basic";

		public C_SiteScheduleShift(JsonValue j)
		{
			if (j.ContainsKey(N_OpenTime))
                OpenTime = Tools.JsonProcessTime(j[N_OpenTime], OpenTime);

			if (j.ContainsKey(N_CloseTime))
				CloseTime = Tools.JsonProcessTime(j[N_CloseTime], CloseTime);

            if (j.ContainsKey(N_eFilersNeededAdvanced))
                eFilersNeededAdvanced = Tools.JsonProcessInt(j[N_eFilersNeededAdvanced], eFilersNeededAdvanced);

			if (j.ContainsKey(N_eFilersNeededBasic))
				eFilersNeededBasic = Tools.JsonProcessInt(j[N_eFilersNeededBasic], eFilersNeededBasic);

			if (j.ContainsKey(N_eFilersSignedUpAdvanced))
				eFilersSignedUpAdvanced = Tools.JsonProcessInt(j[N_eFilersSignedUpAdvanced], eFilersSignedUpAdvanced);

			if (j.ContainsKey(N_eFilersSignedUpBasic))
				eFilersSignedUpBasic = Tools.JsonProcessInt(j[N_eFilersSignedUpBasic], eFilersSignedUpBasic);
		}
	}
}
