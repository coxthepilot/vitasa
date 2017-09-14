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

			// set the standard background color
			View.BackgroundColor = C_Global.StandardBackground;

            Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDateForUser(
                Global.SelectedSite.Slug,
                Global.SelectedDate,
                -1,
                C_Global.E_SiteCondition.Any);

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

            B_SignMeUp.TouchUpInside += async (sender, e) => 
            {
                // if sign me up, the add to the list, and go back to MySignUps
                // if remove me, then remove from list, and go back to MySignUps
                if (SignUpListHasOurUser)
                {
					// remove the signup for this user
                    var ourUserSignup = Global.WorkItemsOnSiteOnDate.Where(wix => wix.UserId == Global.LoggedInUser.id);

                    // if we didn't find the signup to remove, then just return
                    if (!ourUserSignup.Any())
                        return;

                    AI_Busy.StartAnimating();

					C_WorkItem wi = ourUserSignup.First();

                    bool success = await wi.RemoveIntent(Global);

                    AI_Busy.StopAnimating();

                    if (!success)
                    {
                        Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this,
                                         "Error",
                                         "Remove SignUp failed",
                                         Tools.E_MessageBoxButtons.Ok);
                    }
                    else
                        PerformSegue("Segue_SignUpToMySignUps", this);
                }
                else
                {
					// add
					AI_Busy.StartAnimating();
                    EnableUI(false);

					C_WorkItem wi = new C_WorkItem(Global.SelectedSite.Slug, Global.SelectedDate, Global.LoggedInUser.id, 0);

                    bool success = await wi.AddIntent(Global, Global.LoggedInUser.id);

					AI_Busy.StopAnimating();
                    EnableUI(true);

					if (!success)
                    {
                        Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this,
                                         "Error",
                                         "Add SignUp failed",
                                         Tools.E_MessageBoxButtons.Ok);
                    }
					else
						PerformSegue("Segue_SignUpToMySignUps", this);
                }
            };

            B_GetDirections.TouchUpInside += async (sender, e) => 
            {
                // the destination is the site the user selected
                // the source address is unspecified which makes it the user's current location
                string destinationAddress = Global.SelectedSite.Street + ", "
                                                  + Global.SelectedSite.City + " "
                                                  + Global.SelectedSite.State;
                string url = "http://maps.apple.com/?daddr=" + destinationAddress;  // + "&saddr=<destination>";
                url = url.Replace(" ", "%20");
				if (UIApplication.SharedApplication.CanOpenUrl(new NSUrl(url)))
					UIApplication.SharedApplication.OpenUrl(new NSUrl(url));
                
				else
				{
                    Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this,
                                    "No maps app",
                                     "Maps app not supported on this device",
                                     Tools.E_MessageBoxButtons.Ok);
				}           
            };

            B_SaveHours.TouchUpInside += async (sender, e) => 
            {

				// remove the signup for this user
				var ourUserSignup = Global.WorkItemsOnSiteOnDate.Where(wix => wix.UserId == Global.LoggedInUser.id);

                // if we didn't find the signup to save, then just return
                if (!ourUserSignup.Any())
                {
					Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this,
									 "Error",
									 "Updating hours failed.",
									 Tools.E_MessageBoxButtons.Ok);
					return;
                }

				C_WorkItem wi = ourUserSignup.First();

                try { wi.Hours = Convert.ToSingle(TB_Hours.Text); }
                catch {}

				AI_Busy.StartAnimating();
                EnableUI(false);

				bool success = await wi.UpdateIntent(Global);

				AI_Busy.StopAnimating();
                EnableUI(true);
                TB_Hours.ResignFirstResponder();

				if (!success)
				{
					Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this,
									 "Error",
									 "Updating hours failed.",
									 Tools.E_MessageBoxButtons.Ok);
				}
			};

            AI_Busy.StartAnimating();
            EnableUI(false);

			Task.Run(async () =>
            {
                // Build a list of user names to display. Keep watch for our user in the list
                List<string> UserNames = new List<string>();
				SignUpListHasOurUser = false;
                C_WorkItem ourUserWorkItem = null;

                foreach(C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
                {
                    C_VitaUser user = await Global.GetUserDetails(wi.UserId);
                    UserNames.Add(user.Name);

                    if (wi.UserId == Global.LoggedInUser.id)
                    {
                        SignUpListHasOurUser = true;
                        ourUserWorkItem = wi;
                    }
                }

                // now we can do all the UI updating (and on the UI thread)
				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    bool en = (ourUserWorkItem != null) && (!ourUserWorkItem.Approved);
                    TB_Hours.Enabled = en;
                    B_SaveHours.Enabled = en;
                    if (ourUserWorkItem != null)
                        TB_Hours.Text = ourUserWorkItem.Hours.ToString();

                    // setup the table view with the list of names
					C_SignUpTableSourceSignUp signUpTableSource = new C_SignUpTableSourceSignUp(UserNames);
					TV_Users.Source = signUpTableSource;
					TV_Users.ReloadData();

					string t = SignUpListHasOurUser ? "Remove My Sign Up" : "Sign Me Up";
					B_SignMeUp.SetTitle(t, UIControlState.Normal);

					int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
					C_HMS openTime = new C_HMS(Global.SelectedSite.SiteCalendar[dayOfWeek].OpenTime);
					C_HMS closeTime = new C_HMS(Global.SelectedSite.SiteCalendar[dayOfWeek].CloseTime);

					L_Site.Text = Global.SelectedSite.Name;
					L_DateAndTime.Text = Global.SelectedDate.ToString("mmm dd, yyyy") 
                        + " [" + openTime.ToString("hh:mm") + " - " + closeTime.ToString("hh:mm") + "]";

                    L_Address.Text = Global.SelectedSite.Street;
                    L_CityStateZip.Text = Global.SelectedSite.City + ", " + Global.SelectedSite.State + " " + Global.SelectedSite.Zip;

                    B_SignMeUp.Enabled = true;
                    B_GetDirections.Enabled = true;
				}));
			});
		}

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_SignMeUp.Enabled = en;
            B_GetDirections.Enabled = en;
            TV_Users.UserInteractionEnabled = en;
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