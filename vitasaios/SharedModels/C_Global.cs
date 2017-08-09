using System;
using System.Collections.Generic;
using System.Json;

namespace zsquared
{
    public enum E_CameFrom { List, Map, Unknown }

    public class C_Global
    {
        /// <summary>
        /// The list of sites loaded from the backend 
        /// </summary>
        public List<C_VitaSite> Sites;
        /// <summary>
        /// The list of users pulled during the opening of the app.
        /// </summary>
        public List<C_VitaUser> Users;
        /// <summary>
        /// The list of calendar items for the various sites.
        /// </summary>
        public List<C_CalendarEntry> Calendar;
        /// <summary>
        /// The posted suggestions; normally not kept in memory
        /// </summary>
        public List<C_Suggestion> Suggestions;
        /// <summary>
        /// The time stamp when sites was loaded from the backend.
        /// </summary>
        public DateTime TimeStampWhenSitesLoaded;
        /// <summary>
        /// The current selected site for displaying details
        /// </summary>
        public C_VitaSite SelectedSite;
		/// <summary>
		/// The selected user.
		/// </summary>
		public C_VitaUser SelectedUser;
        /// <summary>
        /// The selected calendar entry.
        /// </summary>
        public C_CalendarEntry SelectedCalendarEntry;
        /// <summary>
        /// This is the user that we logged into the system with.
        /// </summary>
        public C_VitaUser LoggedInUser;
        /// <summary>
        /// The selected suggestion.
        /// </summary>
        public C_Suggestion SelectedSuggestion;
		/// <summary>
		/// The details view controller needs to know where to go "Back" to
		/// </summary>
		public E_CameFrom DetailsCameFrom = E_CameFrom.Unknown;
        /// <summary>
        /// The login token obtained from the pull of the users list.
        /// </summary>
        public string LoginToken;

        public static readonly string N_Sites = "Sites";
        public static readonly string N_Users = "Users";
        public static readonly string N_Calendar = "Calendar";
        public static readonly string N_Suggestions = "Suggestions";

        public C_Global()
        {
        }

        public C_Global(string initString)
        {
            try
            {
                JsonValue jv = JsonValue.Parse(initString);

                if (!(jv is JsonObject))
                    throw new ApplicationException("must be an object");

                if (jv.ContainsKey(N_Sites))
                    Sites = C_VitaSite.ImportSites(jv[N_Sites]);

                if (jv.ContainsKey(N_Users))
                    Users = C_VitaUser.ImportUsers(jv[N_Users]);

                if (jv.ContainsKey(N_Calendar))
                    Calendar = C_CalendarEntry.ImportCalendar(jv[N_Calendar]);

                if (jv.ContainsKey(N_Suggestions))
                    Suggestions = C_Suggestion.ImportSuggestion(jv[N_Suggestions]);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
		}
    }
}
