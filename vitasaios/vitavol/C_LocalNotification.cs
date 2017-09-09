using System;
using UserNotifications;
using Foundation;

[assembly: Xamarin.Forms.Dependency(typeof(zsquared.LocalNotification))]
namespace zsquared
{
	public class LocalNotification : ILocalNotification
	{
		public void ShowNotification(string strNotificationTitle,
									string strNotificationSubtitle,
									string strNotificationDescription,
									string strNotificationIdItem,
									string strDateOrInterval,
									int intervalType,   //intervalType: 1 - set to date | 2 - set to interval
									string extraParameters)
		{
			// create the actual notification
			var notificationContent = new UNMutableNotificationContent()
			{
				Title = strNotificationTitle,
				Subtitle = strNotificationSubtitle,
				Body = strNotificationDescription,
				Badge = Int32.Parse(strNotificationIdItem),
				Sound = UNNotificationSound.Default
			};

			//Set trigger and request.
			var notificationRequestID = strNotificationIdItem;
			UNNotificationRequest notificationRequest = null;

			if (intervalType == 1)
			{
				//Set date for when the notification should go out, assuming a intervalType == 1
				DateTime notificationContentDate = Convert.ToDateTime(strDateOrInterval);

				NSDateComponents notificationContentNSCDate = new NSDateComponents()
				{
					Year = notificationContentDate.Year,
					Month = notificationContentDate.Month,
					Day = notificationContentDate.Day,
					Hour = notificationContentDate.Hour,
					Minute = notificationContentDate.Minute,
					Second = notificationContentDate.Second,
					Nanosecond = (notificationContentDate.Millisecond * 1000000)
				};

				var notificationCalenderTrigger = UNCalendarNotificationTrigger.CreateTrigger(notificationContentNSCDate, false);

				notificationRequest = UNNotificationRequest.FromIdentifier(
					notificationRequestID,
					notificationContent,
					notificationCalenderTrigger);
			}
			else
			{
				var notificationIntervalTrigger = UNTimeIntervalNotificationTrigger.CreateTrigger(
					Int32.Parse(strDateOrInterval),
					false);

				notificationRequest = UNNotificationRequest.FromIdentifier(
					notificationRequestID,
					notificationContent,
					notificationIntervalTrigger);
			}

			//Add the notification request to the OS queue
			UNUserNotificationCenter.Current.AddNotificationRequest(notificationRequest, (err) =>
			{
				if (err != null)
				{
					System.Diagnostics.Debug.WriteLine("Error : " + err);
				}
			});
		}
	}
}
