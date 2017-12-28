using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Content.Res;
using Android.Webkit;

using System;
using System.Collections.Generic;
using System.Json;
using System.IO;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: About this App")]
    public class A_About : Activity
    {
        C_Global Global;

		WebView WV_About;
        TextView L_Bytes;
        TextView L_Version;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.About);

            IList<string> alist = this.Intent.GetStringArrayListExtra("global");

			WV_About = FindViewById<WebView>(Resource.Id.WV_About_About);
            L_Bytes = FindViewById<TextView>(Resource.Id.L_Bytes);
            L_Version = FindViewById<TextView>(Resource.Id.L_Version);

            L_Bytes.Text = Global.BytesReceived.ToString("N0");

            string version = Application.Context.PackageManager.GetPackageInfo(Application.Context.PackageName, 0).VersionName;
            L_Version.Text = version;

			string content;
			AssetManager assets = Assets;
			using (StreamReader sr = new StreamReader(assets.Open("about.htm")))
			{
				content = sr.ReadToEnd();
			}

			WV_About.LoadData(content, "text/html", "UTF-8");
		}
    }
}
