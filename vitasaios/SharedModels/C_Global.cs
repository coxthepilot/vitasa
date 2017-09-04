using System;
using System.Collections.Generic;
using System.Json;

namespace zsquared
{
    public enum E_CameFrom { List, Map, MySignUps, SCSites, SCSite, Login, Unknown }

    public class C_Global
    {
		/// <summary>
		/// This is the user that we logged into the system with. Includes a valid token.
		/// </summary>
		public C_VitaUser LoggedInUser;
		///// <summary>
		///// The login token obtained from the pull of the users list.
		///// </summary>
		//public string LoginToken;
        // todo: need for this to time out so it doesn't get stale?
        /// <summary>
        /// A list of all Sites with their details obtained when the user logged in.
        /// </summary>
        public List<C_VitaSite> AllSites;

		/// <summary>
		/// The current selected site for displaying details
		/// </summary>
		public C_VitaSite SelectedSite;
		/// <summary>
		/// The selected calendar entry.
		/// </summary>
		public C_CalendarEntry SelectedCalendarEntry;
		/// <summary>
		/// The selected suggestion.
		/// </summary>
		public C_Suggestion SelectedSuggestion;
		/// <summary>
		/// In VC_Calendar, this is the date that the user picked, headed to SitesOnDate
		/// </summary>
		public C_YMD SelectedDate;
        ///// <summary>
        ///// Used in VolunteerHours
        ///// </summary>
        //public C_SignUp SelectedSignUp;
		/// <summary>
		/// The details view controller needs to know where to go "Back" to
		/// </summary>
		public E_CameFrom DetailsCameFrom = E_CameFrom.Unknown;
        /// <summary>
        /// From SCSiteCalendar to SCDefaults, the selected day of the week
        /// </summary>
        public int SelectedDayOfWeek = -1;

        /// <summary>
        /// The open sites that need help. Used in SitesOnDateMap after launch from SitesOnDateList, and
        /// then in SitesOnDateList if return from Map
        /// </summary>
        public List<C_VitaSite> OpenSitesThatNeedHelp;
        ///// <summary>
        ///// Generated in VC_SitesOnDateList, used in ...Map and SignUp
        ///// </summary>
        public List<C_WorkItem> WorkItemsOnSiteOnDate;
        /// <summary>
        /// The Month and Year last used in the Calendar view.
        /// </summary>
        public C_YMD CalendarDate;
        /// <summary>
        /// The Sites that the current user, a site coordinator is responsible for.
        /// </summary>
        public List<C_VitaSite> SCSites;

        // --- passed to SCVolunteer Hours ---
        // SelectedDate
        // SelectedSite
        public string VolunteerName;
        public C_WorkItem VolunteerWorkItem;
    }
}
