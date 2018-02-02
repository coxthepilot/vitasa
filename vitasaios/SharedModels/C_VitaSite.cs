using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace zsquared
{
    public enum E_ClientSiteStatus { Closed, Accepting, NearLimit, NotAccepting, Unknown }

    public enum E_SiteCapabilities { DropOff, Express, MFT }

    public class C_VitaSite
    {
        public static List<string> N_ClientStatusNames = new List<string>() { "Closed", "Accepting", "Near Limit", "At Limit" };

        public int id = -1;
        public string Name;
        public string Slug;
        public string Street;
        public string City;
        public string State;
        public string Zip;
        public string Latitude;
        public string Longitude;
        public string PlaceID;

        public int    PrimaryCoordinatorId;     // user id of user with site coordinator for this site
		public string PrimaryCoordinatorName;   // as a convenience, the backend populate the actual name
		public int    BackupCoordinatorId;      // user if of backup coordinator
		public string BackupCoordinatorName;    // convenience

		public E_ClientSiteStatus ClientStatus = E_ClientSiteStatus.Unknown;

        public List<C_CalendarEntry> SiteCalendar;  // site calendar, 1 entry per day the site is open in the season

        public List<C_SignUp> WorkHistoryX;
        public List<C_SignUp> WorkIntentsX;

        public C_YMD SeasonFirstDate;
        public C_YMD SeasonLastDate;

        public List<E_SiteCapabilities> SiteCapabilities;

        public DateTime SampleTime; // not stored in the DB; is used to age out site entries

        public double DistanceFromUserLocation; // not save in the DB, calculated distance from user, for sorting

        public static readonly string N_ID = "id";
        public static readonly string N_Name = "name";
        public static readonly string N_Slug = "slug";
        public static readonly string N_Street = "street";
        public static readonly string N_City = "city";
        public static readonly string N_State = "state";
        public static readonly string N_Zip = "zip";
        public static readonly string N_Latitude = "latitude";
        public static readonly string N_Longitude = "longitude";
        public static readonly string N_PlaceID = "google_place_id";

        public static readonly string N_PrimaryCoordinatorId = "sitecoordinator";
		public static readonly string N_PrimarySiteCoordinatorName = "sitecoordinator_name";
        public static readonly string N_BackupCoordinatorId = "backup_coordinator";
		public static readonly string N_BackupCoordinatorIdForPut = "backup_coordinator_id";
		public static readonly string N_BackupSiteCoordinatorName = "backup_coordinator_name";

        public static readonly string N_ClientStatus = "sitestatus";

		public static readonly string N_SiteCalendar = "calendar_overrides";

		public static readonly string N_WorkHistory = "work_history";
        public static readonly string N_WorkIntents = "work_intents";

        public static readonly string N_SeasonFirstDate = "season_start";
        public static readonly string N_SeasonLastDate = "season_end";

        public static readonly string N_SiteCapabilities = "site_features";

        /// <summary>
        /// Create a vita site from the json values, read from the web service
        /// </summary>
        /// <param name="j">Must be Parsed already</param>
        public C_VitaSite(JsonValue j)
        {
			SeasonFirstDate = new C_YMD(2018, 1, 16);
			SeasonLastDate = new C_YMD(2018, 4, 17);

			SiteCalendar = new List<C_CalendarEntry>();
			WorkHistoryX = new List<C_SignUp>();
			WorkIntentsX = new List<C_SignUp>();
			SiteCapabilities = new List<E_SiteCapabilities>();

			if (j.ContainsKey(N_ID))
				id = Tools.JsonProcessInt(j[N_ID], id);

			if (j.ContainsKey(N_Name))
				Name = Tools.JsonProcessString(j[N_Name], Name);

			if (j.ContainsKey(N_Slug))
				Slug = Tools.JsonProcessString(j[N_Slug], Slug);

			if (j.ContainsKey(N_Street))
				Street = Tools.JsonProcessString(j[N_Street], Street);

			if (j.ContainsKey(N_City))
				City = Tools.JsonProcessString(j[N_City], City);

			if (j.ContainsKey(N_State))
				State = Tools.JsonProcessString(j[N_State], State);

			if (j.ContainsKey(N_Zip))
				Zip = Tools.JsonProcessString(j[N_Zip], Zip);

			if (j.ContainsKey(N_Latitude))
				Latitude = Tools.JsonProcessString(j[N_Latitude], Latitude);

			if (j.ContainsKey(N_Longitude))
				Longitude = Tools.JsonProcessString(j[N_Longitude], Longitude);

			if (j.ContainsKey(N_PlaceID))
				PlaceID = Tools.JsonProcessString(j[N_PlaceID], PlaceID);

			if (j.ContainsKey(N_PrimaryCoordinatorId))
				PrimaryCoordinatorId = Tools.JsonProcessInt(j[N_PrimaryCoordinatorId], PrimaryCoordinatorId);

			if (j.ContainsKey(N_PrimarySiteCoordinatorName))
				PrimaryCoordinatorName = Tools.JsonProcessString(j[N_PrimarySiteCoordinatorName], PrimaryCoordinatorName);

			if (j.ContainsKey(N_BackupCoordinatorId))
				BackupCoordinatorId = Tools.JsonProcessInt(j[N_BackupCoordinatorId], BackupCoordinatorId);

			if (j.ContainsKey(N_BackupSiteCoordinatorName))
				BackupCoordinatorName = Tools.JsonProcessString(j[N_BackupSiteCoordinatorName], BackupCoordinatorName);

			if (j.ContainsKey(N_ClientStatus))
			{
				string ssv = Tools.JsonProcessString(j[N_ClientStatus], "Unknown");
				ClientStatus = Tools.StringToEnum<E_ClientSiteStatus>(ssv);
			}

			if (j.ContainsKey(N_SiteCalendar))
			{
				var jv = j[N_SiteCalendar];
				if (jv is JsonArray)
				{
					foreach (JsonValue jav in jv)
					{
						C_CalendarEntry ce = new C_CalendarEntry(jav);
						SiteCalendar.Add(ce);
					}
				}
			}

            // 12-jan-2018: ignore these; the format is wrong and causing issues
			//if (j.ContainsKey(N_WorkHistory))
			//{
			//	if (j[N_WorkHistory] is JsonArray)
			//	{
			//		WorkHistoryX = new List<C_SignUp>();
			//		JsonArray ja = (JsonArray)j[N_WorkHistory];
			//		foreach (JsonValue jav in ja)
			//		{
			//			C_SignUp wi = new C_SignUp(jav);
			//			WorkHistoryX.Add(wi);
			//		}
			//	}
			//}

            // 12-jan-2018: ignore these; the format is wrong and causing issues
			//if (j.ContainsKey(N_WorkIntents))
			//{
			//	if (j[N_WorkIntents] is JsonArray)
			//	{
			//		WorkIntentsX = new List<C_SignUp>();
			//		JsonArray ja = (JsonArray)j[N_WorkIntents];
			//		foreach (JsonValue jav in ja)
			//		{
			//			C_SignUp wi = new C_SignUp(jav);
			//			WorkIntentsX.Add(wi);
			//		}
			//	}
			//}

			if (j.ContainsKey(N_SeasonFirstDate))
				SeasonFirstDate = Tools.JsonProcessDate(j[N_SeasonFirstDate], SeasonFirstDate);

			if (j.ContainsKey(N_SeasonLastDate))
				SeasonLastDate = Tools.JsonProcessDate(j[N_SeasonLastDate], SeasonLastDate);

			if (j.ContainsKey(N_SiteCapabilities))
			{
				var jv = j[N_SiteCapabilities];
				if (jv is JsonArray)
				{
					foreach (JsonValue jav in jv)
					{
						string s_jav = Tools.JsonProcessString(jav, "Unknown");
						E_SiteCapabilities sc = Tools.StringToEnum<E_SiteCapabilities>(s_jav);
						SiteCapabilities.Add(sc);
					}
				}
			}

            SampleTime = DateTime.Now;
        }

        /// <summary>
        /// Return the Calendar Entry for the specified date. Null if outside the season.
        /// </summary>
        /// <returns>The calendar entry for date.</returns>
        /// <param name="onDate">On date.</param>
        public C_CalendarEntry GetCalendarEntryForDate(C_YMD onDate)
        {
            C_CalendarEntry res = null;
            if ((onDate >= SeasonFirstDate) || (onDate <= SeasonLastDate))
            {
                var ou = SiteCalendar.Where(ce => ce.Date == onDate);
                res = ou.FirstOrDefault();
            }
            return res;
        }

        public C_CalendarEntry GetCalendarEntryById(int calendarId)
        {
            var ou = SiteCalendar.Where(ce => ce.id == calendarId);
            C_CalendarEntry res = ou.FirstOrDefault();

            return res;
        }

        /// <summary>
        /// Returns true if the site is open on the specified date. If outside the season for the site,
        /// returns false.
        /// </summary>
        /// <returns><c>true</c>, if is open on day was sited, <c>false</c> otherwise.</returns>
        /// <param name="onDate">On date.</param>
		public bool SiteIsOpenOnDay(C_YMD onDate)
		{
            bool res = false;

            C_CalendarEntry calEntry = null;
			if ((onDate >= SeasonFirstDate) || (onDate <= SeasonLastDate))
			{
				var ou = SiteCalendar.Where(ce => ce.Date == onDate);
				calEntry = ou.FirstOrDefault();
			}
            if (calEntry != null)
                res = calEntry.SiteIsOpen;

            return res;
		}

		// ------------ static methods -----------

		public static int CompareSitesByNameAscending(C_VitaSite s1, C_VitaSite s2)
		{
			return string.Compare(s1.Name, s2.Name, StringComparison.Ordinal);
		}

        public static int CompareSitesByDistance(C_VitaSite s1, C_VitaSite s2)
        {
            if (double.IsNaN(s1.DistanceFromUserLocation) || double.IsNaN(s2.DistanceFromUserLocation))
                return 0;

            return s1.DistanceFromUserLocation.CompareTo(s2.DistanceFromUserLocation);
        }
	}
}
