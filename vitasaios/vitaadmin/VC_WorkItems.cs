using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

using UIKit;
using zsquared;

namespace vitaadmin
{
    public partial class VC_WorkItems : UIViewController
    {
		C_Global Global;
		C_VitaUser LoggedInUser;
        bool Dirty;
		
        public VC_WorkItems (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            Dirty = false;

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SC_SortType.ValueChanged += (sender, e) => 
            {
                int sortBy = (int)SC_SortType.SelectedSegment;

                if (sortBy == 0)
                    Global.SignUpsList.Sort(C_SignUp.CompareByDateThenSiteAscending);
                else
                    Global.SignUpsList.Sort(C_SignUp.CompareBySiteThenDateAscending);

                BuildWorkItemsTableSource();
            };

            B_Back.TouchUpInside += (sender, e) =>
            {
                switch (Global.ViewCameFrom)
                {
                    case E_ViewCameFrom.Main:
                        PerformSegue("Segue_WorkItemsToMain", this);
                        break;
                    case E_ViewCameFrom.Users:
                        PerformSegue("Segue_SignUpsToUsers", this);
                        break;
                    case E_ViewCameFrom.SCSites:
                        PerformSegue("Segue_SignUpsToSites", this);
                        break;
                    case E_ViewCameFrom.SCSite:
                        PerformSegue("Segue_WorkItemsToSite", this);
                        break;
                    case E_ViewCameFrom.User:
                        PerformSegue("Segue_SignUpsToUser", this);
                        break;
                }
            };

			AI_Busy.StartAnimating();
			EnableUI(false);

			Task.Run(async () =>
			{
				// we make sure all sites have been read in, which gives us a complete list of all work items
				//List<C_VitaSite> sitesList = await Global.FetchAllSites();
                List<C_VitaUser> usersList = await Global.FetchAllUsers(LoggedInUser.Token);

                Global.SignUpsList.Sort(C_SignUp.CompareByDateThenSiteAscending);

                bool success = await Global.EnsureShiftsInCacheForSignUps(LoggedInUser.Token, Global.SignUpsList);

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					AI_Busy.StopAnimating();
					EnableUI(true);

                    BuildWorkItemsTableSource();
				}));
			});
		}

        private void BuildWorkItemsTableSource()
        {
            int userid = Global.SelectedUser == null ? -1 : Global.SelectedUser.id;

            List<C_SignUp> OurWorkItems = new List<C_SignUp>();
            foreach (C_SignUp su in Global.SignUpsList)
            {
                if (((userid == -1) || (userid == su.UserId))
                    && ((Global.SelectedSiteSlug == null) || (su.SiteSlug == Global.SelectedSiteSlug)))
                    OurWorkItems.Add(su);
            }

            List<C_SectionInfo> Sections = new List<C_SectionInfo>();

            int sortBy = (int)SC_SortType.SelectedSegment;
            if (sortBy == 0)
            {
                List<C_YMD> uniqueDates = new List<C_YMD>();
                foreach(C_SignUp su in OurWorkItems)
                {
                    C_YMD date = su.Date;
                    if (!uniqueDates.Contains(date))
                        uniqueDates.Add(date);
                }
                uniqueDates.Sort(C_YMD.CompareYMD);

                foreach(C_YMD date in uniqueDates)
                {
                    var ou = OurWorkItems.Where(su => su.Date == date);
                    List<C_SignUp> signupsOnDate = ou.ToList();
                    signupsOnDate.Sort(C_SignUp.CompareByDateThenSiteAscending);

                    C_SectionInfo sectionInfo = new C_SectionInfo
                    {
                        Name = date.ToString("yyyy-mm-dd"),
                        SignUps = signupsOnDate,
                        Elements = new List<string>()
                    };

                    foreach (C_SignUp su in signupsOnDate)
                    {
                        C_WorkShift ws = Global.GetWorkShiftById(su.ShiftId);
                        C_VitaUser u = Global.GetUserFromCacheNoFetch(su.UserId);
                        string name = u != null ? u.Name : su.UserId.ToString();
                        string shifts = ws != null ? " [" + ws.OpenTime.ToString("hh:mm") + " : " + ws.CloseTime.ToString("hh:mm") + "]" : "";

                        sectionInfo.Elements.Add(name + " - " + su.SiteName + shifts);
                    }

                    Sections.Add(sectionInfo);
                }
            }
            else
            {
                List<string> uniqueSites = new List<string>();
                foreach (C_SignUp su in OurWorkItems)
                    if (!uniqueSites.Contains(su.SiteName))
                        uniqueSites.Add(su.SiteName);
                uniqueSites.Sort();

                foreach(string site in uniqueSites)
                {
                    var ou = OurWorkItems.Where(su => su.SiteName == site);
                    List<C_SignUp> signupsAtSite = ou.ToList();
                    signupsAtSite.Sort(C_SignUp.CompareBySiteThenDateAscending);

                    C_SectionInfo sectionInfo = new C_SectionInfo
                    {
                        Name = site,
                        SignUps = signupsAtSite,
                        Elements = new List<string>()
                    };

                    foreach (C_SignUp su in signupsAtSite)
                    {
                        C_WorkShift ws = Global.GetWorkShiftById(su.ShiftId);
                        C_VitaUser u = Global.GetUserFromCacheNoFetch(su.UserId);
                        string name = u != null ? u.Name : su.UserId.ToString();
                        string shifts = ws != null ? " [" + ws.OpenTime.ToString("hh:mm") + " : " + ws.CloseTime.ToString("hh:mm") + "]" : "";

                        sectionInfo.Elements.Add(name + " - " + su.SiteName + shifts);
                    }

                    Sections.Add(sectionInfo);
                }
            }

            C_WorkItemsTableSource ts = new C_WorkItemsTableSource(Sections);
            TV_WorkItems.Source = ts;
            TV_WorkItems.Delegate = new C_WorkItemsTableDelegate(Global, this, ts);
            TV_WorkItems.ReloadData();
        }

        private void PopulateWorkItem()
        {
            C_SignUp wi = Global.VolunteerSignUp;
            if (wi == null)
                return;

            L_Site.Text = wi.SiteName;
            L_Date.Text = wi.Date.ToString("mmm dd, yyyy");

            C_WorkShift ws = Global.GetWorkShiftById(wi.ShiftId);

            if (ws != null)
                L_Shift.Text = ws.OpenTime.ToString("hh:mm p") + " to " + ws.CloseTime.ToString("hh:mm p");
            else
                L_Shift.Text = "";

            TB_Hours.Text = wi.Hours.ToString();
            SC_Approval.SelectedSegment = wi.Approved ? 0 : 1;
            B_Update.Enabled = false;
            Dirty = false;

            C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
            if (user == null)
                L_User.Text = wi.UserId.ToString();
            else
                L_User.Text = user.Name;

            if (user == null)
            {
				Task.Run(async () =>
				{
					C_VitaUser u = await Global.GetUserFromCache(wi.UserId);

					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						if (u != null)
							L_User.Text = u.Name;
					}));
				});
			}
        }

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            TV_WorkItems.UserInteractionEnabled = en;
            B_Update.Enabled = en && Dirty;
            SC_Approval.Enabled = en;
            TB_Hours.Enabled = en;
        }

        public class C_SectionInfo
        {
            public string Name;
            public List<string> Elements;
            public List<C_SignUp> SignUps;
        }

		public class C_WorkItemsTableDelegate : UITableViewDelegate
		{
			readonly C_Global Global;
			readonly VC_WorkItems OurVC;
			readonly C_WorkItemsTableSource TableSource;
			readonly string Token;

			public C_WorkItemsTableDelegate(C_Global global, VC_WorkItems vc, C_WorkItemsTableSource tsource)
			{
				Global = global;
				OurVC = vc;
				TableSource = tsource;

				C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
				Token = user.Token;
			}

			public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
			{
                int row = indexPath.Row;
                int section = indexPath.Section;

				UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
				async delegate
				{
                    C_SignUp workitemToRemove = TableSource.Sections[section].SignUps[row];

					OurVC.AI_Busy.StartAnimating();
					OurVC.EnableUI(false);

                    C_IOResult ior = await Global.RemoveIntent(workitemToRemove, Token);
                    if (ior.Success)
                    {
                        TableSource.Sections[section].SignUps.RemoveAt(row);
                        TableSource.Sections[section].Elements.RemoveAt(row);
                    }

					OurVC.EnableUI(true);
					OurVC.AI_Busy.StopAnimating();

                    OurVC.TV_WorkItems.ReloadData();
				});

				return new UITableViewRowAction[] { hiButton };
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
                // identify the specific signup
                Global.VolunteerSignUp = TableSource.Sections[indexPath.Section].SignUps[indexPath.Row];

				OurVC.PopulateWorkItem();
			}
		}

		public class C_WorkItemsTableSource : UITableViewSource
		{
			const string CellIdentifier = "TableCell_WorkItemsTableSource";

            public readonly List<C_SectionInfo> Sections;

            public C_WorkItemsTableSource(List<C_SectionInfo> sections)
			{
                Sections = sections;
			}

            public override nint NumberOfSections(UITableView tableView)
            {
                return Sections.Count;
            }

			public override nint RowsInSection(UITableView tableview, nint section)
			{
                return Sections[(int)section].SignUps.Count;
			}

            public override string TitleForHeader(UITableView tableView, nint section)
            {
                return Sections[(int)section].Name;
            }

            //string[] IndexTitles;
            //public override string[] SectionIndexTitles(UITableView tableView)
            //{
            //    List<string> indexTitles = new List<string>();
            //    if (SortBy == 0) // date then site
            //    {
            //        foreach(C_YMD ymd in UniqueDates)
            //            indexTitles.Add(ymd.ToString("yyyy-mm-dd"));
            //    }
            //    else // site then date
            //    {
            //        foreach (string s in UniqueSites)
            //            indexTitles.Add(s);
            //    }

            //    IndexTitles = indexTitles.ToArray();

            //    return IndexTitles;
            //}

            //public override string TitleForFooter(UITableView tableView, nint section)
            //{
            //    return " ";
            //}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                int row = indexPath.Row;
                int section = indexPath.Section;

                C_SectionInfo sectionInfo = Sections[section];

                cell.TextLabel.Text = sectionInfo.Elements[row];

                //if (SortBy == 0) // date then site
                //{
                //    if ((section >= 0) && (section < UniqueDates.Count))
                //    {
                //        C_YMD date = UniqueDates[section];
                //        var ou = OurWorkItems.Where(su => su.Date == date);
                //        List<C_SignUp> signupsOnDate = ou.ToList();
                //        if ((row >= 0) && (row < signupsOnDate.Count))
                //        {
                //            C_SignUp ourSignUp = signupsOnDate[row];

                //            Task.Run(async () =>
                //            {
                //                C_VitaUser u = await Global.GetUserFromCache(ourSignUp.UserId);

                //                C_WorkShift ws = Global.GetWorkShiftById(ourSignUp.ShiftId);

                //                UIApplication.SharedApplication.InvokeOnMainThread(
                //                new Action(() =>
                //                {
                //                    string name = u != null ? u.Name : ourSignUp.UserId.ToString();
                //                    string shifts = ws != null ? " [" + ws.OpenTime.ToString("hh:mm") + " : " + ws.CloseTime.ToString("hh:mm") + "]" : "";

                //                    cell.TextLabel.Text = name + " - " + ourSignUp.SiteName + shifts;
                //                }));
                //            });
                //        }
                //        else
                //            Console.WriteLine("aaaa");
                //    }
                //    else
                //        Console.WriteLine("hhh");
                //}
                //else // site then date
                //{
                //    if ((section >= 0) && (section < UniqueSites.Count))
                //    {
                //        string site = UniqueSites[section];
                //        var ou = OurWorkItems.Where(su => su.SiteName == site);
                //        List<C_SignUp> signupsAtSite = ou.ToList();
                //        if ((row >= 0) && (row < signupsAtSite.Count))
                //        {
                //            C_SignUp ourSignUp = signupsAtSite[row];

                //            Task.Run(async () =>
                //            {
                //                C_VitaUser u = await Global.GetUserFromCache(ourSignUp.UserId);

                //                C_WorkShift ws = Global.GetWorkShiftById(ourSignUp.ShiftId);

                //                UIApplication.SharedApplication.InvokeOnMainThread(
                //                new Action(() =>
                //                {
                //                    string name = u != null ? u.Name : ourSignUp.UserId.ToString();
                //                    string shifts = ws != null ? " [" + ws.OpenTime.ToString("hh:mm") + " : " + ws.CloseTime.ToString("hh:mm") + "]" : "";

                //                    cell.TextLabel.Text = name + " - " + ourSignUp.SiteName + shifts;
                //                }));
                //            });
                //        }
                //    }
                //}

				return cell;
			}
		}
    }
}