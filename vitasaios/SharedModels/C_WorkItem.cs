using System;
using System.Json;
using System.Collections.Generic;

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

        public static readonly string N_ID = "id";
        public static readonly string N_SiteSlug = "siteslug";
        public static readonly string N_Date = "date";
        public static readonly string N_UserId = "userid";
        public static readonly string N_Hours = "hours";
        public static readonly string N_Approved = "approved";

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
                id = jv[N_ID];

            if (jv.ContainsKey(N_SiteSlug))
                SiteSlug = jv[N_SiteSlug];

            if (jv.ContainsKey(N_Date))
                Date = new C_YMD((string)jv[N_Date]);

            if (jv.ContainsKey(N_UserId))
                UserId = jv[N_UserId];

            if (jv.ContainsKey(N_Hours))
                Hours = jv[N_Hours];

			if (jv.ContainsKey(N_Approved))
                Approved = (string)jv[N_Approved] == "true";
		}
    }
}
