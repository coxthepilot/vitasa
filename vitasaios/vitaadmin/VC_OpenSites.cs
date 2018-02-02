using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;

using zsquared;

namespace vitaadmin
{
    public partial class VC_OpenSites : UIViewController
    {
        C_ItemPicker DateInSeasonPicker;
        C_YMD SelectedDate;
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_OpenSites (IntPtr handle) : base (handle)
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
                PerformSegue("Segue_OpenSitesToMain", this);
            };

            AI_Busy.StartAnimating();
            Task.Run(async () => 
            {
                // fetch all sites
                List<C_VitaSite> sites = await Global.FetchAllSites();

                C_YMD seasonStart = null;
                C_YMD seasonLast = null;

                foreach(C_VitaSite site in sites)
                {
                    if ((seasonStart == null) || (site.SeasonFirstDate < seasonStart))
                        seasonStart = site.SeasonFirstDate;
                    if ((seasonLast == null) || (site.SeasonLastDate > seasonLast))
                        seasonLast = site.SeasonLastDate;
                }

                List<string> daysInSeason = new List<string>();
                C_YMD date = seasonStart;
                do
                {
                    daysInSeason.Add(date.ToString("yyyy-mm-dd"));

                    date = date.AddDays(1);

                } while (date != seasonLast);
                daysInSeason.Add(date.ToString("yyyy-mm-dd"));

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();

                    DateInSeasonPicker = new C_ItemPicker(TB_Date, daysInSeason);
                    DateInSeasonPicker.TimePickerDone += (sender, e) =>
                    {
                        SelectedDate = new C_YMD(e.Selection);
                        PopulateOpenSitesTable();
                    };

                    SelectedDate = new C_YMD(daysInSeason[0]);

                    foreach (string ds in daysInSeason)
                    {
                        C_YMD d = new C_YMD(ds);
                        if (d == C_YMD.Now)
                        {
                            SelectedDate = d;
                            break;
                        }
                    }
                    TB_Date.Text = SelectedDate.ToString("yyyy-mm-dd");

                    PopulateOpenSitesTable();
                }));
            });
        }

        private void PopulateOpenSitesTable()
        {
            AI_Busy.StartAnimating();
            Task.Run(async () => 
            {
                // build the list of sites that open on the selected date
                List<C_VitaSite> allSites = Global.GetAllSitesNoFetch();
                allSites.Sort(C_VitaSite.CompareSitesByNameAscending);

                // build the dictionary for our results
                // dict: key=sitename, value = list of shifts on that date
                Dictionary<string, List<C_TWorkShift>> tableData = new Dictionary<string, List<C_TWorkShift>>();
                foreach(C_VitaSite site in allSites)
                {
                    C_CalendarEntry ce = site.GetCalendarEntryForDate(SelectedDate);
                    if ((ce == null) || !ce.SiteIsOpen)
                        continue;

                    List<C_WorkShift> shifts = await Global.FetchAllShiftsForCalendarEntry(LoggedInUser.Token, site.Slug, ce);
                    List<C_TWorkShift> tshifts = new List<C_TWorkShift>();
                    foreach(C_WorkShift shift in shifts)
                    {
                        C_TWorkShift tws = new C_TWorkShift()
                        {
                            WorkShift = shift,
                            CalendarEntry = ce,
                            Site = site
                        };
                        tshifts.Add(tws);
                    }
                    tableData.Add(site.Name, tshifts);
                }

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();

                    TV_Sites.Source = new C_OpenSitesTableSource(Global, tableData);
                    TV_Sites.ReloadData();
                }));
            });
        }

        public class C_TWorkShift
        {
            public C_WorkShift WorkShift;
            public C_CalendarEntry CalendarEntry;
            public C_VitaSite Site;
        }

        public class C_OpenSitesTableSource : UITableViewSource
        {
            const string CellIdentifier = "TableCell_OpenSitesTableSource";
            public readonly Dictionary<string, List<C_TWorkShift>> Sites;
            readonly C_Global Global;
            readonly List<string> SiteNames;

            public C_OpenSitesTableSource(C_Global global, Dictionary<string, List<C_TWorkShift>> sites)
            {
                Global = global;
                Sites = sites;

                SiteNames = new List<string>();
                foreach(KeyValuePair<string, List<C_TWorkShift>> kvp in Sites)
                    SiteNames.Add(kvp.Key);
            }

            public override nint NumberOfSections(UITableView tableView) => SiteNames.Count;

            public override nint RowsInSection(UITableView tableview, nint section)
            {
                string siteName = SiteNames[(int)section];

                List<C_TWorkShift> shifts = Sites[siteName];

                return shifts.Count;
            }

            public override string TitleForHeader(UITableView tableView, nint section)
            {
                return SiteNames[(int)section];
            }

            public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

                //---- if there are no cells to reuse, create a new one
                if (cell == null)
                    cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                string siteName = SiteNames[indexPath.Section];
                List<C_TWorkShift> shifts = Sites[siteName];
                C_TWorkShift tws = shifts[indexPath.Row];

                int haveBasic = 0;
                int haveAdv = 0;
                foreach(C_WorkShiftSignUp wss in tws.WorkShift.SignUps)
                {
                    if (wss.User.Certification == E_Certification.Basic)
                        haveBasic++;
                    else if (wss.User.Certification == E_Certification.Advanced)
                        haveAdv++;
                }

                cell.TextLabel.Text = tws.WorkShift.OpenTime.ToString("hh:mm p") + " : " + tws.WorkShift.CloseTime.ToString("hh:mm p");
                cell.DetailTextLabel.Text = "Basic: " + haveBasic.ToString() + "/" + tws.WorkShift.NumBasicEFilers.ToString() 
                    + " --- Advanced: " + haveAdv.ToString() + "/" + tws.WorkShift.NumAdvEFilers.ToString();

                return cell;
            }
        }

    }
}