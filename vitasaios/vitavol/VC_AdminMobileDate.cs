using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminMobileDate : UIViewController
    {
        C_Global Global;

        C_TableSource<C_CalendarEntry> CalendarEntriesHelper;

        public VC_AdminMobileDate (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_AdminMobileDateToAdminMobile", this);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_Date.Text = Global.CalendarDate.ToString("mmm dd, yyyy");

            List<C_VitaSite> sites = Global.GetAllSitesNoFetch();
            // reduce to the list of mobile sites
            var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
            sites = ou.ToList();

            // build the list of sites open on this date
            List<C_CalendarEntry> calEntriesOnDate = new List<C_CalendarEntry>();
            foreach (C_VitaSite site in sites)
            {
                foreach (C_CalendarEntry ce in site.SiteCalendar)
                {
                    if ((ce.Date == Global.CalendarDate) && ce.SiteIsOpen)
                        calEntriesOnDate.Add(ce);
                }
            }

            CalendarEntriesHelper = new C_TableSource<C_CalendarEntry>(this, LV_Calendar, calEntriesOnDate, "calentry");
            CalendarEntriesHelper.GetTextLabel += (object sender, C_TableSource<C_CalendarEntry>.TableSourceEventArgs<C_CalendarEntry> args) => 
            {
                C_VitaSite site = Global.GetSiteFromIDNoFetch(args.Item.SiteID);

                return site == null ? "" : site.Name;
            };
            CalendarEntriesHelper.GetDetailTextLabel += (object sender, C_TableSource<C_CalendarEntry>.TableSourceEventArgs<C_CalendarEntry> args) => 
            {
                C_CalendarEntry ce = args.Item;
                string sio = ce.SiteIsOpen ? "[Open] " : "[Closed] ";
                return sio + ce.OpenTime.ToString("hh:mm p") + " to " + ce.CloseTime.ToString("hh:mm p");
            };
            LV_Calendar.Source = CalendarEntriesHelper;
            LV_Calendar.ReloadData();
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}