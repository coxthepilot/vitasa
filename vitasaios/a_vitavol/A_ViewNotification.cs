using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    // This activity is only used to show the just received notification. The notification can be when
    //  the app is in the foreground OR in background (the sending agent is required to set click_activity to A_ViewNotification

    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "VITA: View Notification")]
    public class A_ViewNotification : Activity
    {
		string Body;
		DateTime Time;

        TextView L_Body;
        TextView L_Time;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            SetContentView(Resource.Layout.ViewNotification);

            L_Body = FindViewById<TextView>(Resource.Id.L_Body);
            L_Time = FindViewById<TextView>(Resource.Id.L_Time);

            C_Common.SetViewColors(this, Resource.Id.V_ViewNotification);

            // the following can be user to see if we were launched from a notification event
            if (Intent.Extras != null)
			{
                if (Intent.Extras.ContainsKey("message"))
                {
                    Bundle b = Intent.Extras.GetBundle("message");

                    Body = b.GetString("body");
					long time = b.GetLong("time");
                    Time = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
                    TimeSpan ts = new TimeSpan(time * 10000);
                    Time = Time.Add(ts);
				}
			}

            L_Body.Text = Body;
            L_Time.Text = Time.ToString();
		}
    }
}
