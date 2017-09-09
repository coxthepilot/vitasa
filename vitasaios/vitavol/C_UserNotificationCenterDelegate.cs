using System;
using UserNotifications;

namespace zsquared
{
	public class UserNotificationCenterDelegate : UNUserNotificationCenterDelegate
	{
		// this call happens when the OS is about to present a notification
		public override void WillPresentNotification(UNUserNotificationCenter center, UNNotification notification, System.Action<UNNotificationPresentationOptions> completionHandler)
		{
			// Do something with the notification
			Console.WriteLine("Active Notification: {0}", notification);

			// Tell system to display the notification anyway or use
			// `None` to say we have handled the display locally.
			completionHandler(UNNotificationPresentationOptions.Alert);
		}
	}
}
