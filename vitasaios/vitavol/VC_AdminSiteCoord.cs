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

        bool Dirty;

        public VC_AdminSiteCoord (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            Dirty = false;

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
                AllSiteCoordinators.Sort(C_VitaUser.CompareByName);

                // set the flag state for each user; set to true if that user is a site coord for our site
                foreach (C_VitaUser u in AllSiteCoordinators)
                {
                    bool found = Global.SelectedSiteTemp.SiteCoordinatorsIds.Contains(u.id);
                    u.IV_Flag = u.Flag = found;
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
                        Dirty = true;
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
            // convert to a list of user ids
            List<int> flaggedUserIds = flaggedUsers.Select(u => u.id).ToList();
            // convert to a list of user names
            List<string> flaggedUserNames = flaggedUsers.Select(u => u.Name).ToList();

            Global.SelectedSiteTemp.SiteCoordinatorsIds = flaggedUserIds;
            Global.SelectedSiteTemp.SiteCoordinatorNames = flaggedUserNames;

            Global.SelectedSiteTemp.Dirty = true;
        }
    }
}