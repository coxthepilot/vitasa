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
    public partial class VC_AdminSiteCalResetDOW : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_TimePicker OpenTimePicker;
        C_TimePicker CloseTimePicker;

        bool Dirty;

        public VC_AdminSiteCalResetDOW (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            Dirty = false;

            B_Back.TouchUpInside += async (sender, e) => 
            {
                if (Dirty)
                {
                    E_MessageBoxResults mbres = await MessageBox(this,
                        "Changes",
                        "Changes made. Save the changes?",
                         E_MessageBoxButtons.YesNoCancel);

                    if (mbres == E_MessageBoxResults.Yes)
                    {
                        SaveForm();

                        PerformSegue("Segue_AdminSiteCalResetDOWToAdminSiteCalReset", this);
                    }
                    else if (mbres == E_MessageBoxResults.No)
                        PerformSegue("Segue_AdminSiteCalResetDOWToAdminSiteCalReset", this);
                    // else cancel, just return to the form
                }
                else
                   PerformSegue("Segue_AdminSiteCalResetDOWToAdminSiteCalReset", this);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                SaveForm();

                PerformSegue("Segue_AdminSiteCalResetDOWToAdminSiteCalReset", this);
            };

            SW_Open.ValueChanged += (sender, e) => 
            { 
                Dirty = true;

                TB_OpenTime.Enabled = SW_Open.On;
                TB_CloseTime.Enabled = SW_Open.On;

                C_Common.SetEnabledColors(TB_OpenTime);
                C_Common.SetEnabledColors(TB_CloseTime);
            };
            TB_OpenTime.AddTarget((sender, e) => { Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_CloseTime.AddTarget((sender, e) => { Dirty = true; }, UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
            L_DOW.Text = Global.SelectedDOW.ToString();

            var ou = Global.DOWCalendar.Where(ce => ce.DOW == Global.SelectedDOW);
            if (ou.Any())
            {
                C_CalendarEntry ce = ou.FirstOrDefault();

                SW_Open.On = ce.SiteIsOpen;

                TB_OpenTime.Enabled = SW_Open.On;
                TB_CloseTime.Enabled = SW_Open.On;

                C_Common.SetEnabledColors(TB_OpenTime);
                C_Common.SetEnabledColors(TB_CloseTime);

                OpenTimePicker = new C_TimePicker(TB_OpenTime);
                OpenTimePicker.SetValue(ce.OpenTime);

                CloseTimePicker = new C_TimePicker(TB_CloseTime);
                CloseTimePicker.SetValue(ce.CloseTime);

                ce.Dirty = true;
            }
        }

        private void SaveForm()
        {
            var ou = Global.DOWCalendar.Where(ce => ce.DOW == Global.SelectedDOW);
            if (!ou.Any())
                return;

            C_CalendarEntry cex = ou.FirstOrDefault();

            cex.SiteIsOpen = SW_Open.On;
            cex.OpenTime = OpenTimePicker.Value;
            cex.CloseTime = CloseTimePicker.Value;
        }
    }
}