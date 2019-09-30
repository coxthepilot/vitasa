using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using zsquared;

namespace vitavol
{
    public partial class VC_SiteDetails : UIViewController
    {
        public VC_SiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			C_Global passAroundContainer = myAppDelegate.PassAroundContainer;

            if (passAroundContainer.SelectedSite == null)
                throw new ApplicationException("selected site cannot be null");

			// ---------- button responders --------

			B_Back.TouchUpInside += (sender, e) => 
            {
                string segue;
                if (passAroundContainer.DetailsCameFrom == E_CameFrom.List)
                    segue = "Segue_DetailsToList";
                else if (passAroundContainer.DetailsCameFrom == E_CameFrom.Map)
                    segue = "Segue_DetailsToMap";
                else
                    throw new ApplicationException("unexpected came from value");

                PerformSegue(segue, this);
            };

			// ----------- init screen values --------------
			L_SiteName.Text = passAroundContainer.SelectedSite.Name;
			L_Hours.Text = "Hours: " + passAroundContainer.SelectedSite.Hours;
            L_SiteCoordinator.Text = passAroundContainer.SelectedSite.PrimaryCoordinator;
            L_CurrentClientStatus.Text = "Current Client Status: " + passAroundContainer.SelectedSite.Status.ToString();

            var clist = passAroundContainer.Calendar.Where(ce => ce.SiteID == passAroundContainer.SelectedSite.ID);

            C_CalendarTableSource calTblSrc = new C_CalendarTableSource(passAroundContainer, clist.ToList(), this, "Segue_DetailsToCalendarDetails");
            TV_Calendar.Source = calTblSrc;
        }
    }
}