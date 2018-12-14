using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using UIKit;
using static zsquared.C_MessageBox;
using zsquared;

namespace vitavol
{
    public partial class VC_EditHours : UIViewController
    {
        // if SelectedWorkLogItem comes in null, then we are to create a new item, save it before we exit, and add to the user

        C_Global Global;
        C_VitaUser LoggedInUser;
        bool NewWorkLogItem;
        C_ItemPicker<C_VitaSite> SitePicker;
        C_ItemPicker<C_YMD> DatePicker;

        public VC_EditHours (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolHoursEditToVolHours", this);

            B_Cancel.TouchUpInside += (object sender, EventArgs e) => 
                PerformSegue("Segue_VolHoursEditToVolHours", this);

            B_Save.TouchUpInside += (sender, e) =>
            {
                C_VitaSite sel = SitePicker.Selection;
                Global.SelectedWorkItem.SiteSlug = sel.Slug;
                Global.SelectedWorkItem.Date = DatePicker.Selection;
                //Global.SelectedWorkItem.UserId = LoggedInUser.id;
                try { Global.SelectedWorkItem.Hours = Convert.ToSingle(TB_Hours.Text); }
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                }

                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    C_IOResult ior = NewWorkLogItem
                        ? await Global.AddWorkLogItem(LoggedInUser, LoggedInUser.Token, Global.SelectedWorkItem)
                        : await Global.UpdateWorkLogItem(LoggedInUser, LoggedInUser.Token, Global.SelectedWorkItem);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                             "Error",
                             "Unable to save the new work item.",
                             E_MessageBoxButtons.Ok);
                        }
                        else
                            PerformSegue("Segue_VolHoursEditToVolHours", this);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            TB_Date.AddTarget((object sender, EventArgs e) => 
                              CheckSaveEnable(), UIControlEvent.AllEditingEvents);
            TB_Site.AddTarget((object sender, EventArgs e) => 
                              CheckSaveEnable(), UIControlEvent.AllEditingEvents);
            TB_Hours.AddTarget((object sender, EventArgs e) => 
                               CheckSaveEnable(), UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            NewWorkLogItem = Global.SelectedWorkItem == null;
            if (NewWorkLogItem)
                Global.SelectedWorkItem = new C_WorkLogItem(LoggedInUser.id);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () =>
            {
                List<C_VitaSite> sites = await Global.FetchAllSites(LoggedInUser.Token);

                // only mobile volunteers can see all sites
                if (!LoggedInUser.HasMobile)
                {
                    var ou = sites.Where(s => s.SiteType == E_SiteType.Fixed);
                    sites = ou.ToList();
                }
                sites.Sort(C_VitaSite.CompareSitesByNameAscendingLower);

                List<C_YMD> dates = new List<C_YMD>();
                foreach(C_VitaSite site in sites)
                {
                    foreach(C_CalendarEntry ce in site.SiteCalendar)
                    {
                        if ((ce.SiteIsOpen) && !dates.Contains(ce.Date))
                            dates.Add(ce.Date);

                    }
                }
                dates.Sort(C_YMD.CompareYMD);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    DatePicker = new C_ItemPicker<C_YMD>(TB_Date, dates);
                    if (dates.Count != 0)
                    {
                        if (dates.Contains(Global.SelectedWorkItem.Date))
                            DatePicker.SetSelection(Global.SelectedWorkItem.Date);
                        else
                            DatePicker.SetSelection(dates[0]);
                    }

                    if (sites != null)
                        SitePicker = new C_ItemPicker<C_VitaSite>(TB_Site, sites);

                    if (!NewWorkLogItem)
                    {
                        C_VitaSite site = Global.GetSiteFromSlugNoFetch(Global.SelectedWorkItem.SiteSlug);
                        //C_VitaSite site = Global.GetSiteFromIDNoFetch(Global.SelectedWorkItem.SiteId);
                        if (site != null)
                            SitePicker.SetSelection(site);
                        DatePicker.SetSelection(Global.SelectedWorkItem.Date);
                        TB_Hours.Text = Global.SelectedWorkItem.Hours.ToString();
                    }

                    CheckSaveEnable();
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);

        private void CheckSaveEnable()
        {
            double h;

            bool hoursok = double.TryParse(TB_Hours.Text, out h);
            bool dateok = TB_Date.Text.Length > 0;

            B_Save.Enabled = hoursok && dateok;
        }
    }
}