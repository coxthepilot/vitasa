using Foundation;
using System;
using System.Threading.Tasks;
using UIKit;
using zsquared;

namespace vitavol
{
    public partial class VC_SCSite : UIViewController
    {
        C_Global Global;

        public VC_SCSite (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            if (Global.DetailsCameFrom == E_CameFrom.Login)
                B_Back.SetTitle("< Login", UIControlState.Normal);
            else
                B_Back.SetTitle("< Back", UIControlState.Normal);

            B_Back.TouchUpInside += (sender, e) => 
            {
                if (Global.DetailsCameFrom == E_CameFrom.Login)
                    PerformSegue("Segue_SCSiteToLogin", this);
                else
                    PerformSegue("Segue_SCSiteToSCSites", this);
            };

            L_SiteName.Text = Global.SelectedSite.Name;

            SetButtonEnabled();

            B_Closed.TouchUpInside += (sender, e) => 
            {
                SetNewSiteStatus(E_SiteStatus.Closed);
            };

            B_Accepting.TouchUpInside += (sender, e) => 
            {
                SetNewSiteStatus(E_SiteStatus.Accepting);
			};

            B_NearLimit.TouchUpInside += (sender, e) => 
            {
                SetNewSiteStatus(E_SiteStatus.NearLimit);
			};

            B_AtLimit.TouchUpInside += (sender, e) => 
            {
                SetNewSiteStatus(E_SiteStatus.NotAccepting);
			};

            B_Volunteers.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SCSiteToSCVolunteers", this);
            };

            B_SiteCalendar.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SCSiteToSCSiteCalendar", this);
            };
		}

        private void SetNewSiteStatus(E_SiteStatus newStatus)
        {
			Task.Run(async () =>
			{
                bool success = await Global.SelectedSite.UpdateSiteStatus(newStatus, Global.LoggedInUser.Token);
                if (success)
                {
                    Global.SelectedSite.Status = newStatus;
                    UIApplication.SharedApplication.InvokeOnMainThread(new Action(SetButtonEnabled));
                }
			});
		}

        private void SetButtonEnabled()
        {
			int isiteStatus = (int)Global.SelectedSite.Status;
			string ssitestatus = C_VitaSite.N_SiteStatus[isiteStatus];
			L_ClientStatus.Text = ssitestatus;

			B_Closed.Enabled = Global.SelectedSite.Status != E_SiteStatus.Closed;
			B_Accepting.Enabled = Global.SelectedSite.Status != E_SiteStatus.Accepting;
			B_NearLimit.Enabled = Global.SelectedSite.Status != E_SiteStatus.NearLimit;
			B_AtLimit.Enabled = Global.SelectedSite.Status != E_SiteStatus.NotAccepting;
		}
    }
}