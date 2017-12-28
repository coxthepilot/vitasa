using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using zsquared;
using UIKit;

namespace vitavol
{
    public partial class VC_SCVolunteers : UIViewController
    {
        C_WorkItemsTableSourceSCVolunteers TableSource;

        C_Global Global;

		C_VitaUser LoggedInUser;
		C_VitaSite SelectedSite;
        C_YMD SelectedDate;
        C_WorkShift SelectedShift;

        C_YMD Now;

        public VC_SCVolunteers(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
			SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
            SelectedDate = Global.SelectedDate;
            SelectedShift = Global.SelectedShift;

            Now = C_YMD.Now;

#if DEBUG
            if ((SelectedSite == null)
                || (SelectedDate == null)
                || (LoggedInUser == null)
                || (SelectedShift == null))
                throw new ApplicationException("missing values");
#endif
            // ----- button handlers -----

            B_Back.TouchUpInside += async (sender, e) =>
            {
                // see if any of the items were changed and not saved
                var ou1 = Global.WorkShiftSignUpsOnDate.Where(wssu => wssu.TheSignUp.Dirty);
                if (!ou1.Any())
                {
					PerformSegue("Segue_SCVolunteersToSiteShifts", this);
                    return;
				}
                
                C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
                     "Items Changed",
                     "One or more items changed. Approved them?",
                     C_MessageBox.E_MessageBoxButtons.YesNoCancel);

                if (mbres == C_MessageBox.E_MessageBoxResults.Cancel)
                    return;
                else if (mbres == C_MessageBox.E_MessageBoxResults.No)
                {
					PerformSegue("Segue_SCVolunteersToSiteShifts", this);
					return;
                }

                AI_Busy.StartAnimating();
                EnableUI(false);
                
                bool success = await SaveChangedItems();

                AI_Busy.StopAnimating();
                EnableUI(true);

                if (!success)
                {
                    C_MessageBox.E_MessageBoxResults mbres1 = await C_MessageBox.MessageBox(this,
                                                                            "Error",
                                                                            "Unble to save the work item",
                                                                             C_MessageBox.E_MessageBoxButtons.Ok);
                    return;
                }

                PerformSegue("Segue_SCVolunteersToSiteShifts", this);
            };

            B_ApproveHours.TouchUpInside += async (sender, e) =>
            {
				C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
					 "Approve Items?",
					 "Approve signups on this date?",
					 C_MessageBox.E_MessageBoxButtons.YesNo);

                if (mbres != C_MessageBox.E_MessageBoxResults.Yes)
                    return;

				AI_Busy.StartAnimating();
				EnableUI(false);

				bool success = await SaveChangedItems();

				AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
					C_MessageBox.E_MessageBoxResults mbres1 = await C_MessageBox.MessageBox(this,
																			"Error",
                                                                            "Unble to save the work item(s)",
																			 C_MessageBox.E_MessageBoxButtons.Ok);
					return;
				}
			};

			L_SiteName.Text = SelectedSite.Name;
			L_Date.Text = SelectedDate.ToString("mmm dd, yyyy");
            L_Shift.Text = SelectedShift.OpenTime.ToString("hh:mm p") + " - " + SelectedShift.CloseTime.ToString("hh:mm p");

            AI_Busy.StartAnimating();
            EnableUI(false);

            // ----- initialize the view -----

            Task.Run(async () => 
            {
				// get the list os signups for this shift
                Global.WorkShiftSignUpsOnDate = SelectedShift.SignUps;

				// compute the number needed vs have
				int numBasicHave = 0;
				int numAdvHave = 0;

				int numBasicNeeded = SelectedShift.NumBasicEFilers;
				int numAdvNeeded = SelectedShift.NumAdvEFilers;

				foreach (C_WorkShiftSignUp wi in Global.WorkShiftSignUpsOnDate)
				{
                    if (wi.User.Certification == E_Certification.Basic)
						numBasicHave++;
					else if (wi.User.Certification == E_Certification.Advanced)
						numAdvHave++;
				}

                // get the actual signup for each one so we can modify the number of hours worked
                foreach(C_WorkShiftSignUp wssu in Global.WorkShiftSignUpsOnDate)
                {
                    if (wssu.TheSignUp == null)
                    {
                        C_IOResult ior = await Global.FetchSignUpBySignUpId(LoggedInUser.Token, wssu.SignUpId);
                        if (ior.Success)
                            wssu.TheSignUp = ior.SignUp;
                    }
                }

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

					// set up the view elements
                    L_BasicVolunteers.Text = numBasicHave.ToString() + " of " + numBasicNeeded.ToString();
                    L_AdvancedVolunteers.Text = numAdvHave.ToString() + " of " + numAdvNeeded.ToString();

                    TableSource = new C_WorkItemsTableSourceSCVolunteers(Global, Global.WorkShiftSignUpsOnDate, this);
                    TV_Volunteers.Source = TableSource;
					TV_Volunteers.ReloadData();
                    B_ApproveHours.Enabled = (Global.WorkShiftSignUpsOnDate.Count != 0) && (SelectedDate <= Now);
				}));
            });
        }

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

        private async Task<bool> SaveChangedItems()
        {
            bool res = true;
            try
            {
                foreach (C_WorkShiftSignUp wi in Global.WorkShiftSignUpsOnDate)
                {
                    wi.TheSignUp.Approved = true;
                    C_IOResult ior = await Global.UpdateSignUp(wi.TheSignUp, LoggedInUser.Token);
                    res &= ior.Success;
                    wi.TheSignUp.Dirty = false;
                }
            }
            catch {}

            return res;
        }

        private void EnableUI(bool enable)
        {
            TV_Volunteers.UserInteractionEnabled = enable;
            B_Back.Enabled = enable;

            B_ApproveHours.Enabled = enable && (Global.WorkShiftSignUpsOnDate.Count != 0) && (SelectedDate <= Now);
        }

		public class C_WorkItemsTableSourceSCVolunteers : UITableViewSource
		{
			readonly C_Global Global;
            public List<C_WorkShiftSignUp> SignUps;
			const string CellIdentifier = "TableCell_SignUpsTableSourceSCVolunteers";
            readonly VC_SCVolunteers OurVC;

            public C_WorkItemsTableSourceSCVolunteers(C_Global pac, List<C_WorkShiftSignUp> signups, VC_SCVolunteers ourvc)
			{
				Global = pac;
                SignUps = signups;
                OurVC = ourvc;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = SignUps.Count;

				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_WorkShiftSignUp signup = SignUps[indexPath.Row];

                string s_cert = signup.User.Certification.ToString();

                cell.TextLabel.Text = signup.User.UserName;
                cell.DetailTextLabel.Text = "[" + signup.User.Phone + "] " + signup.User.Certification.ToString() + " - " + signup.TheSignUp.Hours.ToString() + " hours";

				return cell;
			}

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
                Global.VolunteerWorkShiftSignUp = SignUps[indexPath.Row];

				OurVC.PerformSegue("Segue_SCVolunteersToSCVolunteerHours", OurVC);
			}
		}
    }
}