using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminUserSites : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaUser SelectedUser;
        C_VitaSite SelectedSite;

        C_TableSource<C_SiteCoordinated> SitesTableSource;

        bool Dirty;

        public VC_AdminUserSites (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedUser = Global.SelectedUserTemp;
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            Dirty = false;

            B_Back.TouchUpInside += (sender, e) => 
            {
                if (!Dirty)
                {
                    PerformSegue("Segue_AdminUserSitesToAdminUser", this);
                    return;
                }

                async void p()
                {
                    E_MessageBoxResults mbres = await MessageBox(this,
                        "Changes",
                        "Changes were made. Save?",
                         E_MessageBoxButtons.YesNoCancel);

                    if (mbres == E_MessageBoxResults.Cancel)
                        return;
                    if (mbres == E_MessageBoxResults.No)
                    {
                        PerformSegue("Segue_AdminUserSitesToAdminUser", this);
                        return;
                    }

                    List<C_SiteCoordinated> sclist = new List<C_SiteCoordinated>();
                    foreach (C_SiteCoordinated sc in SitesTableSource.List)
                        if (sc.Include)
                            sclist.Add(sc);
                    SelectedUser.SitesCoordinated = sclist;

                    PerformSegue("Segue_AdminUserSitesToAdminUser", this);
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                List<C_SiteCoordinated> sclist = new List<C_SiteCoordinated>();
                foreach (C_SiteCoordinated sc in SitesTableSource.List)
                    if (sc.Include)
                        sclist.Add(sc);
                SelectedUser.SitesCoordinated = sclist;

                PerformSegue("Segue_AdminUserSitesToAdminUser", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            AI_Busy.StartAnimating();

            Task.Run(async () => 
            {
                List<C_VitaSite> sites = await Global.FetchAllSites();

                List<C_SiteCoordinated> sitescoord = new List<C_SiteCoordinated>();

                foreach(C_VitaSite s in sites)
                {
                    // build a new entry for this site
                    C_SiteCoordinated sc = new C_SiteCoordinated(s);

                    // find out if this user coordinates this site
                    bool found = false;
                    foreach(C_SiteCoordinated scx in SelectedUser.SitesCoordinated)
                    {
                        if (scx.SiteId == s.id)
                        {
                            found = true;
                            break;
                        }
                    }
                    sc.Include = found;

                    sitescoord.Add(sc);
                }
                sitescoord.Sort(C_SiteCoordinated.CompareByNameToLower);

                void p()
                {
                    AI_Busy.StopAnimating();

                    L_Name.Text = SelectedUser.Name;

                    SitesTableSource = new C_TableSource<C_SiteCoordinated>(this, TV_Sites, sitescoord, "sitesselcell");
                    SitesTableSource.IncludeSwitch += (sender, args) => 
                    {
                        C_SiteCoordinated sc = args.Item;
                        return sc.Include;
                    };
                    SitesTableSource.GetTextLabel += (sender, args) =>
                    {
                        C_SiteCoordinated sc = args.Item;
                        return sc.Name;
                    };
                    SitesTableSource.GetDetailTextLabel += (sender, args) =>
                    {
                        C_SiteCoordinated sc = args.Item;
                        C_VitaSite s = Global.GetSiteFromSlugNoFetch(sc.Slug);
                        return s.Street + ", " + s.City + " " + s.State;
                    };
                    SitesTableSource.SwitchValueChanged += (sender, args) => 
                    {
                        args.Item.Include = args.SwitchState;
                        SelectedUser.Dirty = true;
                        Dirty = true;
                    };
                    TV_Sites.Source = SitesTableSource;
                    TV_Sites.ReloadData();
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }
    }
}