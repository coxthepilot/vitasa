using System;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSite : UIViewController
    {
        C_Global Global;
        C_DateState[] DateState;
        C_CVHelper CollectionViewHelper;

        C_VitaSite SelectedSite;
        C_PersistentSettings Settings;

        public static UIColor Color_OpenDefault = C_Common.SwitchOn;
        public static UIColor Color_ClosedDefault = C_Common.StandardButtonLight;

        public VC_SCSite (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            Settings = new C_PersistentSettings();

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SCSiteToSCVolHours", this);

            B_MonthNext.TouchUpInside += (sender, e) =>
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.AddMonths(1);
                Global.CalendarDate = d;

                L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                DateState = BuildDateStateArray(Global.CalendarDate, SelectedSite);

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

                DateState = BuildDateStateArray(Global.CalendarDate, SelectedSite);

                CollectionViewHelper.SetDayState(DateState, null);

                CV_Grid.ReloadData();
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            Task.Run(async () =>
            {
                SelectedSite = await Global.FetchSiteWithSlug(Global.SelectedSiteSlug);

                DateState = BuildDateStateArray(Global.CalendarDate, SelectedSite);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");
                    L_SiteName.Text = SelectedSite.Name;

                    CollectionViewHelper = new C_CVHelper(C_Common.StandardBackground, CV_Grid, DateState, null, false);
                    CollectionViewHelper.DateTouched += (sender, e) =>
                    {
                        C_DateTouchedEventArgs ea = e;
                        Global.CalendarDate = ea.Date;
                        PerformSegue("Segue_SCSiteToSCSiteDetails", this);
                    };
                }));
            });
        }

        public C_DateState[] BuildDateStateArray(C_YMD Date, C_VitaSite site)
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

                int ourDayOfWeek = (int)ourDate.DayOfWeek;

                C_CalendarEntry sce = site.GetCalendarEntryForDate(ourDate);
                if (sce == null)
                {
                    dayState.NormalColor = C_Common.StandardBackground;
                    dayState.TextColor = UIColor.White;
                    dayState.CanClick = false;
                }
                else if (!sce.SiteIsOpen)
                {
                    dayState.NormalColor = Color_ClosedDefault;
                    dayState.HighlightedColor = Color_ClosedDefault;
                    dayState.TextColor = UIColor.White;
                }
                else
                {
                    dayState.NormalColor = Color_OpenDefault;
                    dayState.HighlightedColor = Color_OpenDefault;
                    dayState.TextColor = UIColor.DarkGray;
                }

                DateState[day - 1] = dayState;
            }

            return DateState;
        }
    }
}