using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using UIKit;
using CoreGraphics;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSiteCalResetAction : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_DatePicker FirstDatePicker;
        C_DatePicker LastDatePicker;

        public VC_AdminSiteCalResetAction (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (object sender, EventArgs e) => 
                PerformSegue("Segue_AdminSiteCalResetActionToAdminSiteCalReset", this);

            SW_Confirm.ValueChanged += (object sender, EventArgs e) => 
                B_Save.Enabled = SW_Confirm.On;

            B_Save.TouchUpInside += async (object sender, EventArgs e) => 
            {
                E_MessageBoxResults mbres = await MessageBox(this, 
                         "Are you really sure?", 
                         "This action will erase the existing site calendar and create a new one. No Undo.", 
                         E_MessageBoxButtons.YesNoCancel);

                if (mbres == E_MessageBoxResults.Cancel)
                    return;

                if (mbres == E_MessageBoxResults.No)
                {
                    PerformSegue("Segue_AdminSiteCalResetActionToAdminSiteCalReset", this);
                    return;
                }
                // otherwise, we are to reset the calendar

                AI_Busy.StartAnimating();
                EnableUI(false);

                C_YMD firstDate = FirstDatePicker.Value;
                C_YMD lastDate = LastDatePicker.Value;

                await Task.Run(async () => 
                {
                    bool err = await SaveForm(firstDate, lastDate);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (!err)
                        {
                            PerformSegue("Segue_AdminSiteCalResetActionToAdminSiteCalendar", this);
                            return;
                        }

                        E_MessageBoxResults mbres1 = await MessageBox(this,
                            "Error",
                            "One or more errors occurred. The calendar was not updated successfully.",
                             E_MessageBoxButtons.Ok);

                        PerformSegue("Segue_AdminSiteCalResetActionToAdminSiteCalReset", this);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
            SW_Confirm.On = false;
            B_Save.Enabled = SW_Confirm.On;

            FirstDatePicker = new C_DatePicker(TB_SeasonFirst);
            FirstDatePicker.SetValue(new C_YMD(2019, 1, 1));

            LastDatePicker = new C_DatePicker(TB_SeasonLast);
            LastDatePicker.SetValue(new C_YMD(2019, 04, 15));
        }

        private void EnableUI(bool en)
        {
            C_Common.EnableUI(View, en);

            B_Save.Enabled = SW_Confirm.On;
        }

        private async Task<bool> SaveForm(C_YMD firstDate, C_YMD lastDate)
        {
                bool error = false;
                List<C_CalendarEntry> celist = new List<C_CalendarEntry>();
                foreach (C_CalendarEntry ce in Global.SelectedSiteTemp.SiteCalendar)
                    celist.Add(ce);
                foreach (C_CalendarEntry ce in celist)
                {
                    C_IOResult ior = await Global.RemoveCalendarEntry(Global.SelectedSiteTemp, LoggedInUser.Token, ce);
                    if (!ior.Success)
                    {
                        error = true;
                        break;
                    }
                }

            if (!error)
            {
                C_YMD today = new C_YMD(firstDate);
                C_YMD last = new C_YMD(lastDate);
                while (today <= last)
                {
                    DayOfWeek dow = today.DayOfWeek;

                    var ou = Global.DOWCalendar.Where(ce => ce.DOW == dow);
                    if (ou.Any())
                    {
                        C_CalendarEntry tce = ou.FirstOrDefault();
                        C_CalendarEntry nce = new C_CalendarEntry(tce)
                        {
                            Date = today,
                            SiteID = Global.SelectedSiteTemp.id
                        };
                        C_IOResult tior = await Global.CreateCalendarEntry(Global.SelectedSiteTemp, LoggedInUser.Token, nce);
                        if (!tior.Success)
                        {
                            error = true;
                            break;
                        }
                    }

                    today = today.AddDays(1);
                }
            }
            return error;
        }
    }
}