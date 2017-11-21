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

			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;

			B_Back.TouchUpInside += (sender, e) => 
            {
				try 
                {
                    float h = Convert.ToSingle(TB_Hours.Text);
                    if (Math.Abs(h - Global.VolunteerWorkShiftSignUp.TheSignUp.Hours) > EPSILON)
                    {
                        Global.VolunteerWorkShiftSignUp.TheSignUp.Dirty = true;
                        Global.VolunteerWorkShiftSignUp.TheSignUp.Hours = h;
                    }
				}
				catch 
                {
                    Global.VolunteerWorkShiftSignUp.TheSignUp.Dirty = false;
                }

				PerformSegue("Segue_SCVolunteerHoursToSCVolunteers", this);
            };

            UITapGestureRecognizer phoneLabelTap = new UITapGestureRecognizer(async () =>
            {
                string phoneNumber = Global.VolunteerWorkShiftSignUp.User.Phone;
                // clean up the number before we use it to make the call
                phoneNumber = phoneNumber.Replace("-", "");
                phoneNumber = phoneNumber.Trim();
                phoneNumber = phoneNumber.Replace(" ", "");
                phoneNumber = phoneNumber.Replace("(", "");
                phoneNumber = phoneNumber.Replace(")", "");

				var url = new NSUrl("tel:" + phoneNumber);
                if (!UIApplication.SharedApplication.OpenUrl(url))
				{
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Call not supported", "Calls are not supported on this device", C_MessageBox.E_MessageBoxButtons.Ok);
                };
            });

			L_Phone.UserInteractionEnabled = true;
			L_Phone.AddGestureRecognizer(phoneLabelTap);

            L_Date.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.Date.ToString("dow mmm dd, yyyy");
            L_Site.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.SiteName;
            L_Volunteer.Text = Global.VolunteerWorkShiftSignUp.User.UserName;
            L_ApprovedState.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.Approved ? "Approved" : "not approved";
            L_Phone.Text = Global.VolunteerWorkShiftSignUp.User.Phone;

            TB_Hours.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.Hours.ToString();

            TB_Hours.Enabled = (Global.VolunteerWorkShiftSignUp.TheSignUp.Date <= C_YMD.Now);
        }
    }
}