using System;
using Foundation;
using System.Threading.Tasks;
using Xamarin.Forms;
using UIKit;
using System.Json;
using System.Collections.Generic;

namespace zsquared
{
    public static class Tools
    {
        public static T StringToEnum<T>(string v)
        {
            T res = default(T);

			foreach (T ss in Enum.GetValues(typeof(T)))
			{
				if (v == ss.ToString())
				{
					res = ss;
					break;
				}
			}

            return res;
		}

        public enum E_MessageBoxButtons { Ok, YesNo, OkCancel, YesNoCancel }
        public enum E_MessageBoxResults { Ok, Yes, No, Cancel }

        public static Task<E_MessageBoxResults> MessageBox(UIViewController parent, string title, string message, E_MessageBoxButtons buttons)
		{
			var taskCompletionSource = new TaskCompletionSource<E_MessageBoxResults>();

            var alert = UIAlertController.Create(title, message, UIAlertControllerStyle.Alert);
			if (alert.PopoverPresentationController != null)
			{
				alert.PopoverPresentationController.SourceView = parent.View;
				alert.PopoverPresentationController.SourceRect = parent.View.Bounds;
			}

            if ((buttons == E_MessageBoxButtons.Ok) || (buttons == E_MessageBoxButtons.OkCancel))
			    alert.AddAction(UIAlertAction.Create("OK", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.Ok)));

            if ((buttons == E_MessageBoxButtons.YesNo) || (buttons == E_MessageBoxButtons.YesNoCancel))
                alert.AddAction(UIAlertAction.Create("Yes", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.Yes)));

			if ((buttons == E_MessageBoxButtons.YesNo) || (buttons == E_MessageBoxButtons.YesNoCancel))
				alert.AddAction(UIAlertAction.Create("No", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.No)));

            if ((buttons == E_MessageBoxButtons.OkCancel) || (buttons == E_MessageBoxButtons.YesNoCancel))
                alert.AddAction(UIAlertAction.Create("Cancel", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.Cancel)));
            parent.PresentViewController(alert, true, null);

            return taskCompletionSource.Task;
		}

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
			res = Tools.DateTimeToNSDate(dt);

			return res;
		}

        public static int JsonProcessInt(JsonValue jv, int defValue)
        {
            int res = defValue;
            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.Number)
                res = jv;
            else if (jv.JsonType == JsonType.String)
            {
                try
                {
                    string ns = (string)jv;
                    int ix = Convert.ToInt32(ns);
                    res = ix;
                }
                catch 
                {
                    res = defValue;
                }
            }
            return res;
        }

		public static string JsonProcessString(JsonValue jv, string defValue)
		{
			string res = defValue;
            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.String)
				res = jv;
            
			return res;
		}

        public static C_YMD JsonProcessDate(JsonValue jv, C_YMD defValue)
		{
            C_YMD res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.String)
                res = new C_YMD((string)jv);

			return res;
		}

        public static C_HMS JsonProcessTime(JsonValue jv, C_HMS defValue)
		{
			C_HMS res = defValue;

			if (jv == null)
				res = defValue;
			else if (jv.JsonType == JsonType.String)
				res = new C_HMS((string)jv);

			return res;
		}

		public static float JsonProcessFloat(JsonValue jv, float defValue)
		{
			float res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.Number)
				res = (float)jv;
            else if (jv.JsonType == JsonType.String)
            {
                try 
                {
                    string ns = jv;
                    res = Convert.ToSingle(ns);
                }
                catch 
                {
                    res = defValue;
                }
            }

			return res;
		}

		public static bool JsonProcessBool(JsonValue jv, bool defValue)
		{
			bool res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.Boolean)
                res = jv;
            else if (jv.JsonType == JsonType.String)
                res = (string)jv == "true";

			return res;
		}
	}
}
