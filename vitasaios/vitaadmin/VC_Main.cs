using Foundation;
using System;
using UIKit;

namespace vitaadmin
{
    public partial class VC_Main : UIViewController
    {
        public VC_Main (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToLogin", this);
            };

            B_Messages.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToMessages", this);
            };

        }
    }
}