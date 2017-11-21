using Foundation;
using System;
using UIKit;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_UpdateProfile : UIViewController
    {
		C_Global Global;
		C_VitaUser LoggedInUser;

		public VC_UpdateProfile (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) => 
            {
                if (Global.ViewCameFrom == E_ViewCameFrom.VolOptions)
                    PerformSegue("Segue_UpdateProfileToVolunteerOptions", this);
                else
                    PerformSegue("Segue_UpdateProfileToSCSite", this);
            };

            B_Submit.TouchUpInside += async (sender, e) => 
            {
				LoggedInUser.Name = TB_Name.Text;
				LoggedInUser.Phone = TB_Phone.Text;

                AI_Busy.StartAnimating();
				EnableUI(false);

                bool success = await LoggedInUser.UpdateUserProfile();

                AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
					// tell the user that the staff will approve, check back later
					C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
									 "Error",
									 "Unable to update user profile.",
									 E_MessageBoxButtons.Ok);
				}
				else
				{
                    if (Global.ViewCameFrom == E_ViewCameFrom.VolOptions)
                        PerformSegue("Segue_UpdateProfileToVolunteerOptions", this);
				}
			};

            TB_Name.Text = LoggedInUser.Name;
            TB_Email.Text = LoggedInUser.Email;
            TB_Phone.Text = LoggedInUser.Phone;
		}

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_Submit.Enabled = en;
            TB_Name.Enabled = en;
            TB_Phone.Enabled = en;
        }

		public override void ViewDidAppear(bool animated)
		{
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

	}
}