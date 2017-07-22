using Foundation;
using System;
using UIKit;
using System.IO;

namespace vitasa
{
    public partial class VC_GetReady : UIViewController
    {
        public C_PassAroundContainer PassAroundContainer;

        public VC_GetReady (IntPtr handle) : base (handle)
        {
		}

        public override void PrepareForSegue(UIStoryboardSegue segue, NSObject sender)
        {
            base.PrepareForSegue(segue, sender);

			if (segue.Identifier == "PrepListToMain")
			{
                ViewController siteDetails = (ViewController)segue.DestinationViewController;
				siteDetails.PassAroundContainer = PassAroundContainer;
			}
		}
    }
}