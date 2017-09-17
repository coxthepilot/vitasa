using Foundation;
using System;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_EditSiteDetails : UIViewController
    {
        C_Global Global;
        bool Dirty;

        public VC_EditSiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            Dirty = false;

            // todo: set these based on site settings
            SW_DropOff.On = true;
            SW_Express.On = true;
            SW_MyFreeTaxes.On = true;

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

            B_SaveChanges.TouchUpInside += (sender, e) => 
            {
                // todo: save the site config changes
            };

            B_Back.TouchUpInside += (sender, e) => 
            {
                // todo: check Dirty
                PerformSegue("Segue_EditSiteDetailsToSCSite", this);
            };

		}

        public override void ViewDidAppear(bool animated)
        {
            View.BackgroundColor = C_Common.StandardBackground;
        }
    }
}