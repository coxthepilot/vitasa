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
            OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;

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

            L_SiteName.Text = Global.SelectedSiteName;

            EnableUI(true);

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

                PerformSegue("Segue_SCSiteToSCVolunteers", this);
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

            //IMG_Closed.Image = UIImage.FromBundle("blackstatus.jpg");
            //IMG_Accepting.Image = UIImage.FromBundle("greenstatus.jpg");
            //IMG_NearLimit.Image = UIImage.FromBundle("yellowstatus.jpg");
            //IMG_AtLimit.Image = UIImage.FromBundle("redstatus.jpg");

            killChanges = true;
			SW_DropOff.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
			SW_Express.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            SW_MFT.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);
            killChanges = false;
		}

        private void EnableUI(bool enable)
        {
            C_VitaSite site = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

			int isiteStatus = (int)site.Status;
			string ssitestatus = C_VitaSite.N_SiteStatus[isiteStatus];
			L_ClientStatus.Text = ssitestatus;

            switch (site.Status)
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

			B_Closed.Enabled = enable && site.Status != E_SiteStatus.Closed;
			B_Accepting.Enabled = enable && site.Status != E_SiteStatus.Accepting;
			B_NearLimit.Enabled = enable && site.Status != E_SiteStatus.NearLimit;
			B_AtLimit.Enabled = enable && site.Status != E_SiteStatus.NotAccepting;

            B_Volunteers.Enabled = enable;
            B_SiteCalendar.Enabled = enable;

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

	}
}