using Foundation;
using System;
using System.Threading.Tasks;
using Xamarin.Forms;
using UIKit;
using System.Json;
using System.Collections.Generic;

namespace zsquared
{
    public static class C_NSDateConversions
    {

		static readonly DateTime reference = new DateTime(2001, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);

		public static DateTime NSDateToDateTime(NSDate date)
		{
			var utcDateTime = reference.AddSeconds(date.SecondsSinceReferenceDate);
			var dateTime = utcDateTime.ToLocalTime();
			return dateTime;
		}

		public static NSDate DateTimeToNSDate(DateTime datetime)
		{
			var utcDateTime = datetime.ToUniversalTime();
			var date = NSDate.FromTimeIntervalSinceReferenceDate((utcDateTime - reference).TotalSeconds);
			return date;
		}

		public static NSDate YMDToNSDate(C_YMD ymd)
		{
			DateTime datetime = ymd.ToDateTime();
			var utcDateTime = datetime.ToUniversalTime();
			var date = NSDate.FromTimeIntervalSinceReferenceDate((utcDateTime - reference).TotalSeconds);
			return date;
		}

        public static NSDate BuildNSDateFromDate(C_YMD ymd)
        {
            NSDate res = DateTimeToNSDate(ymd.ToDateTime());

            return res;
        }

		public static NSDate BuildNSDateFromTime(string time)
		{
			NSDate res = null;

			int hours = 0;
			int minutes = 0;
			string[] timeSplit = time.Split(new char[] { ':' });
			if (timeSplit.Length > 0)
			{
				try { hours = Convert.ToInt32(timeSplit[0]); }
				catch { }
			}
			if (timeSplit.Length > 1)
			{
				try { minutes = Convert.ToInt32(timeSplit[1]); }
				catch { }
			}

			C_YMD now = C_YMD.Now;
			DateTime dt = new DateTime(now.Year, now.Month, now.Day, hours, minutes, 0);
			res = DateTimeToNSDate(dt);

			return res;
		}    
    }
}
