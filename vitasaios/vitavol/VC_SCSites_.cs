using System;
using UIKit;
using zsquared;

namespace vitavol
{
    public partial class VC_SCSites : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_TableSource<C_SiteCoordinated> SitesTableSource;
        C_PersistentSettings Settings;

        public VC_SCSites (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SCSitesToMain", this);

            B_Logout.TouchUpInside += (sender, e) =>
            {
                Global.LoggedInUserId = -1;

                Settings.UserEmail = "";
                Settings.UserPassword = "";

                PerformSegue("Segue_SCSitesToMain", this);
            };

            B_Settings.TouchUpInside += (sender, e) => 
            {
                Global.ViewCameFrom = E_ViewCameFrom.SCOptions;
                PerformSegue("Segue_SCSitesToVolEditSettings", this);
            };

            B_VolList.TouchUpInside += (object sender, EventArgs e) => 
            {
                PerformSegue("Segue_SCSitesToSCVolList", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            LoggedInUser.SitesCoordinated.Sort(C_SiteCoordinated.CompareByNameToLower);

            SitesTableSource = new C_TableSource<C_SiteCoordinated>(this, TV_Sites, LoggedInUser.SitesCoordinated);
            SitesTableSource.GetTextLabel += (object sender, C_TableSource<C_SiteCoordinated>.TableSourceEventArgs<C_SiteCoordinated> args) =>
            {
                C_SiteCoordinated wi = args.Item;
                return wi.Name;
            };
            SitesTableSource.Selected += (object sender, C_TableSource<C_SiteCoordinated>.TableSourceEventArgs<C_SiteCoordinated> args) =>
            {
                Global.SelectedSiteSlug = args.Item.Slug;
                Global.SelectedSiteName = args.Item.Name;

                Global.ViewCameFrom = E_ViewCameFrom.SCSites;
                PerformSegue("Segue_SCSitesToSCVolHours", this);
                //PerformSegue("Segue_SCSitesToSCSite", this);
            };
            TV_Sites.Source = SitesTableSource;
            TV_Sites.ReloadData();
        }
    }
}