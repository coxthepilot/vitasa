using System;
using System.Json;

namespace zsquared
{
    public class C_WorkLogItem
    {
        public int id;
        public C_YMD Date;
        public string SiteSlug;
        public readonly int UserId;
        public float Hours;
        public bool Approved;

        public const string N_Id = "id";
        public const string N_Date = "date";
        public const string N_SiteSlug = "site";
        public const string N_UserId = "user_id";
        public const string N_Hours = "hours";
        public const string N_Approved = "approved";

        public C_WorkLogItem(int userid)
        {
            id = -1;
            Date = C_YMD.Now;
            SiteSlug = null;
            Hours = 0.0f;
            UserId = userid;
            Approved = false;
        }

        public C_WorkLogItem(JsonValue jv, int userid)
        {
            if (!(jv is JsonValue))
                throw new ApplicationException("!");

            id = -1;
            Date = new C_YMD(0, 0, 0);
            SiteSlug = null;
            Hours = 0.0f;

            if (jv.ContainsKey(N_Id))
                id = Tools.JsonProcessInt(jv[N_Id], id);

            if (jv.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(jv[N_Date], Date);

            if (jv.ContainsKey(N_SiteSlug))
                SiteSlug = Tools.JsonProcessString(jv[N_SiteSlug], null);

            if (jv.ContainsKey(N_Hours))
                Hours = Tools.JsonProcessFloat(jv[N_Hours], 0.0f);

            if (jv.ContainsKey(N_Approved))
                Approved = Tools.JsonProcessBool(jv[N_Approved], false);
        }

        public string ToJson()
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(id, N_Id);
            jb.Add(Date, N_Date);
            jb.Add(SiteSlug, N_SiteSlug);
            //jb.Add(UserId, N_UserId);
            jb.Add(Hours, N_Hours);
            jb.Add(Approved, N_Approved);

            string res = jb.ToString();
            return res;
        }

        public static int CompareByDate(C_WorkLogItem wi1, C_WorkLogItem wi2)
        {
            return wi1.Date.CompareTo(wi2.Date);
        }

        public static int CompareByDateReverse(C_WorkLogItem wi1, C_WorkLogItem wi2)
        {
            return wi2.Date.CompareTo(wi1.Date);
        }
    }
}
