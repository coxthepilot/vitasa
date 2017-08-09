using System;
using Foundation;
using System.Threading.Tasks;
using Xamarin.Forms;
using UIKit;

namespace zsquared
{
    public class Tools
    {
        public Tools()
        {
        }

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

        public static void MessageBoxOK(string title, string message)
        {
			UIAlertView alert = new UIAlertView()
			{
				Title = title,
				Message = message
			};
			alert.AddButton("OK");
			alert.Show();            
        }

		//public static bool MessageBoxYN(string title, string message)
		//{
  //          bool res = false;

  //          var alert = UIAlertController.Create(title, message, UIAlertControllerStyle.ActionSheet);
  //          //alert.AddAction(UIAlertAction.Create("Ok", UIAlertActionStyle.Cancel,
  //          //alert.AddAction(UIAlertAction.Create("Yes", UIAlertActionStyle.Cancel, (UIAlertAction obj) => {};);
                            
  //          PresentViewController(alert, animated: true, completionHandler: null);

  //          return res;
		//	//UIAlertView alert = new UIAlertView()
		//	//{
		//	//	Title = title,
		//	//	Message = message
		//	//};
		//	//alert.AddButton("Yes");
		//	//alert.AddButton("No");
		//	//alert.Show();
		//}

		public Task<bool> ShowAlert(string title, string message)
		{
			var tcs = new TaskCompletionSource<bool>();

            UIApplication.SharedApplication.InvokeOnMainThread(new Action(() =>
			{
				UIAlertView alert = new UIAlertView(title, message, null, "Cancel", "OK");
				alert.Clicked += (sender, buttonArgs) => tcs.SetResult(buttonArgs.ButtonIndex != alert.CancelButtonIndex);
				alert.Show();
			}));

			return tcs.Task;
		}



		public static DateTime NSDateToDateTimeXX(NSDate date)
		{
			DateTime reference = new DateTime(2001, 1, 1, 0, 0, 0);
			DateTime currentDate = reference.AddSeconds(date.SecondsSinceReferenceDate);
			DateTime localDate = currentDate.ToLocalTime();
			return localDate;
		}

	}

}
