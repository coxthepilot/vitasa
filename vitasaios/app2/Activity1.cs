
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Json;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace app2
{
    [Activity(Label = "Activity1")]
    public class Activity1 : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			// only needed once when the app starts; this lets us handle the certificate from abandonedfactory.net
			C_Vita.SetupCertificateHandling();

			// Create your application here
			SetContentView(Resource.Layout.Layout1);
			// Create your application here

			string s_global = Intent.Extras.GetString(C_Global.Name_Global);
			JsonValue jv_global = JsonValue.Parse(s_global);
			C_Global Global = new C_Global(jv_global);

            //IList<string> x = Intent.Extras.GetStringArrayList("loginstuff");

            TextView L_Email = FindViewById<TextView>(Resource.Id.L_Email);
            TextView L_Password = FindViewById<TextView>(Resource.Id.L_Password);

            L_Email.Text = Global.LoggedInUser.Name;
            L_Password.Text = "password";
		}
    }
}
