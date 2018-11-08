using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using UIKit;

using zsquared;

namespace vitaadmin
{
    public partial class VC_Stats : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_Stats (IntPtr handle) : base (handle)
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
                PerformSegue("Segue_StatsToMain", this);
            };

            B_Copy.TouchUpInside += (sender, e) => 
            {
                UIPasteboard clipboard = UIPasteboard.General;
                clipboard.String = TV_Stats.Text;
            };

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () =>
            {
                try
                {
                    // we make sure all sites have been read in, which gives us a complete list of all work items
                    //List<C_VitaSite> sitesList = await Global.FetchAllSites();
                    List<C_VitaUser> usersList = await Global.FetchAllUsers(LoggedInUser.Token);

                    Global.SignUpsList.Sort(C_SignUp.CompareByDateThenSiteAscending);

                    bool success = await Global.EnsureShiftsInCacheForSignUps(LoggedInUser.Token, Global.SignUpsList);

                    List<C_VitaSite> sites = await Global.FetchAllSites(LoggedInUser.Token);

                    UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(() =>
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        BuildOutput();
                    }));
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            });

        }

        private void BuildOutput()
        {
            int usersAdmin = 0;
            int usersSiteCoordinators = 0;
            int usersVolunteers = 0;
            foreach(C_VitaUser u in Global.UserCache)
            {
                if (u.Roles.Contains(E_VitaUserRoles.Admin))
                    usersAdmin++;
                if (u.Roles.Contains(E_VitaUserRoles.SiteCoordinator))
                    usersSiteCoordinators++;
                if (u.Roles.Contains(E_VitaUserRoles.Volunteer))
                    usersVolunteers++;
            }

            int signups = Global.SignUpsList.Count;
            float hours = 0;
            foreach(C_SignUp su in Global.SignUpsList)
            {
                C_WorkShift sh = Global.GetWorkShiftById(su.ShiftId);
                hours += GetShiftHours(su, sh);
            }
            
            StringBuilder sb = new StringBuilder();

            sb.Append("Users: " + Global.UserCache.Count.ToString());
            sb.Append("\n");
            sb.Append("   Admins: " + usersAdmin.ToString());
            sb.Append("\n");
            sb.Append("   Site Coordinators: " + usersSiteCoordinators.ToString());
            sb.Append("\n");
            sb.Append("   Volunteers: " + usersVolunteers.ToString());
            sb.Append("\n");

            sb.Append("Signups: " + signups.ToString());
            sb.Append("\n");
            sb.Append("   Hours: " + hours.ToString());
            sb.Append("\n");

            sb.Append("Sites: " + Global.SiteCache.Count.ToString());
            sb.Append("\n");

            sb.Append("\nUser Details:\n\n");
            sb.Append(GetPerUserStats());
            sb.Append("\n");

            TV_Stats.Text = sb.ToString();
        }

        private string GetPerUserStats()
        {
            StringBuilder sb = new StringBuilder();

            List<C_VitaUser> users = new List<C_VitaUser>();
            foreach (C_VitaUser u in Global.UserCache)
                if (u.HasVolunteer)
                    users.Add(u);
            users.Sort(C_VitaUser.CompareByNameToLower);

            foreach(C_VitaUser user in users)
            {
                if (user.HasVolunteer)
                {
                    sb.Append(user.Name + "\n");
                    List<C_SignUp> signUps = Global.GetSignUpsForUser(user.id);
                    signUps.Sort(C_SignUp.CompareByDateThenSiteAscending);

                    float hours = 0.0f;
                    foreach (C_SignUp su in signUps)
                    {
                        C_WorkShift shift = Global.GetWorkShiftById(su.ShiftId);

                        float thisHours = GetShiftHours(su, shift);
                        sb.Append(su.Date.ToString("yyyy-mm-dd") + "," + su.SiteName + "," + thisHours.ToString() + "\n");
                        hours += thisHours;
                    }
                    sb.Append("," + "Total Hours" + "," + hours.ToString() + "\n\n");
                }
            }

            return sb.ToString();
        }

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_Copy.Enabled = en;
        }

        private float GetShiftHours(C_SignUp su, C_WorkShift ws)
        {
            float res = 0.0f;

            if (su.Approved)
                res = su.Hours;
            else
            {
                float open = (float)ws.OpenTime.Hour + (float)ws.OpenTime.Minutes / 60.0f;
                float close = (float)ws.CloseTime.Hour + (float)ws.CloseTime.Minutes / 60.0f;
                res = close - open;
            }

            return res;
        }

    }
}