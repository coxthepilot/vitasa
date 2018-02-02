using Foundation;
using System;
using System.Collections.Generic;
using UIKit;
using MessageUI;
using System.Threading.Tasks;

using zsquared;

namespace vitaadmin
{
    public partial class VC_CheckSignUps : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_CheckSignUps (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_CheckSignUpsToMain", this);
            };

            AI_Busy.StartAnimating();

            Task.Run(async () => 
            {
                List<C_SignUp> BadSignUps = new List<C_SignUp>();

                try
                {
                    // this should get all signups for all users
                    List<C_VitaSite> Sites = await Global.FetchAllSites(LoggedInUser.Token);

                    List<C_VitaUser> Users = await Global.FetchAllUsers(LoggedInUser.Token);

                    // go through the users, for volunteers, look at their signups
                    foreach (C_VitaUser user in Users)
                    {
                        if (!user.HasVolunteer)
                            continue;

                        // get all signups for this user
                        List<C_SignUp> signUpsForUser = Global.GetSignUpsForUser(user.id);
                        // make sure we have shifts for these signups
                        bool success = await Global.EnsureShiftsInCacheForSignUps(LoggedInUser.Token, signUpsForUser);

                        // for each of signups, make sure they are still valid
                        foreach (C_SignUp signUp in signUpsForUser)
                        {
                            C_WorkShift ws = Global.GetWorkShiftById(signUp.ShiftId);
                            if (ws == null)
                                BadSignUps.Add(signUp);
                            else
                            {
                                C_VitaSite site = Global.GetSiteFromSlugNoFetch(ws.SiteSlug);
                                C_CalendarEntry ce = site.GetCalendarEntryById(ws.CalendarId);
                                if ((ce == null) || (!ce.SiteIsOpen))
                                    BadSignUps.Add(signUp);
                            }
                        }
                    }
                }
                catch (Exception e) 
                {
                    Console.WriteLine(e.Message);
                }

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(async () =>
                {
                    AI_Busy.StopAnimating();

                    C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Analysis Complete", "We found " + BadSignUps.Count.ToString() + " errors.", C_MessageBox.E_MessageBoxButtons.Ok);

                    // populate the list with the bad signups
                    // or put up a message if there are none...

                    C_WorkItemsTableSource ts = new C_WorkItemsTableSource(Global, BadSignUps);
                    TV_SignUps.Source = ts;
                    TV_SignUps.ReloadData();
                }));
            });
        }

        public class C_WorkItemsTableSource : UITableViewSource
        {
            const string CellIdentifier = "TableCell_WorkItemsTableSource";
            public List<C_SignUp> OurWorkItems;
            readonly C_Global Global;

            public C_WorkItemsTableSource(C_Global global, List<C_SignUp> ourWorkitems)
            {
                Global = global;
                OurWorkItems = ourWorkitems;
            }

            public override nint RowsInSection(UITableView tableview, nint section)
            {
                int count = 0;
                if (OurWorkItems != null)
                    count = OurWorkItems.Count;
                return count;
            }

            public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

                //---- if there are no cells to reuse, create a new one
                if (cell == null)
                    cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_SignUp workitem = OurWorkItems[indexPath.Row];

                cell.DetailTextLabel.Text = workitem.Date.ToString("mmm dd, yyyy") + " at " + workitem.SiteName;

                C_VitaUser user = Global.GetUserFromCacheNoFetch(workitem.UserId);
                if (user == null)
                    cell.TextLabel.Text = workitem.UserId.ToString();
                else
                    cell.TextLabel.Text = user.Name;

                if (user == null)
                {
                    Task.Run(async () =>
                    {
                        C_VitaUser u = await Global.GetUserFromCache(workitem.UserId);

                        UIApplication.SharedApplication.InvokeOnMainThread(
                        new Action(() =>
                        {
                            if (u != null)
                                cell.TextLabel.Text = u.Name;
                        }));
                    });
                }

                return cell;
            }
        }

    }
}