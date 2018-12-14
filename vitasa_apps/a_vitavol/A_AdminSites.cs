using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSites")]
    public class A_AdminSites : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        Button B_NewSite;
        Spinner SP_WhichSites;
        ListView LV_Sites;
        //ProgressBar PB_Busy;
        C_BusyBox BusyBox;

        List<E_SiteType> SiteTypes;
        C_ListViewHelper<C_VitaSite> SitesAdapter;
        C_SPinnerHelper<E_SiteType> SitesTypeSpinner;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSites);

            B_NewSite = FindViewById<Button>(Resource.Id.B_NewSite);
            SP_WhichSites = FindViewById<Spinner>(Resource.Id.SP_WhichSite);
            LV_Sites = FindViewById<ListView>(Resource.Id.LV_Sites);
            //PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            BusyBox = new C_BusyBox(this, "Loading...");

            C_Common.SetViewColors(this, Resource.Id.V_AdminSites);

            B_NewSite.Click += (sender, e) => 
            {
                Global.SelectedSiteName = null;
                Global.SelectedSiteSlug = null;
                Global.SelectedSiteTemp = null;
                StartActivity(new Intent(this, typeof(A_AdminSite)));
            };

            LV_Sites.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) =>  
            {
                C_VitaSite site = SitesAdapter.Items[e.Position];
                Global.SelectedSiteName = site.Name;
                Global.SelectedSiteSlug = site.Slug;
                Global.SelectedSiteTemp = null;
                StartActivity(new Intent(this, typeof(A_AdminSite)));
            };

            SiteTypes = Tools.EnumToList<E_SiteType>();
            SitesTypeSpinner = new C_SPinnerHelper<E_SiteType>(this, SP_WhichSites, SiteTypes);
            SitesTypeSpinner.SetValue(E_SiteType.All);
            SitesTypeSpinner.ItemSelected += (object sender, SpinnerEventArgs<E_SiteType> args) => 
            {
                E_SiteType t = args.Item;

                List<C_VitaSite> ourSites = Global.GetAllSitesNoFetch();
                var ou = ourSites.Where(s => (t == E_SiteType.All) || (s.SiteType == t));
                List<C_VitaSite> sitesList = ou.ToList();
                sitesList.Sort(C_VitaSite.CompareSitesByNameAscending);

                StartLV(sitesList);
            };

            //PB_Busy.Visibility = ViewStates.Visible;
            if (!Global.AllSitesFetched)
                BusyBox.Show();
            EnableUI(false);

            Task.Run(async () =>
            {
                List<C_VitaSite> ourSites = await Global.FetchAllSites(LoggedInUser.Token);
                ourSites.Sort(C_VitaSite.CompareSitesByNameAscendingLower);

                void p()
                {
                    //PB_Busy.Visibility = ViewStates.Gone;
                    BusyBox.Hide();
                    EnableUI(true);

                    StartLV(ourSites);
                }
                RunOnUiThread(p);
            });
        }

        private void StartLV(List<C_VitaSite> siteList)
        {
            SitesAdapter = new C_ListViewHelper<C_VitaSite>(this, LV_Sites, siteList);
            SitesAdapter.GetTextLabel += (sender, args) =>
            {
                C_VitaSite site = args.Item;
                return site.Name;
            };
            SitesAdapter.GetDetailTextLabel += (sender, args) =>
            {
                C_VitaSite site = args.Item;
                string ms = site.SiteType == E_SiteType.Mobile ? " [Mobile]" : "";
                return site.Street + ", " + site.City + " " + site.State + ms;
            };
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            B_NewSite.Enabled = en;
            SP_WhichSites.Enabled = en;
            LV_Sites.Enabled = en;
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(A_AdminMenu)));
        }
    }
}
