using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;
using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_SCSite : UIViewController
    {
        C_Global Global;

        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;

        public VC_SCSite (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			if (Global.ViewCameFrom == E_ViewCameFrom.Login)
                B_Back.SetTitle("< Login", UIControlState.Normal);
            else
                B_Back.SetTitle("< Back", UIControlState.Normal);

            B_Back.TouchUpInside += (sender, e) => 
            {
                if (LoggedInUser.SitesCoordinated.Count == 1)
                    PerformSegue("Segue_SCSiteToLogin", this);
                else
                    PerformSegue("Segue_SCSiteToSCSites", this);
            };

            B_Closed.TouchUpInside += async (sender, e) => 
            {
                E_ClientSiteStatus newStatus = E_ClientSiteStatus.Closed;

				EnableUI(false);
				AI_Busy.StartAnimating();

                C_IOResult ior = await Global.UpdateSiteStatus(SelectedSite, newStatus, LoggedInUser.Token);
                if (!ior.Success)
				{
                    var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_Accepting.TouchUpInside += async (sender, e) => 
            {
				E_ClientSiteStatus newStatus = E_ClientSiteStatus.Accepting;

                EnableUI(false);
				AI_Busy.StartAnimating();

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_IOResult ior = await Global.UpdateSiteStatus(SelectedSite, newStatus, LoggedInUser.Token);
				if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_NearLimit.TouchUpInside += async (sender, e) => 
            {
                E_ClientSiteStatus newStatus = E_ClientSiteStatus.NearLimit;

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_IOResult ior = await Global.UpdateSiteStatus(SelectedSite, newStatus, LoggedInUser.Token);
				if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_AtLimit.TouchUpInside += async (sender, e) => 
            {
                E_ClientSiteStatus newStatus = E_ClientSiteStatus.NotAccepting;

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_IOResult ior = await Global.UpdateSiteStatus(SelectedSite, newStatus, LoggedInUser.Token);
				if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_Volunteers.TouchUpInside += (sender, e) => 
            {
                // clear all the dirty flags in the WorkItems to avoid saving stuff we shouldn't
                Global.ClearDirtyFlagOnSignUps();

				PerformSegue("Segue_SCSiteToSCSiteVolCal", this);
			};

            B_SiteCalendar.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SCSiteToSCSiteCalendar", this);

            B_UpdateProfile.TouchUpInside += (sender, e) =>
            {
                Global.ViewCameFrom = E_ViewCameFrom.SCSite;
                PerformSegue("Segue_SCSiteToUpdateProfile", this);
            };

            bool killChanges = false;
			SW_DropOff.ValueChanged += async (sender, e) =>
			{
                if (killChanges) return;

                C_IOResult ior = await UpdateSiteCapabilities();

                if (!ior.Success)
                {
                    var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                }
			};

			SW_Express.ValueChanged += async (sender, e) =>
			{
				if (killChanges) return;

				C_IOResult ior = await UpdateSiteCapabilities();

				if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}
			};

			SW_MFT.ValueChanged += async (sender, e) =>
			{
				if (killChanges) return;

				C_IOResult ior = await UpdateSiteCapabilities();

				if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}
			};

            AI_Busy.StartAnimating();
			EnableUI(false);

            Task.Run(async () => 
            {
                SelectedSite = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

					L_SiteName.Text = SelectedSite.Name;

					killChanges = true;
					SW_DropOff.On = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
					SW_Express.On = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
					SW_MFT.On = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);
					killChanges = false;
				}));
           });
		}

        private void EnableUI(bool enable)
        {
            if (SelectedSite != null)
            {
    			int isiteStatus = (int)SelectedSite.ClientStatus;
    			string ssitestatus = C_VitaSite.N_ClientStatusNames[isiteStatus];
    			L_ClientStatus.Text = ssitestatus;

                switch (SelectedSite.ClientStatus)
                {
                    case E_ClientSiteStatus.Closed:
                        IMG_Currently.Image = UIImage.FromBundle("blackstatus.jpg");
                        break;
                    case E_ClientSiteStatus.Accepting:
    					IMG_Currently.Image = UIImage.FromBundle("greenstatus.jpg");
    					break;
                    case E_ClientSiteStatus.NearLimit:
    					IMG_Currently.Image = UIImage.FromBundle("yellowstatus.jpg");
    					break;
    				case E_ClientSiteStatus.NotAccepting:
    					IMG_Currently.Image = UIImage.FromBundle("redstatus.jpg");
    					break;
    			}

    			B_Closed.Enabled = enable && SelectedSite.ClientStatus != E_ClientSiteStatus.Closed;
    			B_Accepting.Enabled = enable && SelectedSite.ClientStatus != E_ClientSiteStatus.Accepting;
    			B_NearLimit.Enabled = enable && SelectedSite.ClientStatus != E_ClientSiteStatus.NearLimit;
    			B_AtLimit.Enabled = enable && SelectedSite.ClientStatus != E_ClientSiteStatus.NotAccepting;
			}
            else
            {
                B_Closed.Enabled = false;
				B_Accepting.Enabled = false;
				B_NearLimit.Enabled = false;
				B_AtLimit.Enabled = false;
			}

			B_Volunteers.Enabled = enable;
            B_SiteCalendar.Enabled = enable;
            B_UpdateProfile.Enabled = enable;

            SW_DropOff.Enabled = enable;
            SW_Express.Enabled = enable;
            SW_MFT.Enabled = enable;

            B_Back.Enabled = enable;
		}

        private async Task<C_IOResult> UpdateSiteCapabilities()
		{
			EnableUI(false);
            AI_Busy.StartAnimating();

			SelectedSite.SiteCapabilities = new List<E_SiteCapabilities>();
			if (SW_DropOff.On)
				SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
            if (SW_Express.On)
				SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.Express);
            if (SW_MFT.On)
				SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.MFT);

            C_IOResult ior = await Global.UpdateSiteCapabilities(SelectedSite, LoggedInUser.Token);

			EnableUI(true);
            AI_Busy.StopAnimating();

			return ior;
		}

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}
	}
}