using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Linq;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminReport : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_AdminReport (IntPtr handle) : base (handle)
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
                PerformSegue("Segue_AdminReportToAdminReports", this);
            };

            B_SendTo.TouchUpInside += (sender, e) => 
            {
                // not sure that this works; will only be able to test on a physical device
                string email = LoggedInUser.Email;
                string subject = "VITA Report: " + Global.SelectedReport.ToString();
                string body = TxV_Report.Text;
                string shareurl = "mailto:" + email + "?subject=" + WebUtility.UrlEncode(subject) + "&body=" + WebUtility.UrlEncode(body);
                Xamarin.Forms.Device.OpenUri(new Uri("mailto:" + shareurl));
            };

            B_GenerateReport.TouchUpInside += async (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);

                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                AI_Busy.StopAnimating();
                EnableUI(true);

                switch (Global.SelectedReport)
                {
                    case E_Reports.WorkLog:
                        string r = GenerateWorkLogReport();
                        TxV_Report.Text = r;
                        break;
                    case E_Reports.Volunteers:
                        string r1 = GenerateVolunteerReport();
                        TxV_Report.Text = r1;
                        break;
                }
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_ReportName.Text = Global.SelectedReport.ToString();
        }

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_SendTo.Enabled = en;
            B_GenerateReport.Enabled = en;
            TxV_Report.UserInteractionEnabled = en;
        }
         
        // todo: move these to the Tools object so they can be used in the Android version
        public string GenerateWorkLogReport()
        {
            // assumes all users have already been fetched
            StringBuilder sb = new StringBuilder();

            List<C_VitaUser> users = Global.GetAllUsersNoCache();

            sb.Append("VITA " + Global.SelectedReport.ToString() + " Report/n");
            sb.Append("Generated: " + C_YMD.Now.ToString("dow mmm dd, yyyy") + " at " + C_HMS.Now.ToString("hh:mm p") + "\n");
            sb.Append("\n");

            var ou = users.Where(u => u.HasVolunteer);
            foreach(C_VitaUser u in ou)
            {
                float h = 0.0f;
                foreach (C_WorkLogItem wi in u.WorkItems)
                    h += wi.Hours;

                sb.Append(u.Name + "," + h.ToString() + "\n");
            }

            return sb.ToString();
        }

        public string GenerateVolunteerReport()
        {
            // assumes all users have already been fetched
            StringBuilder sb = new StringBuilder();

            List<C_VitaUser> users = Global.GetAllUsersNoCache();

            sb.Append("VITA " + Global.SelectedReport.ToString() + " Report/n");
            sb.Append("Generated: " + C_YMD.Now.ToString("dow mmm dd, yyyy") + " at " + C_HMS.Now.ToString("hh:mm p") + "\n");
            sb.Append("\n");

            var ou = users.Where(u => u.HasVolunteer);
            foreach (C_VitaUser u in ou)
                sb.Append(u.Name + "," + u.Phone + "," + u.Certification.ToString() + "\n");

            return sb.ToString();
        }
    }
}