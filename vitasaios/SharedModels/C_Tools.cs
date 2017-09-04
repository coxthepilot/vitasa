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

	}

}
