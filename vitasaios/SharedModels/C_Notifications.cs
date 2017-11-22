using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Json;
using System.Net;

namespace zsquared
{
    public static class C_Notifications
    {
        public enum E_Platform { iOS, Android, SMS }

        public const string N_RegistrationToken = "token";
        public const string N_Platform = "platform";

        /// <summary>
        /// Registers a token with the backend for use in sending notifications.
        /// </summary>
        /// <returns>The notification token.</returns>
        /// <param name="platform">Platform.</param>
        /// <param name="deviceToken">This is the token that we are to save, obtained from the push provider</param>
        /// <param name="authToken">this is the cookie that allows us to access the backend</param>
        public static async Task<bool> RegisterNotificationToken(E_Platform platform, string deviceToken, string authToken)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(deviceToken, N_RegistrationToken);
            jb.Add(platform.ToString().ToLower(), N_Platform);
            string bodyjson = jb.ToString();

			string submiturl = "/notification_registrations";

            string responseString = await Tools.Upload("POST", submiturl, bodyjson, authToken);

            return responseString != null;
		}
    }

    public class C_Notification
    {
        public enum E_NotificationAudience { SiteCoordinators, Volunteers }

        public int id;
        public string Message;
        public E_NotificationAudience Audience;
        public DateTime CreatedDT;
        public DateTime UpdatedDT;
        public DateTime SentDT;

        public const string N_Id = "id";
        public const string N_Message = "message";
        public const string N_Audience = "audience";
        public const string N_CreatedDT = "created_at";
        public const string N_UpdatedDT = "updated_at";
        public const string N_SentDT = "sent";

        public C_Notification(JsonValue j)
        {
            if (j.ContainsKey(N_Id))
                id = Tools.JsonProcessInt(j[N_Id], id);

            if (j.ContainsKey(N_Message))
                Message = Tools.JsonProcessString(j[N_Message], Message);

            if (j.ContainsKey(N_Audience))
            {
                string au = Tools.JsonProcessString(j[N_Audience], Audience.ToString());
                if (au.ToLower() == "volunteers")
                    Audience = E_NotificationAudience.Volunteers;
                else if (au.ToLower() == "sc")
                    Audience = E_NotificationAudience.SiteCoordinators;
            }

            if (j.ContainsKey(N_CreatedDT))
                CreatedDT = Tools.JsonProcessDateTime(j[N_CreatedDT], CreatedDT);

			if (j.ContainsKey(N_UpdatedDT))
				UpdatedDT = Tools.JsonProcessDateTime(j[N_UpdatedDT], UpdatedDT);

			if (j.ContainsKey(N_SentDT))
                SentDT = Tools.JsonProcessDateTime(j[N_SentDT], SentDT);
		}

        public static async Task<List<C_Notification>> FetchAllNotifications(string token)
        {
            List<C_Notification> res = new List<C_Notification>();

            string url = "/notification_requests/";

            string responseString = await Tools.Download(url, token);

            if (responseString != null)
            {
                JsonValue responseJson = JsonValue.Parse(responseString);

                foreach(JsonValue jv in responseJson)
                {
                    C_Notification n = new C_Notification(jv);
                    res.Add(n);
                }
            }

            return res;
        }
    }
}
