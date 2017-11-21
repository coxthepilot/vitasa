using System;
using System.Collections.Generic;
using System.Json;
using System.Text;

namespace zsquared
{
    /// <summary>
    /// Represents a date for a Site. The operational details for every open date
    /// are maintained in an entry for that Site on a specific date. Each Site has one of 
    /// these for every day the site is open.
    /// </summary>
    public class C_CalendarEntry
    {
        public int id;
        public int SiteID;
        public C_YMD Date;
		public bool SiteIsOpen;
		public List<C_WorkShift> WorkShifts;

        public bool HaveShifts;         // not saved in the db; only used to prevent multiple loads of the shifts
        public bool Dirty;

        public static readonly string N_ID = "id";
        public static readonly string N_SiteID = "siteid";
        public static readonly string N_Date = "date";
        public static readonly string N_IsClosed = "is_closed";
        public static readonly string N_WorkShifts = "workshifts";

        public C_CalendarEntry()
        {
            WorkShifts = new List<C_WorkShift>();
            HaveShifts = false;
        }

        /// <summary>
        /// Create a vita site from the json values, read from the web service
        /// </summary>
        /// <param name="j">Must be Parsed already</param>
        public C_CalendarEntry(JsonValue j)
        {
			WorkShifts = new List<C_WorkShift>();

			if (!(j is JsonObject))
                return;

            if (j.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(j[N_ID], id);

            if (j.ContainsKey(N_SiteID))
                SiteID = Tools.JsonProcessInt(j[N_SiteID], SiteID);

            if (j.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(j[N_Date], Date);

            if (j.ContainsKey(N_IsClosed))
                SiteIsOpen = !Tools.JsonProcessBool(j[N_IsClosed], !SiteIsOpen);

            if (j.ContainsKey(N_WorkShifts))
            {
				var jv = j[N_WorkShifts];
				if (jv is JsonArray)
				{
					foreach (JsonValue jav in jv)
					{
                        C_WorkShift ws = new C_WorkShift(jav);
                        WorkShifts.Add(ws);
					}
				}
			}
		}

        public string ToJson(bool withShifts)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(SiteID, N_SiteID);
            jb.Add(Date, N_Date);
            jb.Add(!SiteIsOpen, N_IsClosed);

            if (withShifts)
            {
                jb.StartArray(N_WorkShifts);
                foreach(C_WorkShift ws in WorkShifts)
                    ws.AddJson(jb);
                jb.EndArray();
            }

            string res = jb.ToString();
            return res;
		}
	}
}
