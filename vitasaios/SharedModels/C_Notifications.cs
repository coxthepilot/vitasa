using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Json;
using System.Net;

namespace zsquared
{
	public enum E_Platform { iOS, Android, SMS }

	public static class C_Notifications
    {
        public const string N_RegistrationToken = "token";
        public const string N_Platform = "platform";
    }

	public enum E_NotificationAudience { SiteCoordinators, Volunteers }

	public class C_Notification
    {

        public int id;
        public string Message;
        public E_NotificationAudience Audience;
        public DateTime CreatedDT;
        public DateTime UpdatedDT;
        public DateTime SentDT;

        public bool Dirty; // is only used by the UI; not save in the DB

        public const string N_Id = "id";
        public const string N_Message = "message";
        public const string N_Audience = "audience";
        public const string N_CreatedDT = "created_at";
        public const string N_UpdatedDT = "updated_at";
        public const string N_SentDT = "sent";

        public C_Notification()
        {
            id = -1;
            Message = "";
            Audience = E_NotificationAudience.Volunteers;
            CreatedDT = DateTime.MinValue;
            UpdatedDT = DateTime.MinValue;
            SentDT = DateTime.MinValue;
            Dirty = false;
        }

        public C_Notification(JsonValue j)
        {
            SentDT = DateTime.MinValue;

            if (j.ContainsKey(N_Id))
                id = Tools.JsonProcessInt(j[N_Id], id);

            if (j.ContainsKey(N_Message))
            {
                string unescapedMessage = Tools.JsonProcessString(j[N_Message], Message);
                Message = unescapedMessage.Replace("\\n", "\n");
			}

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

            Dirty = false;
		}

    }
}
