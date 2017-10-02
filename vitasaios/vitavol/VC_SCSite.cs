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
        C_VitaSite OurSite;

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
                if (Global.ViewCameFrom == E_ViewCameFrom.Login)
                    PerformSegue("Segue_SCSiteToLogin", this);
                else
                    PerformSegue("Segue_SCSiteToSCSites", this);
            };

            B_Closed.TouchUpInside += async (sender, e) => 
            {
                E_SiteStatus newStatus = E_SiteStatus.Closed;

				EnableUI(false);
				AI_Busy.StartAnimating();

                C_VitaSite site = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

                if (site != null)
                {
                    bool success = await site.UpdateSiteStatus(newStatus, LoggedInUser.Token);
                }

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_Accepting.TouchUpInside += async (sender, e) => 
            {
				E_SiteStatus newStatus = E_SiteStatus.Accepting;

                EnableUI(false);
				AI_Busy.StartAnimating();

				C_VitaSite site = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

				if (site != null)
				{
					bool success = await site.UpdateSiteStatus(newStatus, LoggedInUser.Token);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_NearLimit.TouchUpInside += async (sender, e) => 
            {
                E_SiteStatus newStatus = E_SiteStatus.NearLimit;

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_VitaSite site = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

				if (site != null)
				{
					bool success = await site.UpdateSiteStatus(newStatus, LoggedInUser.Token);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_AtLimit.TouchUpInside += async (sender, e) => 
            {
                E_SiteStatus newStatus = E_SiteStatus.NotAccepting;

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_VitaSite site = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

				if (site != null)
				{
					bool success = await site.UpdateSiteStatus(newStatus, LoggedInUser.Token);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_Volunteers.TouchUpInside += (sender, e) => 
            {
                // clear all the dirty flags in the WorkItems to avoid saving stuff we shouldn't
                Global.ClearDirtyFlagOnIntents();

                //PerformSegue("Segue_SCSiteToSCVolunteers", this);
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

				bool success = await UpdateSiteCapabilities();

                if (!success)
                {
                    var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to update site capability.", E_MessageBoxButtons.Ok);
                }
			};

			SW_Express.ValueChanged += async (sender, e) =>
			{
				if (killChanges) return;

				bool success = await UpdateSiteCapabilities();

				if (!success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to update site capability.", E_MessageBoxButtons.Ok);
				}
			};

			SW_MFT.ValueChanged += async (sender, e) =>
			{
				if (killChanges) return;

				bool success = await UpdateSiteCapabilities();

				if (!success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to update site capability.", E_MessageBoxButtons.Ok);
				}
			};

			OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

            AI_Busy.StartAnimating();
            DisableUI();

            Task.Run(async () => 
            {
                if (OurSite == null)
                    OurSite = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    L_SiteName.Text = OurSite.Name;

                    EnableUI(true);

                    killChanges = true;
                    SW_DropOff.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
                    SW_Express.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
                    SW_MFT.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);
                    killChanges = false;
                }));
			});
		}

        private void DisableUI()
        {
            L_ClientStatus.Text = "";
            B_Closed.Enabled = false;
			B_Accepting.Enabled = false;
			B_NearLimit.Enabled = false;
			B_AtLimit.Enabled = false;

			B_Volunteers.Enabled = false;
			B_SiteCalendar.Enabled = false;
            B_UpdateProfile.Enabled = false;

			SW_DropOff.Enabled = false;
			SW_Express.Enabled = false;
			SW_MFT.Enabled = false;

			B_Back.Enabled = false;
		}

        private void EnableUI(bool enable)
        {
			int isiteStatus = (int)OurSite.Status;
			string ssitestatus = C_VitaSite.N_SiteStatus[isiteStatus];
			L_ClientStatus.Text = ssitestatus;

            switch (OurSite.Status)
            {
                case E_SiteStatus.Closed:
                    IMG_Currently.Image = UIImage.FromBundle("blackstatus.jpg");
                    break;
                case E_SiteStatus.Accepting:
					IMG_Currently.Image = UIImage.FromBundle("greenstatus.jpg");
					break;
                case E_SiteStatus.NearLimit:
					IMG_Currently.Image = UIImage.FromBundle("yellowstatus.jpg");
					break;
				case E_SiteStatus.NotAccepting:
					IMG_Currently.Image = UIImage.FromBundle("redstatus.jpg");
					break;
			}

			B_Closed.Enabled = enable && OurSite.Status != E_SiteStatus.Closed;
			B_Accepting.Enabled = enable && OurSite.Status != E_SiteStatus.Accepting;
			B_NearLimit.Enabled = enable && OurSite.Status != E_SiteStatus.NearLimit;
			B_AtLimit.Enabled = enable && OurSite.Status != E_SiteStatus.NotAccepting;

            B_Volunteers.Enabled = enable;
            B_SiteCalendar.Enabled = enable;
            B_UpdateProfile.Enabled = enable;

            SW_DropOff.Enabled = enable;
            SW_Express.Enabled = enable;
            SW_MFT.Enabled = enable;

            B_Back.Enabled = enable;
		}

		private async Task<bool> UpdateSiteCapabilities()
		{
			EnableUI(false);
            AI_Busy.StartAnimating();

			OurSite.SiteCapabilities = new List<E_SiteCapabilities>();
			if (SW_DropOff.On)
				OurSite.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
            if (SW_Express.On)
				OurSite.SiteCapabilities.Add(E_SiteCapabilities.Express);
            if (SW_MFT.On)
				OurSite.SiteCapabilities.Add(E_SiteCapabilities.MFT);

			bool success = await OurSite.UpdateSiteCapabilities(LoggedInUser.Token);

			EnableUI(true);
            AI_Busy.StopAnimating();

			return success;
		}

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}
	}
}