using System;
using System.Json;

namespace zsquared
{
    public class C_WorkLogItem
    {
        public int id;
        public C_YMD Date;
        public int SiteId;
        public int UserId;
        public float Hours;
        public bool Approved;

        public const string N_Id = "id";
        public const string N_Date = "date";
        public const string N_SiteId = "siteid";
        public const string N_UserId = "userid";
        public const string N_Hours = "hours";
        public const string N_Approved = "approved";

        public C_WorkLogItem()
        {
            id = -1;
            Date = C_YMD.Now;
            SiteId = -1;
            Hours = 0.0f;
            UserId = -1;
            Approved = false;
        }

        public C_WorkLogItem(JsonValue jv)
        {
            if (!(jv is JsonArray))
                throw new ApplicationException("!");

            id = -1;
            Date = new C_YMD(0, 0, 0);
            SiteId = -1;
            Hours = 0.0f;

            if (jv.ContainsKey(N_Id))
                id = Tools.JsonProcessInt(jv[N_Id], id);

            if (jv.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(jv[N_Date], Date);

            if (jv.ContainsKey(N_SiteId))
                SiteId = Tools.JsonProcessInt(jv[N_SiteId], -1);

            if (jv.ContainsKey(N_UserId))
                UserId = Tools.JsonProcessInt(jv[N_UserId], -1);

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
            jb.Add(SiteId, N_SiteId);
            jb.Add(UserId, N_UserId);
            jb.Add(Hours, N_Hours);
            jb.Add(Approved.ToString(), N_Approved);

            string res = jb.ToString();
            return res;
        }
    }
}
