using System;
using System.Collections.Generic;
using System.Linq;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSiteCalReset : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;

        C_TableSource<DayOfWeek> DOWTableSource;

        public VC_AdminSiteCalReset (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SelectedSite = Global.SelectedSiteTemp;

            if (Global.DOWCalendar == null)
            {
                Global.DOWCalendar = new List<C_CalendarEntry>();
                foreach (DayOfWeek dow in Enum.GetValues(typeof(DayOfWeek)))
                {
                    C_CalendarEntry ce = new C_CalendarEntry()
                    {
                        OpenTime = new C_HMS(8, 0, 0),
                        CloseTime = new C_HMS(17, 0, 0),
                        SiteIsOpen = false,
                        DOW = dow,
                        Dirty = false
                    };
                    Global.DOWCalendar.Add(ce);
                }
            }

            B_Back.TouchUpInside += (sender, e) =>
            {
                Global.DOWCalendar = null;
                PerformSegue("Segue_AdminSiteCalResetToAdminSiteCal", this);
            };

            B_Save.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminSiteCalResetToAdminSiteCalResetAction", this);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
            TV_DaysOfWeek.BackgroundColor = C_Common.StandardBackground;

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            B_Back.SetTitleColor(UIColor.FromRGBA(255, 255, 255, 64), UIControlState.Disabled);
            B_Save.SetTitleColor(UIColor.FromRGBA(255, 255, 255, 64), UIControlState.Disabled);

            List<DayOfWeek> dowlist = Tools.DaysOfWeekList();

            DOWTableSource = new C_TableSource<DayOfWeek>(this, TV_DaysOfWeek, dowlist, "dowcell");
            DOWTableSource.Selected += (sender, args) => 
            {
                Global.SelectedDOW = args.Item;
                PerformSegue("Segue_AdminSiteCalResetToAdminSiteCalResetDOW", this);
            };
            DOWTableSource.GetTextLabel += (sender, args) => 
            {
                DayOfWeek dow = args.Item;
                return dow.ToString();
            };
            DOWTableSource.GetDetailTextLabel += (sender, args) => 
            {
                DayOfWeek dow = args.Item;
                var ou = Global.DOWCalendar.Where(ce1 => ce1.DOW == dow);
                C_CalendarEntry ce = ou.FirstOrDefault();

                string res = ce.SiteIsOpen ? "Open" : "Closed";
                if (ce.SiteIsOpen)
                    res += " [" + ce.OpenTime.ToString("hh:mm p") + " - " + ce.CloseTime.ToString("hh:mm p") + "]";

                return res;
            };
            TV_DaysOfWeek.Source = DOWTableSource;
            TV_DaysOfWeek.ReloadData();
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}