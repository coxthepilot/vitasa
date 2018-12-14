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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteCoord")]
    public class A_AdminSiteCoord : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        List<C_VitaUser> AllSiteCoordinators;

        TextView L_SiteName;
        Button B_Done;
        ListView LV_Coordinators;
        ProgressBar PB_Busy;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSiteCoord);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            B_Done = FindViewById<Button>(Resource.Id.B_Save);
            LV_Coordinators = FindViewById<ListView>(Resource.Id.LV_Coordinators);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteCoord);

            B_Done.Click += (sender, e) =>
            {
                SaveSiteCoord();

                StartActivity(new Intent(this, typeof(A_AdminSite)));
            };

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);
            Task.Run(async () =>
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                // filter the list to only site coordinators
                AllSiteCoordinators = users.Where(u => u.HasSiteCoordinator).ToList();

                // set the flag state for each user; set to true if that user is a site coord for our site
                foreach (C_VitaUser u in AllSiteCoordinators)
                {
                    //bool found = Global.SelectedSiteTemp.SiteCoordinatorsIds.Contains(u.id);
                    var ou = Global.SelectedSiteTemp.SiteCoordinators.Where(sc => sc.UserId == u.id);
                    u.IV_Flag = u.Flag = ou.Any();
                }

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    AllSiteCoordinators.Sort(C_VitaUser.CompareByNameToLower);

                    C_ListViewHelper<C_VitaUser> la = new C_ListViewHelper<C_VitaUser>(this, LV_Coordinators, AllSiteCoordinators);
                    la.GetTextLabel += (sender, args) =>
                    {
                        C_VitaUser sc = args.Item;
                        return sc.Name;
                    };
                    la.GetDetailTextLabel += (sender, args) =>
                    {
                        C_VitaUser sc = args.Item;
                        return sc.Phone + " " + sc.Email;
                    };
                    la.IncludeSwitch += (object sender, ListAdapterEventArgs<C_VitaUser> args) => 
                    {
                        C_VitaUser sc = args.Item;

                        return sc.Flag;
                    };
                    la.SwitchValueChanged += (object sender, ListAdapterEventArgs<C_VitaUser> args) => 
                    {
                        C_VitaUser sc = args.Item;
                        sc.Flag = args.SwitchState;
                    };
                }
                RunOnUiThread(p);
            });
        }

        public override void OnBackPressed()
        {
            if (!UIIsEnabled)
                return;

            SaveSiteCoord();

            StartActivity(new Intent(this, typeof(A_AdminSite)));
        }

        private void SaveSiteCoord()
        {
            // get the list from the users that have the flag set
            List<C_VitaUser> flaggedUsers = AllSiteCoordinators.Where(u => u.Flag).ToList();

            Global.SelectedSiteTemp.SiteCoordinators = new List<C_SiteCoordinator>();
            foreach (C_VitaUser fu in flaggedUsers)
            {
                C_SiteCoordinator sc = new C_SiteCoordinator(fu);
                Global.SelectedSiteTemp.SiteCoordinators.Add(sc);
            }

            // go through the list of users to adjust sites coordinated
            foreach (C_VitaUser user in Global.UserCache)
            {
                if (!user.HasSiteCoordinator)
                    continue;

                var ou = Global.SelectedSiteTemp.SiteCoordinators.Where(sc => sc.UserId == user.id);
                if (ou.Any())
                {
                    // this site SHOULD be in the list
                    var ou1 = user.SitesCoordinated.Where(sc => sc.SiteId == Global.SelectedSiteTemp.id);
                    if (!ou1.Any())
                    {
                        // it is not in the list, add it
                        C_SiteCoordinated sc = new C_SiteCoordinated(Global.SelectedSiteTemp);
                        user.SitesCoordinated.Add(sc);
                    }
                }
                else
                {
                    // this site should NOT be in the llist
                    var ou1 = user.SitesCoordinated.Where(sc => sc.SiteId == Global.SelectedSiteTemp.id);
                    if (ou1.Any())
                    {
                        C_SiteCoordinated sc = ou1.First();
                        int ix = user.SitesCoordinated.IndexOf(sc);
                        user.SitesCoordinated.RemoveAt(ix);
                    }
                }
            }

            Global.SelectedSiteTemp.Dirty = true;
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            B_Done.Enabled = en;
            LV_Coordinators.Enabled = en;
        }
    }
}
