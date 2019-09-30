using System;
using Android.App;
using Android.Content;
using Android.Media;
using Android.Util;
using Android.OS;

using Android.Support.V4.App;

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
            var gmnot = message.GetNotification();
            if (gmnot != null)
            {
                string gmnotb = gmnot.Body;

                if (gmnotb != null)
                {
					Log.Debug(TAG, "Notification Message Body: " + message.GetNotification().Body);
					SendNotification(message);
				}
            }
		}

        void SendNotification(RemoteMessage rmessage)
        {
            RemoteMessage.Notification notif = rmessage.GetNotification();
            string messageBody = notif.Body;

            if (Build.VERSION.SdkInt < BuildVersionCodes.O)
            {
                // Notification channels are new in API 26 (and not a part of the
                // support library). There is no need to create a notification 
                // channel on older versions of Android.
                return;
            }

            const string CHANNEL_ID = "local_notification";
            const int NOTIFICATION_ID = 1000;

            var name = Resources.GetString(Resource.String.channel_name);
            var description = GetString(Resource.String.channel_description);
            var channel = new NotificationChannel(CHANNEL_ID, name, NotificationImportance.Default)
            {
                Description = description
            };

            var notificationManager = (NotificationManager)GetSystemService(NotificationService);
            notificationManager.CreateNotificationChannel(channel);

            NotificationCompat.Builder builder = new NotificationCompat.Builder(this, CHANNEL_ID)
                .SetAutoCancel(true)
                .SetContentTitle("VITA SA")
                .SetContentText(messageBody)
                .SetSmallIcon(Resource.Drawable.vitasaicon);

            // Build the notification:
            Notification notification = builder.Build();

            // Publish the notification:
            notificationManager.Notify(NOTIFICATION_ID, notification);
        }

        public override void HandleIntent(Intent p0)
        {
			base.HandleIntent(p0);

			if (p0.Extras != null)
			{
                string body = p0.GetStringExtra("gcm.notification.body");
                //Log.Debug("VITA Extras Intent", "body: " + body);
				string id = p0.GetStringExtra("google.message_id");
				//Log.Debug("VITA Extras Intent", "id: " + body);
				if ((body != null) && (id != null))
                {

                    var sharedPreferences = GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);
                    var editor = sharedPreferences.Edit();
                    editor.PutString("firebase_message", body);
                    editor.PutString("firebase_messageid", id);
                    editor.Commit();
                }
            }
        }
    }
}