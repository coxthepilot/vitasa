using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using UIKit;

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
                id = j[N_ID];

			if (j.ContainsKey(N_SiteID))
                SiteID = j[N_SiteID];

            if (j.ContainsKey(N_Date))
                Date = new C_YMD((string)j[N_Date]);

            if (j.ContainsKey(N_OpenTime))
            {
                var jv = j[N_OpenTime];
                if (jv == null)
                {
                    OpenTime = new C_HMS(0, 0, 0);
                }
                else if (jv.JsonType == JsonType.String)
                {
                    OpenTime = new C_HMS((string)jv);
                }
			}

            if (j.ContainsKey(N_CloseTime))
            {
				var jv = j[N_CloseTime];
				if (jv == null)
				{
                    CloseTime = new C_HMS(0, 0, 0);
				}
				else if (jv.JsonType == JsonType.String)
				{
					CloseTime = new C_HMS((string)jv);
				}
			}

            if (j.ContainsKey(N_IsClosed))
            {
                var jv = j[N_IsClosed];
                if (jv == null)
                    IsClosed = true;
                else if (jv.JsonType == JsonType.Boolean)
                    IsClosed = jv;
                else
                {
                    try
                    {
                        string bs = j[N_IsClosed];
                        IsClosed = bs.ToLower() == "true";
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }

            if (j.ContainsKey(N_NumEFilers))
            {
                var jv = j[N_NumEFilers];
                if (jv == null)
                    NumEFilers = 0;
                else if (jv.JsonType == JsonType.Number)
                    NumEFilers = jv;
                else
                {
					try 
                    {
						string ns = j[N_NumEFilers];
						NumEFilers = Convert.ToInt32(ns); 
                    }
                    catch (Exception e)
                    { 
                        Console.WriteLine(e.Message);
                    }
				}

            }
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

		//public static async Task<List<C_CalendarEntry>> FetchCalendarEntries(
  //      	string token,       // token
  //      	int siteid,         // site to get calendar entries for, -1 is all
  //          C_YMD from,         // from date
  //          C_YMD to            // to date
  //      )
		//{
		//	//vitavol.AppDelegate myAppDelegate = (vitavol.AppDelegate)UIApplication.SharedApplication.Delegate;
		//	//C_TestingDB testingDB = myAppDelegate.TestingDB;
		//	//if (testingDB != null)
		//	//{
		//	//	List<C_CalendarEntry> res = new List<C_CalendarEntry>();

		//	//	foreach (C_CalendarEntry ce in testingDB.CalendarEntries)
		//	//	{
		//	//		if (
		//	//			   ((from == null) || (from >= ce.Date))
  // //                     && ((to == null) || (to <= ce.Date))
		//	//			&& ((siteid == -1) || (siteid == ce.SiteID)))
		//	//			res.Add(ce);
		//	//	}

		//	//	return res;
		//	//}

		//	string sitesUrl = C_Vita.VitaCoreUrl + "/sites";
		//	// Create an HTTP web request using the URL:
		//	HttpWebRequest request = (HttpWebRequest)WebRequest.Create(new Uri(sitesUrl));
		//	//request.Headers.Add(HttpRequestHeader.Accept, "application/json");
		//	request.Accept = "application/json";
		//	//request.ContentType = "application/json";
		//	request.Method = "GET";

		//	// Send the request to the server and wait for the response:
		//	using (WebResponse response = await request.GetResponseAsync())
		//	{
		//		// Get a stream representation of the HTTP web response:
		//		using (Stream stream = response.GetResponseStream())
		//		{
		//			// todo: make sure they responded with an application/json response
		//			// todo: make sure we got response code 200 (ok)

		//			// Use this stream to build a JSON document object:
		//			JsonValue jsonDoc = await Task.Run(() => JsonValue.Load(stream));
		//			//Console.Out.WriteLine("Response: {0}", jsonDoc.ToString());

		//			JsonValue jv = jsonDoc;
		//			if (jsonDoc is JsonObject)
		//			{
		//				try { jv = JsonValue.Parse(jsonDoc); }
		//				catch (Exception e)
		//				{
		//					Console.WriteLine(e.Message);
		//				}
		//			}

		//			// Return the JSON document:

		//			//List<C_VitaSite> siteslist = ImportSites(jv);

		//			return null;
		//		}
		//	}
		//}


		//public static async Task<List<C_CalendarEntry>> FetchCalendarAllSitesInDateRange(C_YMD from, C_YMD to)
  //      {
		//	//vitavol.AppDelegate myAppDelegate = (vitavol.AppDelegate)UIApplication.SharedApplication.Delegate;
		//	//C_TestingDB testingDB = myAppDelegate.TestingDB;
		//	//if (testingDB != null)
		//	//{
		//	//	List<C_CalendarEntry> res = new List<C_CalendarEntry>();

  // //             foreach (C_CalendarEntry su in testingDB.CalendarEntries)
		//	//	{
		//	//		if (
		//	//			   ((from == null) || (su.Date >= from))
		//	//			&& ((to == null) || (su.Date <= to))
		//	//		)
		//	//			res.Add(su);
		//	//	}

		//	//	return res;
		//	//}

		//	throw new ApplicationException("not implemented");


		//	//string sitesUrl = C_Vita.VitaCoreUrl + "/calendar/";
  // //         // todo: include the date range

		//	//// Create an HTTP web request using the URL:
		//	//HttpWebRequest request = (HttpWebRequest)WebRequest.Create(new Uri(sitesUrl));
		//	//request.Accept = "application/json";
		//	////request.ContentType = "application/json";
		//	//request.Method = "GET";

		//	//// Send the request to the server and wait for the response:
		//	//using (WebResponse response = await request.GetResponseAsync())
		//	//{
		//	//	// Get a stream representation of the HTTP web response:
		//	//	using (Stream stream = response.GetResponseStream())
		//	//	{
		//	//		// todo: make sure they responded with an application/json response
		//	//		// todo: make sure we got response code 200 (ok)

		//	//		// Use this stream to build a JSON document object:
		//	//		JsonValue jsonDoc = await Task.Run(() => JsonValue.Load(stream));
		//	//		//Console.Out.WriteLine("Response: {0}", jsonDoc.ToString());

		//	//		JsonValue jv = jsonDoc;
		//	//		if (jsonDoc is JsonObject)
		//	//		{
		//	//			try { jv = JsonValue.Parse(jsonDoc); }
		//	//			catch (Exception e)
		//	//			{
		//	//				Console.WriteLine(e.Message);
		//	//			}
		//	//		}

		//	//		// Return the JSON document:

		//	//		List<C_CalendarEntry> siteslist = ImportCalendar(jv);

		//	//		return siteslist;
		//	//	}
		//	//}
		//}

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
