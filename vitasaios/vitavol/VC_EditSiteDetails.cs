using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_EditSiteDetails : UIViewController
    {
        C_Global Global;
        bool Dirty;
        C_VitaSite OurSite;

        public VC_EditSiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

            Dirty = false;

            SW_DropOff.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
            SW_Express.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            SW_MyFreeTaxes.On = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);

            SW_DropOff.ValueChanged += (sender, e) => 
            {
                Dirty = true;
                B_SaveChanges.Enabled = true;
            };

            SW_Express.ValueChanged += (sender, e) =>
			{
				Dirty = true;
				B_SaveChanges.Enabled = true;
			};

			SW_MyFreeTaxes.ValueChanged += (sender, e) =>
			{
				Dirty = true;
				B_SaveChanges.Enabled = true;
			};

            B_SaveChanges.TouchUpInside += async (sender, e) => 
            {
                if (Dirty)
                {
                    bool success = await SaveChanges();

                    if (!success)
                    {
						E_MessageBoxResults mbres = await MessageBox(this,
											 "Error",
											 "Failed to update the Site Capabilities",
											 E_MessageBoxButtons.Ok);
                        return;
					}

					PerformSegue("Segue_EditSiteDetailsToSCSite", this);
				}
			};

            B_Back.TouchUpInside += async (sender, e) => 
            {
                if (Dirty)
                {
					E_MessageBoxResults mbres = await MessageBox(this,
    					 "Changes",
    					 "Changes were made. Save?",
                         E_MessageBoxButtons.YesNo);

                    if (mbres == E_MessageBoxResults.Yes)
                    {
                        bool success = await SaveChanges();

						if (!success)
						{
							E_MessageBoxResults mbresx = await MessageBox(this,
												 "Error",
												 "Failed to update the Site Capabilities",
												 E_MessageBoxButtons.Ok);
						}
					}
				}

                PerformSegue("Segue_EditSiteDetailsToSCSite", this);
            };

		}

        private async Task<bool> SaveChanges()
        {
            AI_Busy.StartAnimating();
            EnableUI(false);

			OurSite.SiteCapabilities = new List<E_SiteCapabilities>();
			if (SW_DropOff.On)
				OurSite.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
			if (SW_Express.On)
				OurSite.SiteCapabilities.Add(E_SiteCapabilities.Express);
			if (SW_MyFreeTaxes.On)
				OurSite.SiteCapabilities.Add(E_SiteCapabilities.MFT);

            C_VitaUser LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            bool success = await OurSite.UpdateSiteCapabilities(LoggedInUser.Token);

            EnableUI(true);
            AI_Busy.StopAnimating();

            return success;
		}

        private void EnableUI(bool en)
        {
            SW_Express.Enabled = en;
            SW_DropOff.Enabled = en;
            SW_MyFreeTaxes.Enabled = en;
            B_Back.Enabled = en;
            B_SaveChanges.Enabled = en;
        }

        public override void ViewDidAppear(bool animated)
        {
            View.BackgroundColor = C_Common.StandardBackground;
        }
    }
}