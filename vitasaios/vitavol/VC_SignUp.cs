using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

using zsquared;

namespace vitavol
{
    // --------- View signups for date and site with option to signup ----------
    //
    // Input: SelectedDate
    //        SelectedSite
    //        WorkItemsOnDate (optional)
    //        DetailsCameFrom
    //        LoggedInUser
    //
    public partial class VC_SignUp : UIViewController
    {
		C_Global Global;
        bool SignUpListHasOurUser;

        public VC_SignUp (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			if ((Global.SelectedDate == null)
				|| (Global.SelectedSite == null)
				|| (Global.WorkItemsOnSiteOnDate == null)
				|| (Global.LoggedInUser == null))
				throw new ApplicationException("required elements not present");

			B_Back.TouchUpInside += (sender, e) => 
            {
                switch (Global.DetailsCameFrom)
                {
                    case E_CameFrom.List:
                        PerformSegue("Segue_SignUpToSitesOnDateList", this);
                        break;
                    case E_CameFrom.Map:
                        PerformSegue("Segue_SignUpToSitesOnDateMap", this);
                        break;
                    case E_CameFrom.MySignUps:
                        PerformSegue("Segue_SignUpToMySignUps", this);
                        break;
                }
            };

            B_SignMeUp.TouchUpInside += (sender, e) => 
            {
                // if sign me up, the add to the list, and go back to MySignUps
                // if remove me, then remove from list, and go back to MySignUps
                if (SignUpListHasOurUser)
                {
					// remove
					Task.Run(async () =>
                    {
                        // find the signup for this user
                        var ourUserSignup = Global.WorkItemsOnSiteOnDate.Where(wi => wi.UserId == Global.LoggedInUser.id);

                        if (ourUserSignup.Any())
                        {
                            //bool s = await Global.SelectedSite.wor
                            C_WorkItem wi = (C_WorkItem)ourUserSignup.FirstOrDefault();
                            bool success = await Global.LoggedInUser.RemoveIntent(wi);
                            Global.SelectedSite.WorkIntents.Remove(wi);

                            UIApplication.SharedApplication.InvokeOnMainThread(
                            new Action(() =>
                            {
                                if (!success)
                                    Tools.MessageBox(this, 
                                                     "Error", 
                                                     "Remove SignUp failed",
                                                     Tools.E_MessageBoxButtons.Ok);
                                else
                                    PerformSegue("Segue_SignUpToMySignUps", this);
                            }));
                        }
					});
                }
                else
                {
					// add
					Task.Run(async () => 
                    {
                        C_WorkItem wi = new C_WorkItem(Global.SelectedSite.Slug, Global.SelectedDate, Global.LoggedInUser.id, 0);

                        bool success = await Global.LoggedInUser.AddIntent(wi);

						UIApplication.SharedApplication.InvokeOnMainThread(
						new Action(() =>
						{
							if (!success)
								Tools.MessageBox(this, 
                                                 "Error", 
                                                 "Add SignUp failed",
                                                 Tools.E_MessageBoxButtons.Ok);
							else
								PerformSegue("Segue_SignUpToMySignUps", this);
						}));
					});
                }
            };

            B_GetDirections.TouchUpInside += (sender, e) => 
            {
                // todo: connect to the apple maps for directions
            };

			Task.Run(async () =>
            {
                // Build a list of user names to display. Keep watch for our user in the list
                List<string> UserNames = new List<string>();
				SignUpListHasOurUser = false;

                foreach(C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
                {
                    C_VitaUser user = await C_VitaUser.FetchUser(Global.LoggedInUser.Token, wi.UserId);
                    UserNames.Add(user.Name);

                    SignUpListHasOurUser |= wi.UserId == Global.LoggedInUser.id;
                }

                // now we can do all the UI updating (and on the UI thread)
				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
                    // setup the table view with the list of names
					C_SignUpTableSourceSignUp signUpTableSource = new C_SignUpTableSourceSignUp(UserNames);
					TV_Users.Source = signUpTableSource;
					TV_Users.ReloadData();

					string t = SignUpListHasOurUser ? "Remove My Sign Up" : "Sign Me Up";
					B_SignMeUp.SetTitle(t, UIControlState.Normal);

                    L_Site.Text = Global.SelectedSite.Name;
                    int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
					L_DateAndTime.Text = Global.SelectedDate.ToString("mmm dd, yyyy") 
                        + " from " + Global.SelectedSite.SiteCalendar[dayOfWeek].OpenTime + " to " + Global.SelectedSite.SiteCalendar[dayOfWeek].CloseTime;

                    L_Address.Text = Global.SelectedSite.Street;
                    L_CityStateZip.Text = Global.SelectedSite.City + ", " + Global.SelectedSite.State + " " + Global.SelectedSite.Zip;

                    B_SignMeUp.Enabled = true;
                    B_GetDirections.Enabled = true;
				}));
			});
		}

		public class C_SignUpTableSourceSignUp : UITableViewSource
		{
            readonly List<string> UserNames;
            const string CellIdentifier = "TableCell_SignUpTableSource";

			public C_SignUpTableSourceSignUp(List<string> userNames)
			{
                UserNames = userNames;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = UserNames.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                string name = UserNames[indexPath.Row];

                cell.TextLabel.Text = name;

				return cell;
			}
		}
    }
}