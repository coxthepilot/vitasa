using System;
using System.Json;
using System.Collections.Generic;

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
        public C_HMS OpenTime;
        public C_HMS CloseTime;

        public DayOfWeek DOW;   // not saved in the db; used in the admincal reset
        public bool Dirty;

        public static readonly string N_ID = "id";
        public static readonly string N_SiteID = "siteid";
        public static readonly string N_Date = "date";
        public static readonly string N_IsClosed = "is_closed";
        public static readonly string N_OpenTime = "open";
        public static readonly string N_CloseTime = "close";

        public C_CalendarEntry()
        {
        }

        public C_CalendarEntry(C_CalendarEntry ce)
        {
            id = ce.id;
            SiteID = ce.SiteID;
            if (ce.Date != null)
                Date = new C_YMD(ce.Date);
            SiteIsOpen = ce.SiteIsOpen;
            if (ce.OpenTime != null)
                OpenTime = new C_HMS(ce.OpenTime);
            if (ce.CloseTime != null)
                CloseTime = new C_HMS(ce.CloseTime);
            Dirty = ce.Dirty;
        }

        public void CopyFrom(C_CalendarEntry ce)
        {
            id = ce.id;
            SiteID = ce.SiteID;
            if (ce.Date != null)
               Date = new C_YMD(ce.Date);
            SiteIsOpen = ce.SiteIsOpen;
            if (ce.OpenTime != null)
                OpenTime = new C_HMS(ce.OpenTime);
            if (ce.CloseTime != null)
                CloseTime = new C_HMS(ce.CloseTime);
            Dirty = ce.Dirty;
        }

        /// <summary>
        /// Create a vita site from the json values, read from the web service
        /// </summary>
        /// <param name="j">Must be Parsed already</param>
        public C_CalendarEntry(JsonValue j, int siteid)
        {
            //WorkShifts = new List<C_WorkShift>();
            OpenTime = new C_HMS(8, 0, 0);
            CloseTime = new C_HMS(17, 0, 0);
            SiteID = siteid;

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

            if (j.ContainsKey(N_OpenTime))
                OpenTime = Tools.JsonProcessTime(j[N_OpenTime], new C_HMS(8, 0, 0));

            if (j.ContainsKey(N_CloseTime))
                CloseTime = Tools.JsonProcessTime(j[N_CloseTime], new C_HMS(17, 0, 0));
        }

        public string ToJson()
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(SiteID, N_SiteID);
            jb.Add(Date, N_Date);
            jb.Add(!SiteIsOpen, N_IsClosed);
            jb.Add(OpenTime, N_OpenTime);
            jb.Add(CloseTime, N_CloseTime);
            string res = jb.ToString();

            return res;
		}

        public static bool Overlap(List<C_CalendarEntry> ceList)
        {
            bool res = false;
            for (int ceix = 0; ceix != ceList.Count; ceix++)
            {
                C_CalendarEntry ce = ceList[ceix];

                // with this one, see if any other entry overlaps
                for (int cetix = 0; cetix != ceList.Count; cetix++)
                {
                    C_CalendarEntry cet = ceList[cetix];

                    if (ceix != cetix)
                    {
                        res = ((ce.OpenTime >= cet.OpenTime) && (ce.OpenTime < cet.CloseTime))
                            || ((ce.CloseTime > cet.OpenTime) && (ce.CloseTime <= cet.CloseTime));
                    }
                    if (res)
                        break;
                }
                if (res)
                    break;
            }

            return res;
        }


        public static int CompareByDate(C_CalendarEntry ce1, C_CalendarEntry ce2) => ce1.Date.CompareTo(ce2.Date);
    }
}
