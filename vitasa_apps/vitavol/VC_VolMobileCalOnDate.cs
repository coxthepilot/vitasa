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
    public partial class VC_VolMobileCalOnDate : UIViewController
    {
        C_Global Global;

        public VC_VolMobileCalOnDate (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolMobileCalOnDateToVolMobileCalendar", this);

            B_Done.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolMobileCalOnDateToVolMobileCalendar", this);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
            View.BackgroundColor = C_Common.StandardBackground;

            L_Date.Text = Global.CalendarDate.ToString("mmm dd, yyyy");

            List<C_VitaSite> sites = Global.GetAllSitesNoFetch(); // assume they were fetched in preceeding screens
            // reduce the list to only mobile sites
            var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
            sites = ou.ToList();

            // build a list of all calendar entries for the sites, but only the ones that are open
            List<C_CalendarEntry> calEntriesOnDate = new List<C_CalendarEntry>();
            foreach (C_VitaSite site in sites)
            {
                foreach (C_CalendarEntry ce in site.SiteCalendar)
                {
                    if ((ce.Date == Global.CalendarDate) && ce.SiteIsOpen)
                        calEntriesOnDate.Add(ce);
                }
            }

            C_TableSource<C_CalendarEntry> tableSource = new C_TableSource<C_CalendarEntry>(this, LV_Sites, calEntriesOnDate);
            tableSource.GetTextLabel += (object sender, C_TableSource<C_CalendarEntry>.TableSourceEventArgs<C_CalendarEntry> args) => 
            {
                C_VitaSite site = Global.GetSiteFromIDNoFetch(args.Item.SiteID);

                return site == null ? "" : site.Name;
            };
            tableSource.GetDetailTextLabel += (object sender, C_TableSource<C_CalendarEntry>.TableSourceEventArgs<C_CalendarEntry> args) => 
            {
                C_CalendarEntry ce = args.Item;
                string sio = ce.SiteIsOpen ? "[Open] " : "[Closed] ";
                return sio + ce.OpenTime.ToString("hh:mm p") + " to " + ce.CloseTime.ToString("hh:mm p");
            };
            LV_Sites.Source = tableSource;
            LV_Sites.ReloadData();
        }
    }
}