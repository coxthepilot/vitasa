using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using System.Linq;

using zsquared;

namespace vitavol
{
    public partial class VC_SitesFilter : UIViewController
    {
        C_Global Global;
        C_ItemPicker<string> DatePicker;
        C_PersistentSettings Settings;

        public VC_SitesFilter (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SitesFilterToSitesMap", this);

            B_UseFilter.TouchUpInside += (sender, e) => 
            {
                Settings.SitesFilter.ClearSiteCapabilities();
                if (SW_DropOff.On)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.DropOff);
                if (SW_InPersonPrep.On)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.InPerson);
                if (SW_MFT.On)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.MFT);
                if (SW_Express.On)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Express);
                if (SW_Mobile.On)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Mobile);

                if (!SW_DropOff.On && !SW_InPersonPrep.On && !SW_MFT.On && !SW_Express.On && !SW_Mobile.On)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Any);

                PerformSegue("Segue_SitesFilterToSitesMap", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
            View.BackgroundColor = C_Common.StandardBackground;

            // we don't need to log in any local user since that was done in the sitesmap screen
            bool hasMobile =
                (Global.LoggedInUserId != -1)
                && (Global.SelectedUser != null)
                && Global.SelectedUser.HasVolunteer
                && Global.SelectedUser.HasMobile;

            SW_Mobile.Hidden = !hasMobile;
            L_Mobile.Hidden = !hasMobile;

            // populate the selector for the dates and preselect the current value
            List<string> dateValues = new List<string> { "Any", "Today", "Tomorrow" };
            for (int i = 2; i != 7; i++)
            {
                C_YMD d = C_YMD.Now.AddDays(i);
                dateValues.Add(d.ToString("dow mmm dd, yyyy"));
            }

            TB_Dates.Text = C_SitesFilter.GetFriendlyString(Settings.SitesFilter.DateFilter);
            DatePicker = new C_ItemPicker<string>(TB_Dates, dateValues);
            DatePicker.SetSelection(Settings.SitesFilter.DateFilter.ToString());
            DatePicker.PickerDone += (sender, e) =>
            {
                string res = e.Selection;
                if (res == "Any")
                    Settings.SitesFilter.DateFilter = E_DateFilter.AllDays;
                else if (res == "Today")
                    Settings.SitesFilter.DateFilter = E_DateFilter.Today;
                else if (res == "Tomorrow")
                    Settings.SitesFilter.DateFilter = E_DateFilter.Tomorrow;
                else
                {
                    int ix = dateValues.IndexOf(res);
                    switch (ix)
                    {
                        case 3: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP2; break;
                        case 4: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP3; break;
                        case 5: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP4; break;
                        case 6: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP5; break;
                        case 7: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP6; break;
                    }
                }
            };

            // set the values for the switches
            SW_DropOff.On = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.DropOff);
            SW_InPersonPrep.On = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.InPerson);
            SW_MFT.On = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.MFT);
            SW_Express.On = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.Express);

            SW_Mobile.On = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.Mobile);
        }
    }
}