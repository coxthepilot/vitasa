using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace zsquared
{
    public enum E_SiteCapabilities { DropOff, Express, MFT, InPerson }

    public enum E_SiteType {
        All = 2,         // only used in filtering; not a valid site type
        Fixed = 0, 
        Mobile = 1
    }

    public class C_VitaSite
    {
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

        public List<int> SiteCoordinatorsIds;
        public List<string> SiteCoordinatorNames; // offsets must match

        public List<C_CalendarEntry> SiteCalendar;  // site calendar, 1 entry per day the site is open in the season
        public List<E_SiteCapabilities> SiteCapabilities;

        public E_SiteType SiteType;

        public List<C_WorkLogItem> WorkLogItems;

        public DateTime SampleTime; // not stored in the DB; is used to age out site entries
        public double DistanceFromUserLocation; // not save in the DB, calculated distance from user, for sorting
        public bool PreferredSite; // not saved in the DB, set true if the user wants this as a preferred site
        public bool Dirty; // not saved

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
        public static readonly string N_SiteCoordinatorIds = "sitecoordinatorids";
        public static readonly string N_SiteCoordinatorNames = "sitecoordinatornames";
        public static readonly string N_SiteType = "sitetype";
        public static readonly string N_WorkLogItems = "worklogitems";

        public static readonly string N_SiteCalendar = "calendar_overrides";

        public static readonly string N_SiteCapabilities = "site_features";

        /// <summary>
        /// Create a vita site from the json values, read from the web service
        /// </summary>
        /// <param name="j">Must be Parsed already</param>
        public C_VitaSite(JsonValue j)
        {
			SiteCalendar = new List<C_CalendarEntry>();
			SiteCapabilities = new List<E_SiteCapabilities>();

            SiteCoordinatorsIds = new List<int>();
            SiteCoordinatorNames = new List<string>();

            WorkLogItems = new List<C_WorkLogItem>();

            State = "TX";

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

            if (j.ContainsKey(N_SiteType))
            {
                string st = Tools.JsonProcessString(j[N_SiteType], SiteType.ToString());
                SiteType = Tools.StringToEnum<E_SiteType>(st);
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

            if (j.ContainsKey(N_WorkLogItems))
            {
                var jv = j[N_WorkLogItems];
                if (jv is JsonArray)
                {
                    foreach(JsonValue jav in jv)
                    {
                        C_WorkLogItem wi = new C_WorkLogItem(jav);
                        WorkLogItems.Add(wi);
                    }
                }
            }

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

            if (j.ContainsKey(N_SiteCoordinatorIds))
            {
                var jv = j[N_SiteCoordinatorIds];
                if (jv is JsonArray)
                {
                    foreach (JsonValue jav in jv)
                    {
                        int scid = Tools.JsonProcessInt(jav, -1);
                        SiteCoordinatorsIds.Add(scid);
                    }
                }
            }

            if (j.ContainsKey(N_SiteCoordinatorNames))
            {
                var jv = j[N_SiteCoordinatorNames];
                if (jv is JsonArray)
                {
                    foreach (JsonValue jav in jv)
                    {
                        string scname = Tools.JsonProcessString(jav, null);
                        SiteCoordinatorNames.Add(scname);
                    }
                }
            }

            SampleTime = DateTime.Now;
        }

        public C_VitaSite()
        {
            SiteCalendar = new List<C_CalendarEntry>();
            SiteCapabilities = new List<E_SiteCapabilities>();

            SiteCoordinatorsIds = new List<int>();
            SiteCoordinatorNames = new List<string>();

            WorkLogItems = new List<C_WorkLogItem>();

            State = "TX";
        }

        /// <summary>
        /// Make a shallow clone of the site object
        /// </summary>
        /// <param name="s">S.</param>
        public C_VitaSite(C_VitaSite s)
        {
            id = s.id;
            Name = s.Name;
            Slug = s.Slug;
            Street = s.Street;
            City = s.City;
            State = s.State;
            Zip = s.Zip;
            Latitude = s.Latitude;
            Longitude = s.Longitude;
            PlaceID = s.PlaceID;
            SiteCoordinatorsIds = s.SiteCoordinatorsIds;
            SiteCoordinatorNames = s.SiteCoordinatorNames;
            SiteCalendar = s.SiteCalendar;
            SiteCapabilities = s.SiteCapabilities;
            SiteType = s.SiteType;
            WorkLogItems = s.WorkLogItems;
        }

        /// <summary>
        /// Return the Calendar Entry for the specified date. Null if outside the season.
        /// </summary>
        /// <returns>The calendar entry for date.</returns>
        /// <param name="onDate">On date.</param>
        public C_CalendarEntry GetCalendarEntryForDate(C_YMD onDate)
        {
            var ou = SiteCalendar.Where(ce => ce.Date == onDate);
            C_CalendarEntry res = ou.FirstOrDefault();

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

			var ou = SiteCalendar.Where(ce => ce.Date == onDate);
            C_CalendarEntry calEntry = ou.FirstOrDefault();

            if (calEntry != null)
                res = calEntry.SiteIsOpen;

            return res;
		}

        public override string ToString()
        {
            return Name;
        }

        public string ToJson(bool full = true)
        {
            C_JsonBuilder jb = new C_JsonBuilder();

            jb.Add(id, N_ID);
            jb.Add(Name, N_Name);
            jb.Add(Slug, N_Slug);
            jb.Add(Street, N_Street);
            jb.Add(City, N_City);
            jb.Add(State, N_State);
            jb.Add(Zip, N_Zip);
            jb.Add(Latitude, N_Latitude);
            jb.Add(Longitude, N_Longitude);
            jb.Add(PlaceID, N_PlaceID);
            jb.Add(SiteType.ToString(), N_SiteType);

            jb.StartArray(N_SiteCalendar);
            foreach (C_CalendarEntry ce in SiteCalendar)
                jb.AddArrayObject(ce.ToJson());
            jb.EndArray();

            jb.StartArray(N_SiteCapabilities);
            foreach (E_SiteCapabilities sc in SiteCapabilities)
                jb.AddArrayElement(sc.ToString());
            jb.EndArray();

            if (full)
            {
                jb.StartArray(N_SiteCoordinatorIds);
                foreach (int scid in SiteCoordinatorsIds)
                    jb.AddArrayElement(scid.ToString());
                jb.EndArray();

                jb.StartArray(N_WorkLogItems);
                foreach (C_WorkLogItem wi in WorkLogItems)
                    jb.AddArrayObject(wi.ToJson());
                jb.EndArray();
            }

            string json = jb.ToString();

#if DEBUG
            // just for fun, make sure we can re-import the site
            JsonValue jsonv = JsonValue.Parse(json);
            C_VitaSite testSite = new C_VitaSite(jsonv);
            bool nameok = Name == testSite.Name;
            // todo: check more items...
#endif

            return json;
        }

        // ------------ static methods -----------

        public static int CompareSitesByNameAscending(C_VitaSite s1, C_VitaSite s2)
		{
			return string.Compare(s1.Name, s2.Name, StringComparison.Ordinal);
		}

        public static int CompareSitesByNameAscendingLower(C_VitaSite s1, C_VitaSite s2)
        {
            return string.Compare(s1.Name.ToLower(), s2.Name.ToLower(), StringComparison.Ordinal);
        }

        public static int CompareSitesByDistance(C_VitaSite s1, C_VitaSite s2)
        {
            return double.IsNaN(s1.DistanceFromUserLocation) || double.IsNaN(s2.DistanceFromUserLocation)
                ? 0
                : s1.DistanceFromUserLocation.CompareTo(s2.DistanceFromUserLocation);
        }
    }
}
