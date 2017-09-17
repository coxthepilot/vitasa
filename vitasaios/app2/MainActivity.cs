using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using System;
using System.Collections.Generic;
using System.Json;

using zsquared;

namespace app2
{
    [Activity(Label = "app2", MainLauncher = true)]
    public class MainActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			// only needed once when the app starts; this lets us handle the certificate from abandonedfactory.net
			C_Vita.SetupCertificateHandling();

			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.Main);

            EditText TB_Email = FindViewById<EditText>(Resource.Id.TB_Email);
			EditText TB_Password = FindViewById<EditText>(Resource.Id.TB_Password);

			Button B_Login = FindViewById<Button>(Resource.Id.B_Login);

			B_Login.Click += async (sender, e) => 
			{
                var sp = GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);
                //var editor = sp.Edit(); 
                //editor.PutString("email", TB_Email.Text);
                //editor.Commit();

                string t_email = sp.GetString("email", "");


				C_VitaUser user = await C_Vita.PerformLogin(TB_Email.Text, TB_Password.Text);


                string s_global = null;
                try { s_global = Intent.Extras.GetString(C_Global.Name_Global); }
                catch {}
				if (s_global == null)
                    s_global = "{}";
                JsonValue jv_global = JsonValue.Parse(s_global);
                C_Global Global = new C_Global(jv_global)
                {
                    LoggedInUser = user
                };

                bool success = await Global.GetAllSites();


                // go to screen to show more stuff
                var stuffIntent = new Intent(this, typeof(Activity1));
				s_global = Global.GetJson();
				stuffIntent.PutStringArrayListExtra(C_Global.Name_Global, new List<string>() { s_global });
			    StartActivity(stuffIntent);
			};
		}
    }
}

