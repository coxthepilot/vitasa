using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminReports : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_TableSource<E_Reports> ReportsTableSource;

        public VC_AdminReports (IntPtr handle) : base (handle)
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
                Global.SelectedReport = E_Reports.Unknown;
                PerformSegue("Segue_AdminReportsToAdminMenu", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(() =>
            {
                List<E_Reports> reports = Tools.EnumToList<E_Reports>();
                reports.Remove(E_Reports.Unknown);

                void p()
                {
                    ReportsTableSource = new C_TableSource<E_Reports>(this, TV_Reports, reports, "reportcell");
                    ReportsTableSource.GetTextLabel += (sender, args) =>
                    {
                        E_Reports report = args.Item;
                        return report.ToString();
                    };
                    ReportsTableSource.Selected += (sender, args) =>
                    {
                        E_Reports report = args.Item;
                        Global.SelectedReport = report;
                        PerformSegue("Segue_AdminReportsToAdminReport", this);
                    };
                    TV_Reports.Source = ReportsTableSource;
                    TV_Reports.ReloadData();

                    AI_Busy.StopAnimating();
                    EnableUI(true);
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });

        }

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            TV_Reports.UserInteractionEnabled = en;
        }
    }
}