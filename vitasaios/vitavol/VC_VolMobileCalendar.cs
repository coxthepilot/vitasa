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
    public partial class VC_VolMobileCalendar : UIViewController
    {
        C_Global Global;
        C_DateState[] DateState;
        C_CVHelper CollectionViewHelper;

        C_PersistentSettings Settings;

        public VC_VolMobileCalendar (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolMobileCalendarToVolHome", this);

            B_Done.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolMobileCalendarToVolHome", this);

            B_MonthNext.TouchUpInside += (sender, e) =>
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.AddMonths(1);
                Global.CalendarDate = d;

                L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                List<C_VitaSite> sites = Global.GetAllSitesNoFetch();
                var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
                sites = ou.ToList();
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                DateState = BuildDateStateArray(Global.CalendarDate, sites);

                CollectionViewHelper.SetDayState(DateState, null);

                CV_Grid.ReloadData();
            };

            B_MonthPrevious.TouchUpInside += (sender, e) =>
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.SubtractMonths(1);
                Global.CalendarDate = d;

                L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                List<C_VitaSite> sites = Global.GetAllSitesNoFetch();
                var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
                sites = ou.ToList();
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                DateState = BuildDateStateArray(Global.CalendarDate, sites);

                CollectionViewHelper.SetDayState(DateState, null);

                CV_Grid.ReloadData();
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
            View.BackgroundColor = C_Common.StandardBackground;

            CV_Grid.BackgroundColor = C_Common.StandardBackground;

            Task.Run(async () =>
            {
                List<C_VitaSite> sites = await Global.FetchAllSites();

                var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
                sites = ou.ToList();
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                DateState = BuildDateStateArray(Global.CalendarDate, sites);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                    CollectionViewHelper = new C_CVHelper(C_Common.StandardBackground, CV_Grid, DateState, null, false);
                    CollectionViewHelper.DateTouched += (sender, e) =>
                    {
                        C_DateTouchedEventArgs ea = e;
                        Global.CalendarDate = ea.Date;
                        PerformSegue("Segue_VolMobileCalendarToVolMobileCalOnDate", this);
                    };
                }));
            });

        }

        public C_DateState[] BuildDateStateArray(C_YMD Date, List<C_VitaSite> sites)
        {
            int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

            // determine the state of each day in the month
            DateState = new C_DateState[daysInMonth];

            for (int day = 1; day <= daysInMonth; day++)
            {
                C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

                C_DateState dayState = new C_DateState(ourDate)
                {
                    BoxColor = UIColor.Black
                };

                // build a list of all calendar entries for this date
                List<C_CalendarEntry> calendarEntries = new List<C_CalendarEntry>();
                foreach (C_VitaSite site in sites)
                {
                    foreach (C_CalendarEntry ce in site.SiteCalendar)
                    {
                        if (ce.Date == ourDate)
                            calendarEntries.Add(ce);
                    }
                }

                // we are looking for
                // - [bkgd]   no calendar event for any site (outside season)
                // - [grey]   no mobile site has an appointment on this date
                // - [orange] only one mobile site has an appointment
                // - [green]  exactly 2 mobile sites have appointments that don't overlap
                // - [green/boxed]    more than 2 one one day or 2 that overlap

                if (calendarEntries.Count == 0)
                {
                    dayState.NormalColor = C_Common.StandardBackground;
                    dayState.TextColor = UIColor.White;
                    dayState.CanClick = false;
                }
                else
                {
                    // see how many are open
                    var ou = calendarEntries.Where(ce => ce.SiteIsOpen);
                    if (!ou.Any())
                    {
                        dayState.NormalColor = C_Common.ClosedDefault;
                        dayState.HighlightedColor = C_Common.ClosedDefault;
                        dayState.TextColor = UIColor.White;
                    }
                    else
                    {
                        List<C_CalendarEntry> ceOpenOnOurDate = ou.ToList();
                        if (ceOpenOnOurDate.Count == 1)
                        {
                            dayState.NormalColor = C_Common.OpenDefault;
                            dayState.HighlightedColor = C_Common.OpenDefault;
                            dayState.TextColor = UIColor.DarkGray;
                        }
                        else
                        { // 2 or more
                            // todo: need another color choice here
                            dayState.NormalColor = C_Common.OpenDefault;
                            dayState.HighlightedColor = C_Common.OpenDefault;
                            dayState.TextColor = UIColor.DarkGray;

                            if (!((ceOpenOnOurDate.Count == 2) && !Overlap(ceOpenOnOurDate)))
                                dayState.BoxColor = UIColor.Black;
                        }
                    }
                }

                DateState[day - 1] = dayState;
            }

            return DateState;
        }

        private bool Overlap(List<C_CalendarEntry> ceList)
        {
            bool res = false;
            for (int ceix = 0; ceix != ceList.Count; ceix++)
            {
                C_CalendarEntry ce = ceList[ceix];

                // with this one, see if any other entry overlaps
                for (int cetix = 0; cetix != ceList.Count; cetix++)
                {
                    C_CalendarEntry cet = ceList[cetix];

                    if (ceix != cetix)
                    {
                        res = ((ce.OpenTime >= cet.OpenTime) && (ce.OpenTime < cet.CloseTime))
                            || ((ce.CloseTime > cet.OpenTime) && (ce.CloseTime <= cet.CloseTime));
                    }
                    if (res)
                        break;
                }
                if (res)
                    break;
            }

            return res;
        }

    }
}