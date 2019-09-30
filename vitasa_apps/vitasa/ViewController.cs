using System;
using Foundation;
using Xamarin.Forms;

using zsquared;

using UIKit;

namespace vitasa
{
    public partial class ViewController : UIViewController
    {
        C_Global Global;

        protected ViewController(IntPtr handle) : base(handle)
        {
            // Note: this .ctor should not contain any initialization logic.
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_GettingReady.TouchUpInside += (sender, e) => 
            {
                Global.MessageToShow = E_Message.BeforeYoGo;
                PerformSegue("Segue_MainToMessage", this);
            };

            B_Resources.TouchUpInside += (sender, e) =>
			{
                Global.MessageToShow = E_Message.Resources;
				PerformSegue("Segue_MainToMessage", this);
			};

            B_About.TouchUpInside += (sender, e) =>
			{
                Global.MessageToShow = E_Message.About;
				PerformSegue("Segue_MainToMessage", this);
			};

            B_BecomingAVolunteer.TouchUpInside += (sender, e) =>
			{
                Global.MessageToShow = E_Message.BecomeAVolunteer;
				PerformSegue("Segue_MainToMessage", this);
			};

            B_Feedback.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToSuggestion", this);
            };

            B_ViewAsList.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToList", this);
            };

            B_ViewOnMap.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToMap", this);
            };

            L_MainTitle.Text = AppResources.Main_L_Title;
            L_MainSubTitle.Text = AppResources.Main_L_SubTitle;
            B_ViewAsList.SetTitle(AppResources.Main_B_List, UIControlState.Normal);
            B_ViewOnMap.SetTitle(AppResources.Main_B_Map, UIControlState.Normal);
            B_GettingReady.SetTitle(AppResources.Main_B_BeforeYouGo, UIControlState.Normal);
            B_Feedback.SetTitle(AppResources.Main_B_Feedback, UIControlState.Normal);
            B_Resources.SetTitle(AppResources.Main_B_Resources, UIControlState.Normal);
            B_BecomingAVolunteer.SetTitle(AppResources.Main_B_BecomingAVolunteer, UIControlState.Normal);
            B_About.SetTitle(AppResources.Main_B_About, UIControlState.Normal);

			I_Background.Image = UIImage.FromBundle("rwalk");
		}

		public override void DidReceiveMemoryWarning()
        {
            base.DidReceiveMemoryWarning();
            // Release any cached data, images, etc that aren't in use.
        }
    }
}
