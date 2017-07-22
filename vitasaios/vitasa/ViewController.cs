using System;

using UIKit;

namespace vitasa
{
    public partial class ViewController : UIViewController
    {
        public C_PassAroundContainer PassAroundContainer;

        protected ViewController(IntPtr handle) : base(handle)
        {
            // Note: this .ctor should not contain any initialization logic.
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            // Perform any additional setup after loading the view, typically from a nib.

            // use this to put an image in the background
            //this.View.InsertSubview (new UIImageView(UIImage.FromBundle("riverwalk.jpg")),0);
            I_Background.Image = UIImage.FromBundle("rwalk");

            if (PassAroundContainer == null)
                PassAroundContainer = new C_PassAroundContainer();
		}

        public override void DidReceiveMemoryWarning()
        {
            base.DidReceiveMemoryWarning();
            // Release any cached data, images, etc that aren't in use.
        }

        public override void PrepareForSegue(UIStoryboardSegue segue, Foundation.NSObject sender)
        {
            base.PrepareForSegue(segue, sender);

			if (segue.Identifier == "MainToSitesList")
			{
                VC_SitesList siteDetails = (VC_SitesList)segue.DestinationViewController;
				siteDetails.PassAroundContainer = PassAroundContainer;
			}
			else if (segue.Identifier == "MainToSitesMap")
			{
                VC_SitesMap vc = (VC_SitesMap)segue.DestinationViewController;
				vc.PassAroundContainer = PassAroundContainer;
			}
			else if (segue.Identifier == "MainToPrepList")
			{
                VC_GetReady vc = (VC_GetReady)segue.DestinationViewController;
				vc.PassAroundContainer = PassAroundContainer;
			}
		}
    }
}
