using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminMobile : UIViewController
    {
        C_Global Global;

        C_DateState[] DateState;
        C_CVHelper CollectionViewHelper;

        public static UIColor Color_OpenDefault = C_Common.SwitchOn;
        public static UIColor Color_ClosedDefault = C_Common.StandardButtonLight;

        public VC_AdminMobile (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            B_Back.TouchUpInside += (object sender, EventArgs e) => 
                PerformSegue("Segue_AdminMobileToAdminMenu", this);

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

            L_MonthYear.Text = "";

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () =>
            {
                List<C_VitaSite> sites = await Global.FetchAllSites();

                var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
                sites = ou.ToList();
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                DateState = BuildDateStateArray(Global.CalendarDate, sites);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                    CollectionViewHelper = new C_CVHelper(C_Common.StandardBackground, CV_Grid, DateState, null, false);
                    CollectionViewHelper.DateTouched += (sender, e) =>
                    {
                        C_DateTouchedEventArgs ea = e;
                        Global.CalendarDate = ea.Date;
                        PerformSegue("Segue_AdminMobileToAdminMobileDate", this);
                    };
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
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


                // we are looking for
                // - [bkgd]   no calendar event for any site (outside season)
                // - [grey]   no mobile site has an appointment on this date
                // - [orange] only one mobile site has an appointment
                // - [green]  exactly 2 mobile sites have appointments that don't overlap
                // - [red]    more than 2+ in one day or 2+ with overlap(s)

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
                        dayState.NormalColor = C_Common.Color_NoSiteOpen;
                        dayState.TextColor = UIColor.White;
                        dayState.CanClick = false;
                    }
                    else
                    {
                        List<C_CalendarEntry> ceOpenOnOurDate = ou.ToList();
                        if (ceOpenOnOurDate.Count == 1)
                        {
                            dayState.NormalColor = C_Common.Color_OneAppt;
                            dayState.HighlightedColor = C_Common.SwitchOn;
                            dayState.TextColor = UIColor.White;
                        }
                        else
                        { // 2 or more
                            if ((ceOpenOnOurDate.Count == 2) && !C_CalendarEntry.Overlap(ceOpenOnOurDate))
                            {
                                dayState.NormalColor = C_Common.Color_TwoAppt;
                                dayState.HighlightedColor = UIColor.Green;
                                dayState.TextColor = UIColor.White;
                            }
                            else
                            {
                                dayState.NormalColor = C_Common.Color_BadAppt;
                                dayState.HighlightedColor = UIColor.Red;
                                dayState.TextColor = UIColor.White;
                                dayState.ShowBox = true;
                            }
                        }
                    }
                }

                DateState[day - 1] = dayState;
            }

            return DateState;
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}