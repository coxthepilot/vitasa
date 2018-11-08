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
    public partial class VC_AdminSiteCalDetails : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_VitaSite SelectedSite;
        C_CalendarEntry SelectedCalendarEntry;

        C_TimePicker OpenTimePicker;
        C_TimePicker CloseTimePicker;

        bool Dirty;

        public VC_AdminSiteCalDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            Dirty = false;

            View.BackgroundColor = C_Common.StandardBackground;

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SelectedSite = Global.SelectedSiteTemp;
            SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(Global.CalendarDate);

            B_Back.TouchUpInside += async (sender, e) => 
            {
                if (Dirty)
                {
                    E_MessageBoxResults mbres = await MessageBox(this,
                        "Changes",
                        "Changes have been made. Save the changes?",
                         E_MessageBoxButtons.YesNoCancel);
                    if (mbres == E_MessageBoxResults.Yes)
                    {
                        SaveCalDetails();
                        PerformSegue("Segue_AdminSiteCalDetailsToAdminSiteCalendar", this);
                    }
                    else if (mbres == E_MessageBoxResults.No)
                    {
                        PerformSegue("Segue_AdminSiteCalDetailsToAdminSiteCalendar", this);
                    }
                    // else cancel, just ignore
                }
                else
                    PerformSegue("Segue_AdminSiteCalDetailsToAdminSiteCalendar", this);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                SaveCalDetails();

                PerformSegue("Segue_AdminSiteCalDetailsToAdminSiteCalendar", this);
            };

            TB_OpenTime.AddTarget((sender, e) => { Dirty = true; Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_CloseTime.AddTarget((sender, e) => { Dirty = true; Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            SW_Open.ValueChanged += (sender, e) => 
            { 
                Dirty = true; 
                Global.SelectedSiteTemp.Dirty = true;

                TB_OpenTime.Enabled = SW_Open.On;
                TB_CloseTime.Enabled = SW_Open.On;

                C_Common.SetEnabledColors(TB_OpenTime);
                C_Common.SetEnabledColors(TB_CloseTime);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
            L_Date.Text = Global.CalendarDate.ToString("dow mmm dd, yyyy");

            SW_Open.On = SelectedCalendarEntry.SiteIsOpen;

            TB_OpenTime.Enabled = SW_Open.On;
            TB_CloseTime.Enabled = SW_Open.On;

            C_Common.SetEnabledColors(TB_OpenTime);
            C_Common.SetEnabledColors(TB_CloseTime);

            OpenTimePicker = new C_TimePicker(TB_OpenTime);
            OpenTimePicker.SetValue(SelectedCalendarEntry.OpenTime);

            CloseTimePicker = new C_TimePicker(TB_CloseTime);
            CloseTimePicker.SetValue(SelectedCalendarEntry.CloseTime);
        }

        private void SaveCalDetails()
        {
            SelectedCalendarEntry.SiteIsOpen = SW_Open.On;
            SelectedCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
            SelectedCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
        }
    }
}