using Foundation;
using System;
using UIKit;

using zsquared;

namespace vitasaadmin
{
    public partial class VC_ShowUserDetails : UIViewController
    {
		C_Global passAroundContainer;
	
        public VC_ShowUserDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			passAroundContainer = myAppDelegate.PassAroundContiner;

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_ShowUserDetailsToLists", this);
            };

            C_VitaUser user = passAroundContainer.SelectedUser;

            TB_Email.Text = user.email;

            // todo: populate the sites picker with check boxes of sites for which
            //        this user is a site coordinator; not editable here; have to go to the 
            //        Site details page to do that; get this list from the Sites
        }
    }
}