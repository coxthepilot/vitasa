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
		// - WorkItemsDate
		// - VolunteerName

		C_Global Global;

		public VC_SCVolunteerHours (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            const float EPSILON = 0.001f;

            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            if ((Global.WorkItemsDate == null)
                || (Global.VolunteerWorkItem == null))
                throw new ApplicationException("required input elements are not all present");

			B_Back.TouchUpInside += (sender, e) => 
            {
				try 
                {
                    float h = Convert.ToSingle(TB_Hours.Text);
                    if (Math.Abs(h - Global.VolunteerWorkItem.Hours) > EPSILON)
                    {
                        Global.VolunteerWorkItem.Dirty = true;
                        Global.VolunteerWorkItem.Hours = h;
                    }
				}
				catch { }

				PerformSegue("Segue_SCVolunteerHoursToSCVolunteers", this);
            };

            L_Date.Text = Global.VolunteerWorkItem.Date.ToString("mmm dd, yyyy");
            C_VitaSite site = C_VitaSite.GetSiteBySlug(Global.VolunteerWorkItem.SiteSlug, Global.AllSites);
            L_Site.Text = site.Name;
            L_Volunteer.Text = Global.VolunteerWorkItem.User.Name;
            L_ApprovedState.Text = Global.VolunteerWorkItem.Approved ? "Approved" : "not approved";

            TB_Hours.Text = Global.VolunteerWorkItem.Hours.ToString();
            TB_Hours.Enabled = !Global.VolunteerWorkItem.Approved;
        }
    }
}