using Foundation;
using System;
using System.Threading.Tasks;
using UIKit;
using System.Collections.Generic;

using zsquared;

namespace vitavol
{
    public partial class VC_SiteCalOnDate : UIViewController
    {
        C_Global Global;
        C_VitaSite SelectedSite;

        public VC_SiteCalOnDate (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() =>
            {
                C_Common.DropFirstResponder(View);
            });

            L_Title.UserInteractionEnabled = true;
            L_Title.AddGestureRecognizer(labelTap);
            L_Date.UserInteractionEnabled = true;
            L_Date.AddGestureRecognizer(labelTap);
            L_SiteName.UserInteractionEnabled = true;
            L_SiteName.AddGestureRecognizer(labelTap);

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SiteCalOnDateToSiteCalendar", this);

            B_Done.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SiteCalOnDateToSiteCalendar", this);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = SelectedSite.Name;
            L_Date.Text = Global.CalendarDate.ToString("mmm dd, yyyy");

            C_CalendarEntry ce = SelectedSite.GetCalendarEntryForDate(Global.CalendarDate);

            SW_SiteIsOpen.UserInteractionEnabled = false;
            SW_SiteIsOpen.On = ce.SiteIsOpen;

            TB_OpenTime.UserInteractionEnabled = false;
            TB_OpenTime.Text = ce.OpenTime.ToString("hh:mm p");

            TB_CloseTime.UserInteractionEnabled = false;
            TB_CloseTime.Text = ce.CloseTime.ToString("hh:mm p");
        }
    }
}