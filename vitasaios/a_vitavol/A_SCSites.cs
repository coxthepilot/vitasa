using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_SCSites")]
    public class A_SCSites : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        Button B_Settings;
        Button B_Logout;
        ListView LV_Sites;

        C_PersistentSettings Settings;

        C_ListViewHelper<C_SiteCoordinated> SitesListViewHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.SCSites);

            B_Logout = FindViewById<Button>(Resource.Id.B_Logout);
            B_Settings = FindViewById<Button>(Resource.Id.B_EditSettings);
            LV_Sites = FindViewById<ListView>(Resource.Id.LV_Sites);

            C_Common.SetViewColors(this, Resource.Id.V_SCSites);
            B_Logout.SetBackgroundColor(C_Common.LogoutButton);

            Settings = new C_PersistentSettings(this);

            B_Logout.Click += (sender, e) =>
            {
                Global.LoggedInUserId = -1;
                Settings.UserEmail = "";
                Settings.UserPassword = "";
                Settings.Save();

                StartActivity(new Intent(this, typeof(MainActivity)));
            };

            B_Settings.Click += (sender, e) =>
            {
                Global.ViewCameFrom = E_ViewCameFrom.SCOptions;
                StartActivity(new Intent(this, typeof(A_VolEditSettings)));
            };

            SitesListViewHelper = new C_ListViewHelper<C_SiteCoordinated>(this, LV_Sites, LoggedInUser.SitesCoordinated);
            SitesListViewHelper.GetTextLabel += (sender, args) =>
            {
                return args.Item.Name;
            };
            LV_Sites.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) => 
            {
                int scix = e.Position;
                C_SiteCoordinated sc = LoggedInUser.SitesCoordinated[scix];

                Global.SelectedSiteSlug = sc.Slug;
                Global.SelectedSiteName = sc.Name;

                Global.ViewCameFrom = E_ViewCameFrom.SCSites;
                StartActivity(new Intent(this, typeof(A_SCSite)));
            };
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(MainActivity)));
    }
}
