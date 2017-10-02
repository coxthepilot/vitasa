using System;
using System.Threading.Tasks;

using Android.Content;

using zsquared;

using Android.App;
using Firebase.Iid;
using Android.Util;

namespace FCMClient
{
	[Service]
	[IntentFilter(new[] { "com.google.firebase.INSTANCE_ID_EVENT" })]
	public class MyFirebaseIIDService : FirebaseInstanceIdService
	{
		const string TAG = "VITA FirebaseIIDService";
		public override void OnTokenRefresh()
		{
			var refreshedToken = FirebaseInstanceId.Instance.Token;
			Log.Debug(TAG, "Refreshed token: " + refreshedToken);
			SendRegistrationToServer(refreshedToken);
		}

		void SendRegistrationToServer(string token)
		{
			// we can't send to the server yet since to that we have to have a user that is logged in
			// so, we save in the defaults and let the login process handle that for us
			var sharedPreferences = GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);
			var editor = sharedPreferences.Edit();
			editor.PutString("firebasetoken", token);
			editor.PutString("firebasetoken_updated", "true");
			editor.Commit();

			//just in case this happens when we are actually logged in
            a_vitavol.MyAppDelegate g = (a_vitavol.MyAppDelegate)Application;
            C_Global Global = g.Global;
            if ((Global != null) && (Global.LoggedInUserId != -1))
            {
                C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
                if (user != null)
                {
                    Task.Run(async () => 
                    {
						bool success = await C_Notifications.RegisterNotificationToken(C_Notifications.E_Platform.Android, token, user.Token);
                        if (success)
                        {
							Log.Debug(TAG, "Saved the token");
							editor.PutString("firebasetoken_updated", "false");
							editor.Commit();
						}
                        else
							Log.Debug(TAG, "Unable to save the token");
					});
				}
            }
		}
	}
}
