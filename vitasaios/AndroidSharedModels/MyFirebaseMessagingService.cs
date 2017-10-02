using System;
using Android.App;
using Android.Content;
using Android.Media;
using Android.Util;
using Android.OS;

using Firebase.Messaging;

namespace a_vitavol
{
    // This class is invoked and OnMessageReceived when the app is in the foreground (only)
    //   to take the message and pass it to the view notifications activity.
	[Service]
	[IntentFilter(new[] { "com.google.firebase.MESSAGING_EVENT" })]
	public class MyFirebaseMessagingService : FirebaseMessagingService
	{
		const string TAG = "VITA FirebaseMsgService";
		public override void OnMessageReceived(RemoteMessage message)
		{
			Log.Debug(TAG, "Notification Message Body: " + message.GetNotification().Body);

			SendNotification(message);
		}

        void SendNotification(RemoteMessage rmessage)
        {
            RemoteMessage.Notification notif = rmessage.GetNotification();
            string messageBody = notif.Body;

			Bundle b = new Bundle();
			b.PutString("body", messageBody);
            b.PutLong("time", rmessage.SentTime);

			var intent = new Intent(this, typeof(A_ViewNotification));
			intent.AddFlags(ActivityFlags.ClearTop);
            intent.PutExtra("message", b);
			var pendingIntent = PendingIntent.GetActivity(this, 0, intent, PendingIntentFlags.OneShot);

			var notificationBuilder = new Notification.Builder(this)
				.SetSmallIcon(Resource.Drawable.vitaiconv2)
				.SetContentTitle("VITA Message")
				.SetContentText(messageBody)
				.SetAutoCancel(true)
				.SetContentIntent(pendingIntent);

			var notificationManager = NotificationManager.FromContext(this);
			notificationManager.Notify(0, notificationBuilder.Build());
		}
    }
}