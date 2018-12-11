using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_SCVolHours : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;
        C_TableSource<C_WorkLogItem> WorkLogItemTableSource;

        public VC_SCVolHours (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SCVolHoursToSCSites", this);

            B_GoToSiteCalendar.TouchUpInside += (object sender, EventArgs e) => 
                PerformSegue("Segue_SCVolHoursToSCSite", this);

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            B_MarkAsApproved.TouchUpInside += (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    bool ioerror = false;
                    foreach(C_WorkLogItem wi in WorkLogItemTableSource.List)
                    {
                        if (!wi.Approved)
                        {
                            wi.Approved = true;
                            C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                            if (user == null)
                                user = FindUserForWorkItem(wi);
                            if (user != null)
                            {
                                C_IOResult ior = await Global.UpdateWorkLogItem(user, LoggedInUser.Token, wi);
                                if (!ior.Success)
                                    ioerror = true;
                            }
                        }
                    }

                    async void p()
                    {
                        if (ioerror)
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                                "Error",
                                "Unable to save one or more work items.",
                                E_MessageBoxButtons.Ok);
                        }

                        TV_WorkLogItems.ReloadData();

                        AI_Busy.StopAnimating();
                        EnableUI(true);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            B_AddVolHours.TouchUpInside += (sender, e) => 
            {
                // signal that this is a new item
                Global.SelectedWorkItem = null;
                PerformSegue("Segue_SCVolHoursToSCAddVolHours", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () => 
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_VitaSite> sites = await Global.FetchAllSites(LoggedInUser.Token);

                SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    L_SiteName.Text = SelectedSite.Name;

                    SelectedSite.WorkLogItems.Sort(C_WorkLogItem.CompareByDateReverse);

                    InstallWorkLogItemsTableSource(SelectedSite.WorkLogItems);
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);

        private void InstallWorkLogItemsTableSource(List<C_WorkLogItem> items)
        {
            WorkLogItemTableSource = new C_TableSource<C_WorkLogItem>(this, TV_WorkLogItems, items);
            items.Sort(C_WorkLogItem.CompareByDateReverse);
            WorkLogItemTableSource.GetTextLabel += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
            {
                C_WorkLogItem wi = args.Item;
                C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                if (user == null)
                    user = FindUserForWorkItem(wi);
                string un = user == null ? "" : user.Name;
                return un;
            };
            WorkLogItemTableSource.GetDetailTextLabel += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
            {
                C_WorkLogItem wi = args.Item;
                string apps = wi.Approved ? " [approved]" : " [not approved]";
                return wi.Date.ToString("mmm dd, yyyy") + " for " + wi.Hours.ToString() + " hours" + apps;
            };
            WorkLogItemTableSource.Selected += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
            {
                // signal that we are doing an edit, not creating a new item
                Global.SelectedWorkItem = args.Item;
                PerformSegue("Segue_SCVolHoursToSCAddVolHours", this);
            };
            async void deleteHandler(object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args)
            {
                C_WorkLogItem wi = args.Item;
                // find the work log item in the site list (the actions below only delete from the user)
                // get the user so we can actually do the delete
                C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                if (user == null)
                    user = FindUserForWorkItem(wi);
                if (user != null)
                {
                    C_IOResult ior = await Global.RemoveWorkLogItem(user, LoggedInUser.Token, wi);
                    if (ior.Success)
                        SelectedSite.WorkLogItems.Remove(wi);
                }
            }
            WorkLogItemTableSource.Delete += deleteHandler;
            TV_WorkLogItems.Source = WorkLogItemTableSource;
            TV_WorkLogItems.ReloadData();
        }

        private C_VitaUser FindUserForWorkItem(C_WorkLogItem wi)
        {
            C_VitaUser user = null;
            // the backend is supposed to store the UserId; in the case where it doesn't we do another search for the user
            foreach (C_VitaUser u in Global.UserCache)
            {
                bool found = false;
                foreach (C_WorkLogItem wx in u.WorkItems)
                {
                    if (wx.id == wi.id)
                    {
                        found = true;
                        user = u;
                    }
                }
                if (found)
                    break;
            }
            return user;
        }
    }
}