using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SiteShifts : UIViewController
    {
        C_Global Global;

        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;
        C_YMD SelectedDate;

        public VC_SiteShifts(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);
            SelectedDate = Global.SelectedDate;

#if DEBUG
            if ((SelectedSite == null)
                || (SelectedDate == null)
                || (LoggedInUser == null))
                throw new ApplicationException("missing values");
#endif
            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SiteShiftsToSCSiteVolCal", this);
            };

            C_CalendarEntry SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(SelectedDate);

            L_SiteName.Text = SelectedSite.Name;
            L_Date.Text = SelectedDate.ToString("mmm dd, yyyy");

			AI_Busy.StartAnimating();
            EnableUI(false);

			Task.Run(async () =>
			{
				if (!SelectedCalendarEntry.HaveShifts)
				{
                    List<C_WorkShift> shifts = await Global.FetchAllShiftsForCalendarEntry(LoggedInUser.Token, SelectedSite.Slug, SelectedCalendarEntry);
				}

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					AI_Busy.StopAnimating();
                    EnableUI(true);

					// setup the table view with the list of names
                    C_ShiftsTableSource signUpTableSource = new C_ShiftsTableSource(SelectedCalendarEntry, Global, this, "Segue_SiteShiftsToSCVolunteers");
					TV_Shifts.Source = signUpTableSource;
					TV_Shifts.ReloadData();
				}));
			});
		}

		public override void ViewDidAppear(bool animated)
		{
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

        public void EnableUI(bool en)
        {
            TV_Shifts.UserInteractionEnabled = en;
            B_Back.Enabled = en;
        }
	}
}