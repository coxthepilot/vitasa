using Foundation;
using System;
using zsquared;
using System.Collections.Generic;
using UIKit;

namespace vitavol
{
    public partial class VC_CalendarDetails : UIViewController
    {
        public VC_CalendarDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
			
            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			C_Global passAroundContainer = myAppDelegate.PassAroundContainer;

			// ---------- button handlers ----------
			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_CalendarDetailsToDetails", this);
            };

            B_AddIntent.TouchUpInside += (sender, e) => 
            {
                if (passAroundContainer.SelectedCalendarEntry.EFilerIntents.Contains(passAroundContainer.LoggedInUser.email))
                    return;

                passAroundContainer.SelectedCalendarEntry.EFilerIntents.Add(passAroundContainer.LoggedInUser.email);

                TV_Intents.ReloadData();
            };

            B_RemoveIntent.TouchUpInside += (sender, e) => 
            {
				if (!passAroundContainer.SelectedCalendarEntry.EFilerIntents.Contains(passAroundContainer.LoggedInUser.email))
					return;

				passAroundContainer.SelectedCalendarEntry.EFilerIntents.Remove(passAroundContainer.LoggedInUser.email);

				TV_Intents.ReloadData();
			};

            // --------- populate the view items ---------

            L_SiteName.Text = passAroundContainer.SelectedSite.Name;
            L_SiteHours.Text = "Hours: " + passAroundContainer.SelectedSite.Hours;
			L_SiteCoordinator.Text = passAroundContainer.SelectedSite.PrimaryCoordinator;
            L_Date.Text = passAroundContainer.SelectedCalendarEntry.Date.ToString("mmm dd, yyyy");

            List<string> ilist = passAroundContainer.SelectedCalendarEntry.EFilerIntents;
            C_IntentsTableSource intentsTableSource = new C_IntentsTableSource(passAroundContainer, ilist, this, null);
            TV_Intents.Source = intentsTableSource;
		}
    }
}