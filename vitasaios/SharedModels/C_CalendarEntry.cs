using System;
using System.Json;

namespace zsquared
{
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

		public override bool Equals(System.Object obj)
		{
			if (obj == null)
				return false;

            C_CalendarEntry g = obj as C_CalendarEntry;
			if ((System.Object)g == null)
				return false;

			bool res = true;

			res &= id == g.id;
            res &= SiteID == g.SiteID;
            if (Date != null)
				res &= Date == g.Date;
            if (OpenTime != null)
				res &= OpenTime == g.OpenTime;
            if (CloseTime != null)
				res &= CloseTime == g.CloseTime;
            res &= IsClosed == g.IsClosed;
            res &= NumEFilers == g.NumEFilers;

			return res;
		}

		public static bool operator ==(C_CalendarEntry a, C_CalendarEntry b)
		{
			// If both are null, or both are same instance, return true.
			if (System.Object.ReferenceEquals(a, b))
			{
				return true;
			}

			// If one is null, but not both, return false.
			if (((object)a == null) || ((object)b == null))
			{
				return false;
			}

			// Return true if the fields match:
			return a.Equals(b);
		}

		public static bool operator !=(C_CalendarEntry a, C_CalendarEntry b)
		{
			return !(a == b);
		}

		public override int GetHashCode()
		{
			int hash = 269;
            hash = (hash * 47) * id.GetHashCode();
            hash = (hash * 47) * SiteID.GetHashCode();
            hash = (hash * 47) * Date.GetHashCode();
            hash = (hash * 47) * OpenTime.GetHashCode();
            hash = (hash * 47) * CloseTime.GetHashCode();
            hash = (hash * 47) * IsClosed.GetHashCode();
            hash = (hash * 47) * NumEFilers.GetHashCode();

			return hash;
		}
	}
}
