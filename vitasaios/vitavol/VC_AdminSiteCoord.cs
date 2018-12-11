using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSiteCoord : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_TableSource<C_VitaUser> SiteCoordinatorsTableSource;

        List<C_VitaUser> AllSiteCoordinators;

        public VC_AdminSiteCoord (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) => 
            {
                SaveSiteCoord();
                PerformSegue("Segue_AdminSiteCoordToAdminSite", this);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                SaveSiteCoord();
                PerformSegue("Segue_AdminSiteCoordToAdminSite", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            Task.Run(async () =>
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                // filter the list to only site coordinators
                AllSiteCoordinators = users.Where(u => u.HasSiteCoordinator).ToList();
                AllSiteCoordinators.Sort(C_VitaUser.CompareByNameToLower);

                // set the flag state for each user; set to true if that user is a site coord for our site
                foreach (C_VitaUser u in AllSiteCoordinators)
                {
                    //bool found = Global.SelectedSiteTemp.SiteCoordinatorsIds.Contains(u.id);
                    var ou = Global.SelectedSiteTemp.SiteCoordinators.Where(sc => sc.UserId == u.id);
                    u.IV_Flag = u.Flag = ou.Any();
                }

                void p()
                {
                    SiteCoordinatorsTableSource = new C_TableSource<C_VitaUser>(this, TV_Coord, AllSiteCoordinators, "sitescoordcell");
                    //SiteCoordinatorsTableSource.ShowIndex = true;
                    SiteCoordinatorsTableSource.IncludeSwitch += (sender, args) =>
                    {
                        C_VitaUser sc = args.Item;

                        return sc.Flag;
                    };
                    SiteCoordinatorsTableSource.GetTextLabel += (sender, args) =>
                    {
                        C_VitaUser sc = args.Item;
                        return sc.Name;
                    };
                    SiteCoordinatorsTableSource.GetDetailTextLabel += (sender, args) =>
                    {
                        //C_VitaUser sc = args.Item;
                        return "";
                    };
                    SiteCoordinatorsTableSource.SwitchValueChanged += (sender, args) =>
                    {
                        C_VitaUser sc = args.Item;
                        sc.Flag = args.SwitchState;
                        Global.SelectedSiteTemp.Dirty = true;
                        //Dirty = true;
                    };
                    TV_Coord.Source = SiteCoordinatorsTableSource;
                    TV_Coord.ReloadData();
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void SaveSiteCoord()
        {
            // get the list from the users that have the flag set
            List<C_VitaUser> flaggedUsers = AllSiteCoordinators.Where(u => u.Flag).ToList();

            Global.SelectedSiteTemp.SiteCoordinators = new List<C_SiteCoordinator>();
            foreach(C_VitaUser fu in flaggedUsers)
            {
                C_SiteCoordinator sc = new C_SiteCoordinator(fu);
                Global.SelectedSiteTemp.SiteCoordinators.Add(sc);
            }

            // go through the list of users to adjust sites coordinated
            foreach(C_VitaUser user in Global.UserCache)
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
    }
}