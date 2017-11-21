using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using zsquared;

namespace vitavol
{
    public partial class VC_SitesOnDateList : UIViewController
    {
        // We get here to create a new signup, starting with the date (now selected). Our role is
        //  to select the site. Shift is selected on the next screen.

        C_Global Global;
        C_YMD SelectedDate;
        C_VitaUser LoggedInUser;

        public VC_SitesOnDateList(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            SelectedDate = Global.SelectedDate;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
#if DEBUG
            if ((SelectedDate == null)
                || (LoggedInUser == null)
               )
                throw new ApplicationException("missing values");
#endif

			L_Date.Text = "Date: " + SelectedDate.ToString("mmm dd, yyyy");

			B_Back.TouchUpInside += (sender, e) => 
            {
                Global.OpenSitesThatNeedHelp = null;
                PerformSegue("Segue_SitesOnDateListToCalendar", this);
            };

            B_ShowOnMap.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SitesOnDateListToSitesOnDateMap", this);
            };

            AI_Busy.StartAnimating();

            Task.Run(async () => 
            {
                // Since we got here after coming through the calendar which loaded the siteschedules into
                //  the siteschedulecache, we can use that to see which sites are open on this date.
                List<C_SiteSchedule> sitesOpen2 = await Global.GetSitesScheduleCached(SelectedDate.Year, SelectedDate.Month);
                var ou = sitesOpen2.Where(ss => (ss.Date == SelectedDate) && (ss.SiteIsOpen));
                List<C_SiteSchedule> sitesOpen1 = ou.ToList();

                List<C_SiteSchedule> sitesOpenAndNeedOurUserHelp = new List<C_SiteSchedule>();
                foreach(C_SiteSchedule ss in sitesOpen1)
                {
                    bool needsHelp = false;

                    foreach(C_SiteScheduleShift sss in ss.Shifts)
                    {
                        int need = LoggedInUser.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
                        int have = LoggedInUser.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
                        needsHelp |= have < need;
                    }

                    if (needsHelp)
                        sitesOpenAndNeedOurUserHelp.Add(ss);
                }

                List<string> openSitesThatNeedHelpSlugs = new List<string>();
                foreach (C_SiteSchedule ws in sitesOpenAndNeedOurUserHelp)
                {
                    if (!openSitesThatNeedHelpSlugs.Contains(ws.SiteSlug))
                        openSitesThatNeedHelpSlugs.Add(ws.SiteSlug);
                }

				Global.OpenSitesThatNeedHelp = openSitesThatNeedHelpSlugs; // we save this so Maps doesn't have to recompute

                List<C_VitaSite> sitesThatNeedHelp = new List<C_VitaSite>();
                foreach(C_SiteSchedule ss in sitesOpenAndNeedOurUserHelp)
                {
                    C_VitaSite site = await Global.GetSiteFromCache(ss.SiteSlug);
                    sitesThatNeedHelp.Add(site);
                }

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
                    AI_Busy.StopAnimating();

                    TV_Sites.Source = new C_TableSourceSitesOnDateList(Global, this, sitesThatNeedHelp, LoggedInUser);
					TV_Sites.ReloadData();
				}));
			});
		}

        ///// <summary>
        ///// Select from the sites, the shifts that need the certification of our user in one or more shifts
        ///// </summary>
        ///// <returns>The sites needing help.</returns>
        ///// <param name="sites">Sites.</param>
        //private async Task<List<C_VitaSite>> SitesNeedingHelp(List<C_VitaSite> sites)
        //{
        //    List<C_VitaSite> res = new List<C_VitaSite>();
        //    foreach(C_VitaSite site in sites)
        //    {
        //        C_CalendarEntry ce = site.GetCalendarEntryForDate(SelectedDate);
        //        if (!ce.HaveShifts)
        //        {
        //            List<C_WorkShift> wslist = await Global.FetchAllShiftsForCalendarEntry(LoggedInUser.Token, site.Slug, ce);
        //        }

        //        foreach(C_WorkShift ws in ce.WorkShifts)
        //        {
        //            int numNeeded = LoggedInUser.Certification == E_Certification.Basic ? ws.NumBasicEFilers : ws.NumAdvEFilers;
        //            int numHave = Global.GetCountOfSignUpsByShiftId(ws.id);
        //            if ((numNeeded > 0) && (numHave < numNeeded))
        //            {
        //                res.Add(site);
        //                break;
        //            }
        //        }
        //    }

        //    return res;
        //}

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

		public class C_TableSourceSitesOnDateList : UITableViewSource
		{
            readonly C_Global Global;
            readonly UIViewController ourVC;
            readonly List<C_VitaSite> Sites;
            readonly C_VitaUser User;

            const string CellIdentifier = "TableCell";

            public C_TableSourceSitesOnDateList(C_Global pac, UIViewController vc, List<C_VitaSite> sites, C_VitaUser user)
			{
				Global = pac;
				ourVC = vc;
                Sites = sites;
                User = user;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = Sites.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one ---
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_VitaSite site = Sites[indexPath.Row];

				cell.TextLabel.Text = site.Name;

                // compute the gap from need to signedup
                int numNeeded = 0;
                int numHave = 0;
				C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, site.Slug);
				foreach (C_SiteScheduleShift sss in ss.Shifts)
				{
					numNeeded += User.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
					numHave += User.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
				}
				int numEF = numNeeded - numHave;


                // figure out if our user is already signed up for a shift on this date
                bool ourUserIsSignedUp = ss.LoggedInUserSignedUp; // todo: is this working?
				//C_CalendarEntry ce = site.GetCalendarEntryForDate(Global.SelectedDate);
				//foreach (C_WorkShift ws in ce.WorkShifts)
				//{
    //                List<C_SignUp> wiList = Global.GetSignUpsByShiftId(ws.id);
    //                var ou = wiList.Where(wi => wi.UserId == Global.LoggedInUserId);
    //                if (ou.Any())
    //                {
    //                    ourUserIsSignedUp = true;
    //                    break;
    //                }
				//}

                if (ourUserIsSignedUp)
					cell.DetailTextLabel.Text = "Already signed up for this site.";
				else
				    cell.DetailTextLabel.Text = numEF.ToString() + " needed across all shifts.";

				return cell;
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
                C_VitaSite site = Sites[indexPath.Row];

				int numNeeded = 0;
				int numHave = 0;
				C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, site.Slug);
				foreach (C_SiteScheduleShift sss in ss.Shifts)
				{
					numNeeded += User.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
					numHave += User.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
				}
				int numEF = numNeeded - numHave;

                if (numEF == 0)
                    return;
                
				Global.SelectedSignUp = new C_SignUp(site.Slug, Global.SelectedDate, Global.LoggedInUserId, 0)
                {
                    id = -1,
                    SiteName = Global.GetSiteNoFetch(site.Slug).Name,
                    ShiftId = site.id
                };
                Global.SelectedSiteSlug = site.Slug;

                Global.ViewCameFrom = E_ViewCameFrom.List;

                ourVC.PerformSegue("Segue_SitesOnDateListToVolSiteShifts", ourVC);
			}
		}
    }
}