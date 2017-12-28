using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using zsquared;

namespace vitavol
{
    public partial class VC_VolSiteShifts : UIViewController
    {
		C_Global Global;
		C_VitaUser LoggedInUser;

		C_YMD SelectedDate;
        C_VitaSite SelectedSite;

        C_CalendarEntry SelectedCalendarEntry;

		public VC_VolSiteShifts (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
			SelectedDate = Global.SelectedDate;
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
			SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(SelectedDate);
#if DEBUG
			if ((SelectedDate == null)
				|| (LoggedInUser == null)
                || (SelectedSite == null)
                || (SelectedCalendarEntry == null)
			   )
				throw new ApplicationException("missing values");
#endif
            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_VolSiteShiftsToSitesOnDateList", this);
            };

            L_Date.Text = SelectedDate.ToString("mmm dd, yyyy");
            L_Site.Text = SelectedSite.Name;

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
                    
                    TV_Shifts.Source = new C_TableSourceShiftsList(Global, this, SelectedCalendarEntry.WorkShifts, LoggedInUser);
                    TV_Shifts.ReloadData();
                }));
			});
		}
	
        public override void ViewDidAppear(bool animated)
		{
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

		public class C_TableSourceShiftsList : UITableViewSource
		{
			readonly C_Global Global;
			readonly UIViewController ourVC;
            readonly List<C_WorkShift> Shifts;
			readonly C_VitaUser User;

			const string CellIdentifier = "TableCell";

			public C_TableSourceShiftsList(C_Global pac, UIViewController vc, List<C_WorkShift> shifts, C_VitaUser user)
			{
				Global = pac;
				ourVC = vc;
                Shifts = shifts;
				User = user;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = Shifts.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one ---
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_WorkShift shift = Shifts[indexPath.Row];

                cell.TextLabel.Text = shift.OpenTime.ToString("hh:mm p") + " - " + shift.CloseTime.ToString("hh:mm p");

				// figure out if our user is already signed up for a shift on this date
				List<C_SignUp> wiList = Global.GetSignUpsByShiftId(shift.id);
				var ou = wiList.Where(wi => wi.UserId == Global.LoggedInUserId);
                bool ourUserIsSignedUp = ou.Any();

                C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, shift.SiteSlug);
                int numHave = 0;
                int numNeeded = 0;
                foreach (C_SiteScheduleShift sss in ss.Shifts)
                {
                    if ((sss.OpenTime == shift.OpenTime) && (sss.CloseTime == shift.CloseTime))
                    {
                        numNeeded += User.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
                        numHave += User.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
                    }
                }
                int numEF = numNeeded - numHave;

				if (ourUserIsSignedUp)
					cell.DetailTextLabel.Text = "Already signed up for this shift.";
				else
					cell.DetailTextLabel.Text = numEF.ToString() + " needed for this shift.";


				return cell;
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
                C_WorkShift shift = Shifts[indexPath.Row];

				C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, shift.SiteSlug);
				int numHave = 0;
				int numNeeded = 0;
				foreach (C_SiteScheduleShift sss in ss.Shifts)
				{
					if ((sss.OpenTime == shift.OpenTime) && (sss.CloseTime == shift.CloseTime))
					{
						numNeeded += User.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
						numHave += User.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
					}
				}
				int numEF = numNeeded - numHave;
                if (numEF == 0)
                    return;

				Global.SelectedSignUp = new C_SignUp(shift.SiteSlug, Global.SelectedDate, Global.LoggedInUserId, 0)
				{
					id = -1,
					SiteName = Global.GetSiteFromSlugNoFetch(shift.SiteSlug).Name,
					ShiftId = shift.id
				};
                Global.SelectedShift = shift;

				Global.ViewCameFrom = E_ViewCameFrom.List;

				ourVC.PerformSegue("Segue_VolSiteShiftsToSignUp", ourVC);
			}
		}

	}
}