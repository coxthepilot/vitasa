using System;
using System.Json;
using System.Collections.Generic;
using System.Text;

namespace zsquared
{
    //public enum E_VolunteerStatus { NoAdditionalHelpNeeded, AdditionalHelpNeeded, AdditionalHelpUrgentlyNeeded, Unknown }
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
        /// The open time for the site on this date when the default calendar
        /// might have a different open time.
        /// </summary>
        public C_HMS OpenTime;
		/// <summary>
		/// The close time for the site on this date when the default calendar
		/// might have a different close time.
		/// </summary>
		public C_HMS CloseTime;
        /// <summary>
        /// If the site is closed on this date when the default calendar would
        /// have had the site open.
        /// </summary>
        public bool IsClosed;
        /// <summary>
        /// Number of eFilers the Site could host. A value here overrides the 
        /// default Site value.
        /// </summary>
        public int NumEFilers;

		public static readonly string N_ID = "id";
        public static readonly string N_SiteID = "siteid";
        public static readonly string N_Date = "date";
        public static readonly string N_OpenTime = "open";
        public static readonly string N_CloseTime = "close";
        public static readonly string N_IsClosed = "is_closed";
        public static readonly string N_NumEFilers = "efilers_needed";

		public C_CalendarEntry()
        {
        }

		/// <summary>
		/// Create a vita site from the json values, read from the web service
		/// </summary>
		/// <param name="j">Must be Parsed already</param>
		public C_CalendarEntry(JsonValue j)
		{
			if (!(j is JsonObject))
				throw new ApplicationException("we can only work with an object");

            if (j.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(j[N_ID], id);

            if (j.ContainsKey(N_SiteID))
                SiteID = Tools.JsonProcessInt(j[N_SiteID], SiteID);

            if (j.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(j[N_Date], Date);

            if (j.ContainsKey(N_OpenTime))
                OpenTime = Tools.JsonProcessTime(j[N_OpenTime], OpenTime);

            if (j.ContainsKey(N_CloseTime))
                CloseTime = Tools.JsonProcessTime(j[N_CloseTime], CloseTime);

            if (j.ContainsKey(N_IsClosed))
                IsClosed = Tools.JsonProcessBool(j[N_IsClosed], IsClosed);

            if (j.ContainsKey(N_NumEFilers))
                NumEFilers = Tools.JsonProcessInt(j[N_NumEFilers], NumEFilers);
		}

        public string GetJson()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("{[");

            sb.Append("{ " + N_ID + " : " + id.ToString() + "},");
            sb.Append("{ " + N_SiteID + " : " + SiteID.ToString() + "},");
            sb.Append("{ " + N_Date + " : " + Date.ToString("yyyy-mm-dd") + "},");
            sb.Append("{ " + N_OpenTime + " : " + OpenTime.ToString("hh:mm") + "},");
            sb.Append("{ " + N_CloseTime + " : " + CloseTime.ToString("hh:mm") + "},");
            sb.Append("{ " + N_IsClosed + " : " + (IsClosed ? "true" : "false") + "},");
            sb.Append("{ " + N_NumEFilers + " : " + NumEFilers.ToString() + "}");

			sb.Append("]}");

            return sb.ToString();
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
