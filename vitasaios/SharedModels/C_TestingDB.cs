using System;
using System.Json;
using System.Collections.Generic;

namespace zsquared
{
    /// <summary>
    /// Class holding test data to allow for more extensive app testing
    /// </summary>
    public class C_TestingDB
    {
        // one set of lists for each table in the DB

        //public List<C_SignUp> SignUps;
        public List<C_Suggestion> Suggestions;
        public List<C_Notification> Notifications;
        public List<C_VitaSite> Sites;
        public List<C_CalendarEntry> CalendarEntries;
        public List<C_VitaUser> Users;

		public static readonly string N_Sites = "Sites";
		public static readonly string N_Users = "Users";
		public static readonly string N_Calendar = "Calendar";
		public static readonly string N_Suggestions = "Suggestions";
        public static readonly string N_SignUps = "SignUps";
        public static readonly string N_Notification = "Notifications";

		public C_TestingDB(string dbAsJsonString)
        {
			try
			{
				JsonValue jv = JsonValue.Parse(dbAsJsonString);

				if (!(jv is JsonObject))
					throw new ApplicationException("must be an object");

                //if (jv.ContainsKey(N_SignUps))
                    //SignUps = C_SignUp.ImportSignUps(jv[N_SignUps]);

				if (jv.ContainsKey(N_Suggestions))
					Suggestions = C_Suggestion.ImportSuggestion(jv[N_Suggestions]);

				if (jv.ContainsKey(N_Notification))
                    Notifications = C_Notification.ImportNotifications(jv[N_Notification]);

				if (jv.ContainsKey(N_Sites))
					Sites = C_VitaSite.ImportSites(jv[N_Sites]);

				if (jv.ContainsKey(N_Calendar))
					CalendarEntries = C_CalendarEntry.ImportCalendar(jv[N_Calendar]);

				if (jv.ContainsKey(N_Users))
					Users = C_VitaUser.ImportUsers(jv[N_Users]);
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
			}
		}
    }
}
