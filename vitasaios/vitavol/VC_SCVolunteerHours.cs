using Foundation;
using System;
using System.Collections.Generic;
using zsquared;
using System.Threading.Tasks;
using UIKit;

namespace vitavol
{
    public partial class VC_SCVolunteerHours : UIViewController
    {
        // Globals to be set on start of ViewController
        // - SelectedDate
        // - SelectedSite
        // - VolunteerName
        // - VolunteerWorkItem

        C_Global Global;

		public VC_SCVolunteerHours (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			if ((Global.SelectedDate == null)
                || (Global.SelectedSite == null)
                || (Global.VolunteerName == null)
                || (Global.VolunteerWorkItem == null))
                throw new ApplicationException("required input elements are not all present");

            B_Save.TouchUpInside += (sender, e) => 
            {
                try { Global.VolunteerWorkItem.Hours = Convert.ToInt32(TB_Hours.Text); }
                catch {}

				PerformSegue("Segue_SCVolunteerHoursToSCVolunteers", this);
			};

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SCVolunteerHoursToSCVolunteers", this);
            };

            L_Date.Text = Global.VolunteerWorkItem.Date.ToString("mmm dd, yyyy");
            C_VitaSite site = C_VitaSite.GetSiteBySlug(Global.VolunteerWorkItem.SiteSlug, Global.AllSites);
            L_Site.Text = site.Name;
            // todo: can't get user name yet
            L_Volunteer.Text = "unknown";

            TB_Hours.Text = Global.VolunteerWorkItem.Hours.ToString();
        }
    }
}