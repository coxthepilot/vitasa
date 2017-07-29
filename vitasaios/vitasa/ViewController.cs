using System;
using Xamarin.Forms;

using UIKit;

namespace vitasa
{
    public partial class ViewController : UIViewController
    {
        protected ViewController(IntPtr handle) : base(handle)
        {
            // Note: this .ctor should not contain any initialization logic.
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
			// Perform any additional setup after loading the view, typically from a nib.

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			if (myAppDelegate.PassAroundContainer == null)
				myAppDelegate.PassAroundContainer = new C_PassAroundContainer();

			// use this to put an image in the background
			I_Background.Image = UIImage.FromBundle("rwalk");

            //Application.Current.Properties[""]
		}

        public override void DidReceiveMemoryWarning()
        {
            base.DidReceiveMemoryWarning();
            // Release any cached data, images, etc that aren't in use.
        }
    }
}
