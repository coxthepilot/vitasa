using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_MySignUps : UIViewController
    {
        // Input:
        //   LoggedInUser
        //   SelectedDate
        //   SelectedSite
        //   CalendarDate ???
        //   AllSites
        
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_MySignUps (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_MySignUpsToVolunteerOptions", this);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () => 
            {
				// get all workintents for this user
				List<C_SignUp> OurSignUps = Global.GetSignUpsForUser(Global.LoggedInUserId);

				// make sure we only look at the current items (today and beyond)
				C_YMD today = C_YMD.Now;
                var ou = OurSignUps.Where(wi => wi.Date >= today);
				List<C_SignUp> OurWorkItems2 = ou.ToList();
				// sort to make the list nicer
				OurWorkItems2.Sort(C_SignUp.CompareByDateAscending);

				bool succ1 = await Global.EnsureShiftsInCacheForSignUps(LoggedInUser.Token, OurSignUps);

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                	C_MySignUpsTableSourceWorkIntents ts = new C_MySignUpsTableSourceWorkIntents(Global, OurWorkItems2);
                	TV_SignUps.Source = ts;
                	TV_SignUps.Delegate = new C_MySignUpsTableDelegateWorkIntents(Global, this, ts);
                	TV_SignUps.ReloadData();
                }));
			});
        }

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;
            TV_SignUps.BackgroundColor = C_Common.StandardBackground;
		}

        private void EnableUI(bool en)
        {
            TV_SignUps.UserInteractionEnabled = en;
            B_Back.Enabled = en;
        }

        /// <summary>
        /// Class is the table view delegate to handle slide, aka delete of signup; and the touch of a row
        /// </summary>
        public class C_MySignUpsTableDelegateWorkIntents : UITableViewDelegate
        {
			readonly C_Global Global;
			readonly VC_MySignUps OurVC;
            readonly C_MySignUpsTableSourceWorkIntents TableSource;

            public C_MySignUpsTableDelegateWorkIntents(C_Global global, VC_MySignUps vc, C_MySignUpsTableSourceWorkIntents tsource)
            {
				Global = global;
				OurVC = vc;
                TableSource = tsource;
            }

            public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
                async delegate
                {
                    C_SignUp signupToRemove = TableSource.OurSignUps[indexPath.Row];

                    OurVC.AI_Busy.StartAnimating();
                    OurVC.EnableUI(false);

                    C_VitaUser loggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
					C_VitaSite site = Global.GetSiteNoFetch(signupToRemove.SiteSlug);

					bool success = await signupToRemove.RemoveIntent(loggedInUser.Token);

                    Global.RemoveFromSignUps(signupToRemove);
                    Global.AdjustSiteSchedueCacheForRemovedSignUp(signupToRemove, loggedInUser, site);
                    // remove from the calendar entry, shifts, signups
                    C_CalendarEntry calEntry = site.GetCalendarEntryForDate(signupToRemove.Date);
					foreach(C_WorkShift ws in calEntry.WorkShifts)
                    {
						C_WorkShiftSignUp str = null;
						foreach(C_WorkShiftSignUp wssu in ws.SignUps)
                        {
                            if (wssu.User.UserId == Global.LoggedInUserId)
                            {
                                str = wssu;
                                break;
                            }
                        }
                        if (str != null)
                        {
                            ws.SignUps.Remove(str);

                            break;
                        }
                    }

                    TableSource.OurSignUps.Remove(signupToRemove);

                    OurVC.EnableUI(true);
                    OurVC.AI_Busy.StopAnimating();

                    OurVC.TV_SignUps.ReloadData();
                });

                return new UITableViewRowAction[] { hiButton };
            }

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
                // identify the specific signup
                Global.SelectedSignUp = TableSource.OurSignUps[indexPath.Row];

				// make sure the calendar starts on today if we get there
				Global.CalendarDate = null;

                // these are required by VC_SignUp
                Global.ViewCameFrom = E_ViewCameFrom.MySignUps;
                Global.SelectedDate = Global.SelectedSignUp.Date;
                Global.SelectedSiteSlug = Global.SelectedSignUp.SiteSlug;

				C_WorkShift ws = Global.GetWorkShiftById(Global.SelectedSignUp.ShiftId);
                Global.SelectedShift = ws;

				OurVC.PerformSegue("Segue_MySignUpsToSignUp", OurVC);
			}
        }

		public class C_MySignUpsTableSourceWorkIntents : UITableViewSource
		{
			const string CellIdentifier = "TableCell_SignUpsTableSourceMySignUps";
            public List<C_SignUp> OurSignUps;
            readonly C_Global Global;

            public C_MySignUpsTableSourceWorkIntents(C_Global global, List<C_SignUp> ourWorkItems)
			{
                Global = global;
                OurSignUps = ourWorkItems;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = 0;
				if (OurSignUps != null)
					count = OurSignUps.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

				C_SignUp wi = OurSignUps[indexPath.Row];
                C_WorkShift ws = Global.GetWorkShiftById(wi.ShiftId);

                cell.TextLabel.Text = wi.SiteName;
                cell.DetailTextLabel.Text = wi.Date.ToString() 
                    + " [" + ws.OpenTime.ToString("hh:mm p").Trim() + " - " + ws.CloseTime.ToString("hh:mm p") + "]";

				return cell;
			}
		}
    }
}