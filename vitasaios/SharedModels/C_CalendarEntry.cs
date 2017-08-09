using System;
using System.Json;
using System.Collections.Generic;


namespace zsquared
{
    public enum E_VolunteerStatus { NoAdditionalHelpNeeded, AdditionalHelpNeeded, AdditionalHelpUrgentlyNeeded, Unknown }
    /// <summary>
    /// Represents a date for a Site. The operational details for every open date
    /// are maintained in an entry for that Site on a specific date.
    /// </summary>
    public class C_CalendarEntry
    {
        /// <summary>
        /// The id for this entry in the DB.
        /// </summary>
        public int id;
        /// <summary>
        /// The DB id of the Site that coresponds to this record.
        /// </summary>
        public int SiteID;
        /// <summary>
        /// The date for this record.
        /// </summary>
        public C_YMD Date;
        /// <summary>
        /// The open time for the site on this date.
        /// </summary>
        public C_HMS OpenTime;
        /// <summary>
        /// The close time for the site on this date.
        /// </summary>
        public C_HMS CloseTime;

        /// <summary>
        /// The overall eFiler status.
        /// </summary>
        public E_VolunteerStatus EfilerStatus;
        /// <summary>
        /// The maximum number of eFilers needed.
        /// </summary>
        public int EfilersNeeded;
        /// <summary>
        /// The list of folks who have signalled an intent to be at this Site on this date.
        /// </summary>
        public List<string> EFilerIntents;

		public static readonly string N_ID = "id";
        public static readonly string N_SiteID = "siteid";
        public static readonly string N_Date = "date";
        public static readonly string N_OpenTime = "opentime";
        public static readonly string N_CloseTime = "closetime";
        public static readonly string N_EfilerStatus = "efilerstatus";
        public static readonly string N_EfilersNeeded = "efilersneeded";
        public static readonly string N_EfilerIntents = "efilerintents";


		public C_CalendarEntry()
        {
        }

        public static List<C_CalendarEntry> ImportCalendar(JsonValue json)
		{
			if (!(json is JsonArray))
				throw new ApplicationException("the sites list must be an array");

			// create the holding place for the results
			List<C_CalendarEntry> res = new List<C_CalendarEntry>();
			foreach (JsonValue j in json)
			{
				C_CalendarEntry vs = new C_CalendarEntry(j);
				res.Add(vs);
			}

			return res;
		}


		/// <summary>
		/// Create a vita site from the json values, read from the web service
		/// </summary>
		/// <param name="j">Must be Parsed already</param>
		public C_CalendarEntry(JsonValue j)
		{
            EFilerIntents = new List<string>();

			if (!(j is JsonObject))
				throw new ApplicationException("we can only work with an object");

			if (j.ContainsKey(N_ID))
                id = j[N_ID];

			if (j.ContainsKey(N_SiteID))
                SiteID = j[N_SiteID];

            if (j.ContainsKey(N_Date))
                Date = new C_YMD((string)j[N_Date]);

            if (j.ContainsKey(N_OpenTime))
                OpenTime = new C_HMS((string)j[N_OpenTime]);

			if (j.ContainsKey(N_CloseTime))
                CloseTime = new C_HMS((string)j[N_CloseTime]);

			if (j.ContainsKey(N_EfilersNeeded))
                EfilersNeeded = (int)j[N_EfilersNeeded];

            if (j.ContainsKey(N_EfilerIntents))
            {
                JsonValue efia = j[N_EfilerIntents];
                if (!(efia is JsonArray))
                    throw new ApplicationException("list of efiler intents must be an array");

                foreach (JsonValue efi in efia)
                    EFilerIntents.Add((string)efi);
            }

			if (j.ContainsKey(N_EfilerStatus))
			{
				string ssv = j[N_EfilerStatus];

				foreach (E_VolunteerStatus ss in Enum.GetValues(typeof(E_VolunteerStatus)))
				{
					if (ssv == ss.ToString())
					{
                        EfilerStatus = ss;
						break;
					}
				}
			}
		}

        public static List<C_YMD> GetListOfDates(List<C_CalendarEntry> cel)
        {
            List<C_YMD> res = new List<C_YMD>();

            foreach(C_CalendarEntry ce in cel)
            {
                if (!res.Contains(ce.Date))
                    res.Add(ce.Date);
            }

            return res;
        }

	}
}
