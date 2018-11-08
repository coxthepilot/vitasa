using System.IO;

using Android.App;
using Android.OS;
using Android.Content.Res;
using Android.Webkit;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "VITA: Before You Go")]
    public class A_BeforeYouGo : Activity
    {
        C_Global Global;

        WebView WV_BeforeYouGo;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            SetContentView(Resource.Layout.BeforeYouGo);

            WV_BeforeYouGo = FindViewById<WebView>(Resource.Id.WV_BeforeYouGo);

            C_Common.SetViewColors(this, Resource.Id.V_BeforeYouGo);

            string content;
            AssetManager assets = Assets;
            using (StreamReader sr = new StreamReader(assets.Open("beforeyougo.htm")))
            {
                content = sr.ReadToEnd();
            }

            WV_BeforeYouGo.LoadData(content, "text/html", "UTF-8");
        }
    }
}
