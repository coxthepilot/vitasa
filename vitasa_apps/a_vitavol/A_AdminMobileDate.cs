using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminMobileDate")]
    public class A_AdminMobileDate : Activity
    {
        C_Global Global;

        TextView L_Date;
        ListView LV_CalendarEntries;

        C_ListViewHelper<C_CalendarEntry> CalendarEntriesHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            SetContentView(Resource.Layout.AdminMobileDate);

            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            LV_CalendarEntries = FindViewById<ListView>(Resource.Id.LV_CalendarEntries);

            C_Common.SetViewColors(this, Resource.Id.V_AdminMobileDate);

            L_Date.Text = Global.CalendarDate.ToString("mmm dd, yyyy");

            LV_CalendarEntries.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) =>  
            {
                int pos = e.Position;
                C_CalendarEntry ce = CalendarEntriesHelper.Items[pos];
                C_VitaSite site = Global.GetSiteFromIDNoFetch(ce.SiteID);

                Global.CalendarDateDetails = new C_CalendarDateDetails()
                {
                    SaveAction = E_CalendarDateDetailsSaveAction.ReadOnly,
                    MainTitle = "Site Calendar",
                    SiteName = site.Name,
                    Date = Global.CalendarDate.ToString("mmm dd, yyyy"),
                    Note = "Note that a change to a site's details will cause a notification to be sent to all volunteers with this site as a prefered site.",
                    CalendarEntry = ce,
                    CameFrom = E_ViewCameFrom.AdminMobileDate
                };
                StartActivity(new Intent(this, typeof(A_CalendarDateDetails)));
            };

            List<C_VitaSite> sites = Global.GetAllSitesNoFetch(); // assume they were fetched in AdminMobile
            var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
            sites = ou.ToList();

            List<C_CalendarEntry> calEntriesOnDate = new List<C_CalendarEntry>();
            foreach(C_VitaSite site in sites)
            {
                foreach(C_CalendarEntry ce in site.SiteCalendar)
                {
                    if ((ce.Date == Global.CalendarDate) && ce.SiteIsOpen)
                        calEntriesOnDate.Add(ce);
                }
            }

            CalendarEntriesHelper = new C_ListViewHelper<C_CalendarEntry>(this, LV_CalendarEntries, calEntriesOnDate);
            CalendarEntriesHelper.GetTextLabel += (object sender, ListAdapterEventArgs<C_CalendarEntry> args) => 
            {
                C_VitaSite site = Global.GetSiteFromIDNoFetch(args.Item.SiteID);

                return site == null ? "" : site.Name;
            };
            CalendarEntriesHelper.GetDetailTextLabel += (object sender, ListAdapterEventArgs<C_CalendarEntry> args) => 
            {
                C_CalendarEntry ce = args.Item;
                string sio = ce.SiteIsOpen ? "[Open] " : "[Closed] ";
                return sio + ce.OpenTime.ToString("hh:mm p") + " to " + ce.CloseTime.ToString("hh:mm p");
            };
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(A_AdminMobile)));
    }
}
