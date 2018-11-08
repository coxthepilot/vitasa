using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;
using CoreGraphics;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSiteDetails : UIViewController
    {
        C_Global Global;
        C_VitaSite SelectedSite;
        C_YMD SelectedDate;
        C_CalendarEntry SelectedCalendarEntry;
        C_VitaUser LoggedInUser;

        C_TimePicker OpenTimePicker;
        C_TimePicker CloseTimePicker;

        bool SaveButtonEnabled;

        public VC_SCSiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            SelectedDate = Global.CalendarDate;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
            // we make a cloned copy so that we don't commit until the save
            SelectedCalendarEntry = new C_CalendarEntry(SelectedSite.GetCalendarEntryForDate(SelectedDate));

            B_Back.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_SCSiteDetailsToSCSite", this);
            };

            B_Cancel.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_SCSiteDetailsToSCSite", this);
            };

            TB_OpenTime.AddTarget((sender, e) => 
            {
                CheckSaveButtonEnable();
            }, UIControlEvent.AllEditingEvents);

            TB_CloseTime.AddTarget((sender, e) =>
            {
                CheckSaveButtonEnable();
            }, UIControlEvent.AllEditingEvents);

            SW_SiteIsOpen.ValueChanged += (sender, e) =>
            {
                SelectedCalendarEntry.SiteIsOpen = SW_SiteIsOpen.On;

                TB_OpenTime.Enabled = SW_SiteIsOpen.On;
                TB_CloseTime.Enabled = SW_SiteIsOpen.On;

                C_Common.SetEnabledColors(TB_OpenTime);
                C_Common.SetEnabledColors(TB_CloseTime);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                SelectedCalendarEntry.SiteIsOpen = SW_SiteIsOpen.On;
                SelectedCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
                SelectedCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
                C_CalendarEntry ce = SelectedSite.GetCalendarEntryForDate(SelectedDate);
                ce.CopyFrom(SelectedCalendarEntry);

                AI_Busy.StartAnimating();
                EnableUI(true);

                Task.Run(async () => 
                {
                    C_IOResult ior = await Global.UpdateCalendarEntry(SelectedSite, LoggedInUser.Token, ce);

                    UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(async () =>
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if ((ior != null) && ior.Success)
                            PerformSegue("Segue_SCSiteDetailsToSCSite", this);
                        else
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                                 "Error - enable to update the calendar",
                                 ior.ErrorMessage,
                                 E_MessageBoxButtons.Ok);
                        }
                    }));
                });
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = SelectedSite.Name;
            L_Date.Text = SelectedCalendarEntry.Date.ToString("mmm dd, yyyy");

            SW_SiteIsOpen.On = SelectedCalendarEntry.SiteIsOpen;

            TB_OpenTime.Enabled = SelectedCalendarEntry.SiteIsOpen;
            TB_CloseTime.Enabled = SelectedCalendarEntry.SiteIsOpen;

            C_Common.SetEnabledColors(TB_OpenTime);
            C_Common.SetEnabledColors(TB_CloseTime);

            OpenTimePicker = new C_TimePicker(TB_OpenTime);
            OpenTimePicker.SetValue(SelectedCalendarEntry.OpenTime);
            CloseTimePicker = new C_TimePicker(TB_CloseTime);
            CloseTimePicker.SetValue(SelectedCalendarEntry.CloseTime);

            CheckSaveButtonEnable();
        }

        private void EnableUI(bool en)
        {
            C_Common.EnableUI(View, en);
            //B_Cancel.Enabled = en;
            //B_Back.Enabled = en;
            //B_Save.Enabled = en && SaveButtonEnabled;
        }

        private void CheckSaveButtonEnable()
        {
            bool ok = false;
            try
            {
                if (!string.IsNullOrWhiteSpace(TB_OpenTime.Text) && !string.IsNullOrWhiteSpace(TB_CloseTime.Text))
                {
                    C_HMS ohms = new C_HMS(TB_OpenTime.Text);
                    C_HMS chms = new C_HMS(TB_CloseTime.Text);
                    ok = true;
                }
            }
            catch
            {
                ok = false;
            }

            SaveButtonEnabled = ok;
            B_Save.Enabled = SaveButtonEnabled;
        }
    }
}