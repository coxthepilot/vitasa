using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

namespace zsquared
{
    public class C_SignUp
    {
        public int id;              // db record id

		public int UserId;          // id of the user

		public string SiteSlug;     // associated site
		public string SiteName;     // convenience, the actual site name

		public C_YMD Date;          // date of the signup

        public int ShiftId;         // id of the shift that the user signed up for

		public float Hours;         // hours worked
        public bool Approved;       // true if the hours have been approved by the site coordinator

        public bool Dirty;          // not saved or restored; used in SCVol and SCVolHours

        public static readonly string N_ID = "id";
		public static readonly string N_UserId = "user";
		public static readonly string N_SiteSlug = "site";
		public static readonly string N_SiteName = "site_name";
		public static readonly string N_Date = "date";
        public static readonly string N_ShiftId = "shift_id";
        public static readonly string N_Hours = "hours";
        public static readonly string N_Approved = "approved";

        public C_SignUp(string siteSlug, C_YMD date, int userid, float hours)
        {
            SiteSlug = siteSlug;
            Date = date;
            UserId = userid;
            Hours = hours;
        }

        public C_SignUp(JsonValue jv)
        {
            if (!(jv is JsonObject))
                return;

            if (jv.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(jv[N_ID], id);

			if (jv.ContainsKey(N_ShiftId))
				ShiftId = Tools.JsonProcessInt(jv[N_ShiftId], ShiftId);

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
        }

		/// <summary>
		/// Adds an intent for the specified user
		/// </summary>
		/// <returns>The intent.</returns>
		/// <param name="token">Token.</param>
		public async Task<bool> AddSignUp(string token, int userId)
        {
			C_JsonBuilder jb = new C_JsonBuilder();
			jb.Add(SiteSlug, N_SiteSlug);
			jb.Add(Date, N_Date);
			jb.Add(userId, N_UserId);
			jb.Add(ShiftId, N_ShiftId);
			string bodyjson = jb.ToString();

			string submiturl = "/signups/";

            string responseString = await Tools.Upload("POST", submiturl, bodyjson, token);

            if (responseString != null)
            {
				JsonValue responseJson = JsonValue.Parse(responseString);
				C_SignUp wix = new C_SignUp(responseJson);
				id = wix.id;
			}

            return responseString != null;
        }

        /// <summary>
        /// Updates an existing intent
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
        public async Task<bool> UpdateSignUp(string token)
        {
			C_JsonBuilder jb = new C_JsonBuilder();
			jb.Add(Approved, N_Approved);
			jb.Add(Hours, N_Hours);
			jb.Add(UserId, N_UserId);
			string bodyjson = jb.ToString();

			string submiturl = "/signups/" + id.ToString();

            string responseString = await Tools.Upload("PUT", submiturl, bodyjson, token);

            return responseString != null;
        }

        /// <summary>
        /// Removes the intent from the DB
        /// </summary>
        /// <returns>The intent.</returns>
        /// <param name="token">Token.</param>
		public async Task<bool> RemoveIntent(string token)
        {
			string submiturl = "/signups/" + id.ToString();

            string responseString = await Tools.Upload("DELETE", submiturl, "", token);

            return responseString != null;
		}

        public static int CompareByDateAscending(C_SignUp wi1, C_SignUp wi2)
        {
            return wi1.Date.CompareTo(wi2.Date);
        }
    }
}
