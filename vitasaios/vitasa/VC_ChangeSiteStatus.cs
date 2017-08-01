using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using System.Json;
using Xamarin.Forms;

namespace vitasa
{
    public partial class VC_ChangeSiteStatus : UIViewController
    {
        string loginToken;

        public VC_ChangeSiteStatus (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			if (myAppDelegate.PassAroundContainer == null)
				throw new ApplicationException("Pass around container must not be null");
            if (myAppDelegate.PassAroundContainer.SelectedSite == null)
                throw new ApplicationException("we must have a selected site");

            C_VitaSite OurSite = myAppDelegate.PassAroundContainer.SelectedSite;

            L_CurrentSite.Text = OurSite.SiteName;
            L_SiteCurrentStatus.Text = "Site is currently: " + OurSite.SiteStatus.ToString();

            B_Back.TouchUpInside += (sender, e) => 
            {
                this.PerformSegue("Segue_UpdateToDetails", this);
            };

            B_MakeSiteOpen.TouchUpInside += (sender, e) => 
            {
                UpdateSiteStatus(C_VitaSite.E_SiteStatus.Open, OurSite);
            };

            B_MakeSiteClosed.TouchUpInside += (sender, e) => 
            {
				UpdateSiteStatus(C_VitaSite.E_SiteStatus.Closed, OurSite);
			};

            B_MakeSiteNearingLimit.TouchUpInside += (sender, e) => 
            {
				UpdateSiteStatus(C_VitaSite.E_SiteStatus.NearLimit, OurSite);
			};

            B_MakeSiteNotAccepting.TouchUpInside += (sender, e) => 
            {
				UpdateSiteStatus(C_VitaSite.E_SiteStatus.NotAccepting, OurSite);
			};

			Task.Run(async () =>
            {
                // do the initial login to get the token which is also the means to verify authorization
                // failure to get the token means they are not authorized
				NSUserDefaults userSettings = new NSUserDefaults("group.net.zsquared.vitasa");
				var userName = userSettings.StringForKey("siteCoordinatorUserName");
				var userPassword = userSettings.StringForKey("siteCoordinatorPassword");
                string token = await C_VitaSite.PerformLogin(userName, userPassword);

                if (token != null)
                {
                    loginToken = token;
					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						C_VitaSite.E_SiteStatus siteStatus = myAppDelegate.PassAroundContainer.SelectedSite.SiteStatus;
						SetButtonsBasedOnStatus(siteStatus);
						L_VerifyingAuthorization.Text = "Verification Successful.";
					}));
                }
                else
                {
					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						L_VerifyingAuthorization.Text = "Verification failed.";
					}));
                }
            });

		}

        /// <summary>
        /// Set the buttons based on the SiteStatus; must be run on the UIThread
        /// </summary>
        private void SetButtonsBasedOnStatus(C_VitaSite.E_SiteStatus siteStatus)
        {
			B_MakeSiteOpen.Hidden = false;
			B_MakeSiteClosed.Hidden = false;
			B_MakeSiteNotAccepting.Hidden = false;
			B_MakeSiteNearingLimit.Hidden = false;

            B_MakeSiteOpen.Enabled = siteStatus != C_VitaSite.E_SiteStatus.Open;
            B_MakeSiteClosed.Enabled = siteStatus != C_VitaSite.E_SiteStatus.Closed;
            B_MakeSiteNotAccepting.Enabled = siteStatus != C_VitaSite.E_SiteStatus.NotAccepting;
            B_MakeSiteNearingLimit.Enabled = siteStatus != C_VitaSite.E_SiteStatus.NearLimit;
		}         

        private void UpdateSiteStatus(C_VitaSite.E_SiteStatus desiredSiteStatus, C_VitaSite ourSite)
        {
			Task.Run(async () =>
			{
				bool success = await ourSite.UpdateSiteStatus(desiredSiteStatus, loginToken);

				if (success)
				{
					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
                        SetButtonsBasedOnStatus(ourSite.SiteStatus);
						L_SiteCurrentStatus.Text = "Site is currently: " + ourSite.SiteStatus.ToString();
					}));
				}
				else
				{
					AlertBox("Error", "Site status has not been updatd.");
				}
			});
		}

        private void AlertBox(string title, string message)
        {
            var alert = UIAlertController.Create(title, message, UIAlertControllerStyle.Alert);

			alert.AddAction(UIAlertAction.Create("Ok", UIAlertActionStyle.Cancel, null));
			//alert.AddAction(UIAlertAction.Create("Snooze", UIAlertActionStyle.Default, action => Snooze()));
			//if (alert.PopoverPresentationController != null)
			//	alert.PopoverPresentationController.BarButtonItem = myItem;
			PresentViewController(alert, animated: true, completionHandler: null);        
        }
    }
}