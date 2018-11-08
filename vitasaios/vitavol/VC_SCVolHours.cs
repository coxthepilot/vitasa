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
        C_ItemPicker<C_YMD> DatePicker;
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
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SCVolHoursToSCSite", this);

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            TB_Date.AddTarget((sender, e) => 
            {
                Global.CalendarDate = new C_YMD(TB_Date.Text);

                List<C_WorkLogItem> worklogitems = new List<C_WorkLogItem>();
                foreach (C_WorkLogItem wi in SelectedSite.WorkLogItems)
                {
                    if (wi.Date == Global.CalendarDate)
                        worklogitems.Add(wi);
                }

                InstallWorkLogItemsTableSource(worklogitems);

            }, UIControlEvent.AllEditingEvents);

            B_MarkAsApproved.TouchUpInside += (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    bool ioerror = false;
                    foreach(C_WorkLogItem wi in WorkLogItemTableSource.List)
                    {
                        wi.Approved = true;
                        C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                        C_IOResult ior = await Global.UpdateWorkLogItem(user, LoggedInUser.Token, wi);
                        if (!ior.Success)
                            ioerror = true;
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

            L_SiteName.Text = SelectedSite.Name;

            List<C_WorkLogItem> worklogitems = new List<C_WorkLogItem>();
            foreach(C_WorkLogItem wi in SelectedSite.WorkLogItems)
            {
                if (wi.Date == Global.CalendarDate)
                    worklogitems.Add(wi);
            }

            InstallWorkLogItemsTableSource(worklogitems);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () => 
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_VitaSite> sites = await Global.FetchAllSites(LoggedInUser.Token);

                List<C_YMD> dates = new List<C_YMD>();
                foreach (C_VitaSite site in sites)
                {
                    foreach (C_CalendarEntry ce in site.SiteCalendar)
                    {
                        if ((ce.SiteIsOpen) && !dates.Contains(ce.Date))
                            dates.Add(ce.Date);

                    }
                }
                dates.Sort(C_YMD.CompareYMD);

                void p()
                {
                    DatePicker = new C_ItemPicker<C_YMD>(TB_Date, dates);

                    if (Global.CalendarDate < dates[0])
                        Global.CalendarDate = dates[0];
                    DatePicker.SetSelection(Global.CalendarDate);

                    AI_Busy.StopAnimating();
                    EnableUI(true);
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);

        private void InstallWorkLogItemsTableSource(List<C_WorkLogItem> items)
        {
            WorkLogItemTableSource = new C_TableSource<C_WorkLogItem>(this, TV_WorkLogItems, items);
            WorkLogItemTableSource.GetTextLabel += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
            {
                C_WorkLogItem wi = args.Item;
                C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                return user.Name;
            };
            WorkLogItemTableSource.GetDetailTextLabel += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
            {
                C_WorkLogItem wi = args.Item;
                string apps = wi.Approved ? " [approved]" : " [not approved]";
                return wi.Hours.ToString() + " hours" + apps;
            };
            WorkLogItemTableSource.Selected += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
            {
                // signal that we are doing an edit, not creating a new item
                Global.SelectedWorkItem = args.Item;
                PerformSegue("Segue_SCVolHoursToSCAddVolHours", this);
            };
            WorkLogItemTableSource.Delete += async (sender, args) =>
            {
                C_WorkLogItem wi = args.Item;
                // find the work log item in the site list (the actions below only delete from the user)
                SelectedSite.WorkLogItems.Remove(wi);
                // get the user so we can actually do the delete
                C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                C_IOResult ior = await Global.RemoveWorkLogItem(user, LoggedInUser.Token, wi);
            };
            TV_WorkLogItems.Source = WorkLogItemTableSource;
            TV_WorkLogItems.ReloadData();
        }
    }
}