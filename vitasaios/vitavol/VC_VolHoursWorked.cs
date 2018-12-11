using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;
using zsquared;

namespace vitavol
{
    public partial class VC_VolHoursWorked : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_TableSource<C_WorkLogItem> WorkItemTableSource;

        public VC_VolHoursWorked (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolHoursToVolHome", this);

            B_AddHours.TouchUpInside += (sender, e) =>
            {
                Global.SelectedWorkItem = null;
                PerformSegue("Segue_VolHoursToVolHoursEdit", this);
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
                List<C_VitaSite> sites = await Global.FetchAllSites();

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    float hours = 0.0f;
                    foreach (C_WorkLogItem wi in LoggedInUser.WorkItems)
                        hours += wi.Hours;
                    TB_Hours.Text = hours.ToString();

                    WorkItemTableSource = new C_TableSource<C_WorkLogItem>(this, TV_HoursWorked, LoggedInUser.WorkItems);
                    LoggedInUser.WorkItems.Sort(C_WorkLogItem.CompareByDateReverse);
                    WorkItemTableSource.GetTextLabel += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        return wi.Date.ToString("dow mmm dd, yyyy");
                    };
                    WorkItemTableSource.GetDetailTextLabel += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        C_VitaSite site = Global.GetSiteFromSlugNoFetch(wi.SiteSlug);
                        string approvedString = wi.Approved ? " [approved]" : " [not approved]";
                        return wi.Hours.ToString() + " hours at " + site.Name + approvedString;
                    };
                    WorkItemTableSource.Selected += (object sender, C_TableSource<C_WorkLogItem>.TableSourceEventArgs<C_WorkLogItem> args) =>
                    {
                        Global.SelectedWorkItem = args.Item;
                        if (!Global.SelectedWorkItem.Approved)
                            PerformSegue("Segue_VolHoursToVolHoursEdit", this);
                    };
                    TV_HoursWorked.Source = WorkItemTableSource;
                    TV_HoursWorked.ReloadData();

                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

         private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_AddHours.Enabled = en;
            TV_HoursWorked.UserInteractionEnabled = en;
        }
    }
}