using System;
using System.Collections.Generic;
using System.Json;
using System.Linq;
using System.Threading.Tasks;

namespace zsquared
{
    public enum E_CameFrom { List, Map, MySignUps, SCSites, SCSite, Login, Unknown }

    public class C_Global
    {
		/// <summary>
		/// This is the user that we logged into the system with. Includes a valid token.
		/// </summary>
		public C_VitaUser LoggedInUser;
        /// <summary>
        /// A list of all Sites with their details obtained when the user logged in.
        /// </summary>
        public List<C_VitaSite> AllSites;
        /// <summary>
        /// A list of C_WorkItems found in pulling Site and User data
        /// </summary>
        public List<C_WorkItem> WorkItems;
        /// <summary>
        /// List of known users; this is not a list of ALL users, just ones we have seen
        /// </summary>
        public List<C_VitaUser> Users;

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
        public C_YMD WorkItemsDate;
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
        public C_WorkItem VolunteerWorkItem;

        // --- used in VC_Calendar ---
        public List<C_SiteSchedule> SitesSchedule;
        public DateTime SiteScheduleSampleTime;

        public DateTime LastFetchRunTime;

        public async Task<bool> GetAllSites()
        {
			// get the all sites details
			AllSites = await C_VitaSite.FetchSitesListX();
            if (AllSites == null)
                AllSites = new List<C_VitaSite>();

			if (WorkItems == null)
				WorkItems = new List<C_WorkItem>();
            
			// move and merge the work intents into our master list of work intents
			//  [this is to avoid the duplication with the work intents in the user]
			foreach (C_VitaSite site in AllSites)
			{
				List<C_WorkItem> intents = site.WorkIntentsX;
				site.WorkIntentsX = null;
				List<C_WorkItem> history = site.WorkHistoryX;
				site.WorkHistoryX = null;

                foreach(C_WorkItem wi in intents)
                {
                    if (!WorkItemsHasId(wi.id))
                        WorkItems.Add(wi);
                }

				foreach (C_WorkItem wi in history)
				{
					if (!WorkItemsHasId(wi.id))
						WorkItems.Add(wi);
				}
			}

            return true;
		}

        public async Task<C_VitaUser> GetUserDetails(int id)
        {
            C_VitaUser user = null;

            if (Users == null)
            {
                Users = new List<C_VitaUser>();
                if (LoggedInUser != null)
                    Users.Add(LoggedInUser);
            }

            // check our local cache
            var ou = Users.Where(u => u.id == id);
            if (ou.Any())
                user = ou.First();

            // if not found them pull from the API and store off the workintents
            if (user == null)
            {
                user = await C_VitaUser.FetchUserX(LoggedInUser.Token, id);
                if (user != null)
                {
                    List<C_WorkItem> intents = user.WorkIntentsX;
                    user.WorkIntentsX = null;
                    List<C_WorkItem> history = user.WorkHistoryX;
                    user.WorkHistoryX = null;

                    foreach (C_WorkItem wi in intents)
                    {
                        if (!WorkItemsHasId(wi.id))
                            WorkItems.Add(wi);
                    }

                    foreach (C_WorkItem wi in history)
                    {
                        if (!WorkItemsHasId(wi.id))
                            WorkItems.Add(wi);
                    }
                }
            }

            return user;
        }

        private bool WorkItemsHasId(int id)
        {
            var ou = WorkItems.Where(wi => wi.id == id);

            return ou.Any();
        }

        public enum E_SiteCondition { Open, Closed, Any }

        /// <summary>
        /// Returns a list of WorkItems that match the criteria.
        /// </summary>
        /// <returns>The work items for site on date for user.</returns>
        /// <param name="siteSlug">null means all sites</param>
        /// <param name="onDate">null means all dates</param>
        /// <param name="userId">null means all users</param>
        public List<C_WorkItem> GetWorkItemsForSiteOnDateForUser(string siteSlug, C_YMD onDate, int userId, E_SiteCondition condition)
        {
            List<C_WorkItem> res = new List<C_WorkItem>();
                
            foreach(C_WorkItem wi in WorkItems)
            {
                if (   ((siteSlug == null) || (siteSlug == wi.SiteSlug))
                    && ((onDate == null)   || (onDate == wi.Date))
                    && ((userId == -1)     || (userId == wi.UserId))
                    &&     ((condition == E_SiteCondition.Any) 
                        || ((onDate != null) && (siteSlug != null) && SiteConditionTest(siteSlug, condition, onDate)))
                   )
                    res.Add(wi);
            }

            return res;
        }

        private bool SiteConditionTest(string siteSlug, E_SiteCondition condition, C_YMD onDate)
        {
            C_VitaSite site = C_VitaSite.GetSiteBySlug(siteSlug, AllSites);

            bool res = false;

            switch (condition)
            {
                case E_SiteCondition.Open:
                    res = site.SiteIsOpenOnDay(onDate);
                    break;
                case E_SiteCondition.Closed:
					res = !site.SiteIsOpenOnDay(onDate);
					break;
                case E_SiteCondition.Any:
                    res = true;
                    break;
            }

            return res;
        }

        public void ClearDirtyFlagOnIntents()
        {
            foreach (C_WorkItem wi in WorkItems)
                wi.Dirty = false;
        }
    }
}
