using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminUserSites")]
    public class A_AdminUserSites : Activity
    {
        C_Global Global;

        ProgressBar PB_Busy;
        Button B_Save;
        ListView LV_Sites;

        bool Dirty;

        List<C_SiteCoordinated> SitesCoordinated;
        C_ListViewHelper<C_SiteCoordinated> SitesCoordinatedListViewHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            SetContentView(Resource.Layout.AdminUserSites);

            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            LV_Sites = FindViewById<ListView>(Resource.Id.LV_Sites);

            C_Common.SetViewColors(this, Resource.Id.V_AdminUserSites);

            Dirty = false;

            B_Save.Click += (sender, e) => 
            {
                List<C_SiteCoordinated> sclist = new List<C_SiteCoordinated>();
                foreach (C_SiteCoordinated sc in SitesCoordinated)
                    if (sc.Include)
                        sclist.Add(sc);
                Global.SelectedUserTemp.SitesCoordinated = sclist;

                StartActivity(new Intent(this, typeof(A_AdminUser)));
            };

            PB_Busy.Visibility = Android.Views.ViewStates.Visible;

            Task.Run(async () =>
            {
                List<C_VitaSite> sites = await Global.FetchAllSites();

                SitesCoordinated = new List<C_SiteCoordinated>();

                foreach (C_VitaSite s in sites)
                {
                    // build a new entry for this site
                    C_SiteCoordinated sc = new C_SiteCoordinated(s);

                    // find out if this user coordinates this site
                    var ou = Global.SelectedUserTemp.SitesCoordinated.Where(scx => scx.SiteId == s.id);
                    sc.Include = ou.Any();

                    SitesCoordinated.Add(sc);
                }

                void p()
                {
                    PB_Busy.Visibility = Android.Views.ViewStates.Gone;

                    SitesCoordinatedListViewHelper = new C_ListViewHelper<C_SiteCoordinated>(this, LV_Sites, SitesCoordinated);
                    SitesCoordinatedListViewHelper.GetTextLabel += (sender, args) =>
                    {
                        C_SiteCoordinated sc = args.Item;
                        return sc.Name;
                    };
                    SitesCoordinatedListViewHelper.GetDetailTextLabel += (sender, args) =>
                    {
                        C_SiteCoordinated sc = args.Item;
                        C_VitaSite s = Global.GetSiteFromSlugNoFetch(sc.Slug);
                        return s.Street + ", " + s.City + " " + s.State;
                    };
                    SitesCoordinatedListViewHelper.IncludeSwitch += (object sender, ListAdapterEventArgs<C_SiteCoordinated> args) => 
                    {
                        C_SiteCoordinated sc = args.Item;
                        return sc.Include;
                    };
                    SitesCoordinatedListViewHelper.SwitchValueChanged += (object sender, ListAdapterEventArgs<C_SiteCoordinated> args) => 
                    {
                        args.Item.Include = args.SwitchState;
                        Global.SelectedUserTemp.Dirty = true;
                        Dirty = true;
                    };
                    LV_Sites.Adapter = SitesCoordinatedListViewHelper;
                }
                RunOnUiThread(p);
            });
        }

        public override void OnBackPressed()
        {
            if (!Dirty)
            {
                StartActivity(new Intent(this, typeof(A_AdminUser)));
                return;
            }

            C_MessageBox mbox = new C_MessageBox(this,
                "Changes",
                "Changes were made. Save?",
                 E_MessageBoxButtons.YesNoCancel);
            mbox.Show();
            mbox.Dismissed += (object sender, C_MessageBoxEventArgs args) => 
            {
                if (args.Result == E_MessageBoxResults.Cancel)
                    return;

                if (args.Result == E_MessageBoxResults.No)
                {
                    StartActivity(new Intent(this, typeof(A_AdminUser)));
                    return;
                }

                List<C_SiteCoordinated> sclist = new List<C_SiteCoordinated>();
                foreach (C_SiteCoordinated sc in SitesCoordinated)
                    if (sc.Include)
                        sclist.Add(sc);
                Global.SelectedUserTemp.SitesCoordinated = sclist;
            };
        }
    }
}
