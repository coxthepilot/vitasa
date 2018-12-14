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

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() =>
            {
                C_Common.DropFirstResponder(View);
            });

            L_Title.UserInteractionEnabled = true;
            L_Title.AddGestureRecognizer(labelTap);

            B_Back.TouchUpInside += (object sender, EventArgs e) => 
                PerformSegue("Segue_AdminSiteCalResetActionToAdminSiteCalReset", this);

            SW_Confirm.ValueChanged += (object sender, EventArgs e) => 
                B_Save.Enabled = SW_Confirm.On;

            B_Save.TouchUpInside += async (object sender, EventArgs e) => 
            {
                C_YMD firstDate = FirstDatePicker.Value;
                C_YMD lastDate = LastDatePicker.Value;
                C_PersistentSettings ps = new C_PersistentSettings();
                ps.SeasonFirstDate = firstDate;
                ps.SeasonLastDate = lastDate;

                if (firstDate >= lastDate)
                {
                    E_MessageBoxResults mbres2 = await MessageBox(this,
                                 "Error?",
                                 "The starting date must be before the ending date.",
                                 E_MessageBoxButtons.Ok);
                    return;
                }

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
                C_AlertBox alertBox = new C_AlertBox(this, "Long Operation", "This could take a while...");
                alertBox.Show();

                await Task.Run(async () => 
                {
                    bool err = await SaveForm(firstDate, lastDate, alertBox);

                    async void p()
                    {
                        await alertBox.Hide();

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

            C_PersistentSettings ps = new C_PersistentSettings();
            FirstDatePicker = new C_DatePicker(TB_SeasonFirst);
            FirstDatePicker.SetValue(ps.SeasonFirstDate);

            LastDatePicker = new C_DatePicker(TB_SeasonLast);
            LastDatePicker.SetValue(ps.SeasonLastDate);
        }

        private void EnableUI(bool en)
        {
            C_Common.EnableUI(View, en);

            B_Save.Enabled = SW_Confirm.On;
        }

        private async Task<bool> SaveForm(C_YMD firstDate, C_YMD lastDate, C_AlertBox abox)
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
                void p()
                {
                    abox.SetMessage("This could take a while...\nRemoved: " + ce.Date.ToString());
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
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
                        void p()
                        {
                            abox.SetMessage("This could take a while...\nAdded: " + nce.Date.ToString());
                        }
                        UIApplication.SharedApplication.InvokeOnMainThread(p);
                    }

                    today = today.AddDays(1);
                }
            }
            return error;
        }
    }
}