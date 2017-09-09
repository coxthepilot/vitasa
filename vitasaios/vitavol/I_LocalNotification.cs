using System;
namespace zsquared
{
	// create the interface definition of our notification so we can find it in the app to issue a notification
	public interface ILocalNotification
	{

		//void ShowNotification(string strTitle, string strDescription, string idNotification, string strURL);
		void ShowNotification(string strNotificationTitle,
			string strNotificationSubtitle,
			string strNotificationDescription,
			string strNotificationIdItem,
			string strDateOrInterval,
			int intervalType,
			string extraParameters);
	}
}
