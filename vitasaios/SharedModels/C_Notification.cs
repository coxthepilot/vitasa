using System;
using System.Json;
using System.Collections.Generic;
using System.Globalization;

namespace zsquared
{
    public class C_Notification
    {
        public string id;
        public string From;
        public DateTime DateAndTime;
        public string Body;

        public static readonly string N_ID = "id";
        public static readonly string N_From = "from";
        public static readonly string N_DateAndTime = "datetime";
        public static readonly string N_Body = "body";

        public C_Notification()
        {
        }

        public C_Notification(JsonValue j)
        {
			if (!(j is JsonObject))
				throw new ApplicationException("we can only work with an object");

			if (j.ContainsKey(N_ID))
				id = j[N_ID];

			if (j.ContainsKey(N_From))
				From = j[N_From];

            if (j.ContainsKey(N_DateAndTime))
            {
                string dts = j[N_DateAndTime];

				string[] formats = { "yyyy-MM-dd hh:mm:ss" };

                try { DateAndTime = DateTime.ParseExact(dts, formats, new CultureInfo("en-US"), DateTimeStyles.AssumeLocal); }
                catch (Exception e)
                { 
                    Console.WriteLine(e.Message);
                }
            }

            if (j.ContainsKey(N_Body))
                Body = j[N_Body];
		}

        public static List<C_Notification> ImportNotifications(JsonValue json)
        {
			if (!(json is JsonArray))
				throw new ApplicationException("the sites list must be an array");

			// create the holding place for the results
			List<C_Notification> res = new List<C_Notification>();
			foreach (JsonValue j in json)
			{
				C_Notification vs = new C_Notification(j);
				res.Add(vs);
			}

			return res;
		}
    }
}
