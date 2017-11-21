using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSiteOnDate : UIViewController
    {
		// We got here because the site coordinator wants to manage the calendar
        //  for a site on a date.

		C_Global Global;

        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;
        C_YMD SelectedDate;
        C_CalendarEntry SelectedCalendarEntry;

        public VC_SCSiteOnDate(IntPtr handle) : base(handle)
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
            SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(SelectedDate);
#if DEBUG
            if ((LoggedInUser == null)
                || (SelectedSite == null)
                || (SelectedDate == null)
                || (SelectedCalendarEntry == null)
               )
                throw new ApplicationException("missing value(s)");
#endif
            L_SiteName.Text = SelectedSite.Name;
            L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");
            B_SaveCalendarException.Enabled = CalendarOrShiftsAreDirty(SelectedCalendarEntry);

			SW_IsOpen.ValueChanged += (sender, e) =>
			{
                SelectedCalendarEntry.Dirty = true;
                B_SaveCalendarException.Enabled = true;
			};

			B_Back.TouchUpInside += async (sender, e) =>
			{
                if (!SelectedCalendarEntry.Dirty)
                {
					PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
                    return;
				}

                C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(
                    this,
                    "Save Changes?",
                    "Changes have been made. Save them?",
                    C_MessageBox.E_MessageBoxButtons.YesNo);

                if (mbres != C_MessageBox.E_MessageBoxResults.Yes)
                {
					PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
                    return;
				}

				EnableUI(false);
				AI_Busy.StartAnimating();

				bool success = await UpdateCalendarAndShifts();

				AI_Busy.StopAnimating();
                EnableUI(true);

                if (success)
					PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
                
                C_MessageBox.E_MessageBoxResults mbres1 = await C_MessageBox.MessageBox(this, 
                                                                         "Error", 
                                                                         "Unable to create the calendar entry.", 
                                                                         C_MessageBox.E_MessageBoxButtons.Ok);
			};

			B_SaveCalendarException.TouchUpInside += async (sender, e) =>
			{
				AI_Busy.StartAnimating();
				EnableUI(false);

                bool success = await UpdateCalendarAndShifts();

				AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, 
                                                                             "Error", 
                                                                             "Unable to update the calendar entry.", 
                                                                             C_MessageBox.E_MessageBoxButtons.Ok);
					return;
				}

				PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
			};

            SW_IsOpen.On = SelectedCalendarEntry.SiteIsOpen;

            AI_Busy.StartAnimating();

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

                    // setup the table view with the list of names
                    C_ShiftsTableSource signUpTableSource = new C_ShiftsTableSource(SelectedCalendarEntry, Global, this, "Segue_SCSiteOnDateToShiftDetails");
                    TV_Shifts.Source = signUpTableSource;
                    TV_Shifts.ReloadData();
                }));
			});
		}

        private async Task<bool> UpdateCalendarAndShifts()
        {
			bool success = true;
			try
			{
				SelectedCalendarEntry.SiteIsOpen = SW_IsOpen.On;
                // update the entry
                if (SelectedCalendarEntry.Dirty)
    				success &= await SelectedSite.UpdateCalendarEntry(LoggedInUser.Token, SelectedCalendarEntry);

				if (success)
				{
					// now update all of the shifts
					foreach (C_WorkShift ws in SelectedCalendarEntry.WorkShifts)
					{
                        if (ws.Dirty)
                        {
                            success &= await Global.UpdateShift(LoggedInUser.Token, SelectedSite.Slug, ws, SelectedCalendarEntry);
                            if (!success)
                                break;
                        }
					}
				}

                // if we have already pre-fetched the site schedule for the site, we need to adjust
                // the choice for now is to simple remove from the cache and force a re-fetch
                Global.RemoveSiteFromSiteCache(SelectedSite.Slug);
			}
			catch (Exception e)
			{
                Console.WriteLine(e.Message);
				success = false;
			}

            return success;
		}

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

        private bool CalendarOrShiftsAreDirty(C_CalendarEntry calEntry)
        {
            bool res = calEntry.Dirty;

            foreach (C_WorkShift ws in calEntry.WorkShifts)
                res |= ws.Dirty;

            return res;
        }

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_SaveCalendarException.Enabled = en && CalendarOrShiftsAreDirty(SelectedCalendarEntry);
            SW_IsOpen.Enabled = en;
            TV_Shifts.UserInteractionEnabled = en;
        }
	}
}