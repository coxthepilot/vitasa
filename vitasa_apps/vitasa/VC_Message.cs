using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitasa
{
    public partial class VC_Message : UIViewController
    {
        C_Global Global;

        C_Message Message;

        public VC_Message (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MessageToMain", this);
            };

			switch (Global.MessageToShow)
			{
				case E_Message.About:
					L_Message.Text = AppResources.Main_B_About;
					break;
				case E_Message.BecomeAVolunteer:
                    L_Message.Text = AppResources.Main_B_BecomingAVolunteer;
					break;
				case E_Message.BeforeYoGo:
                    L_Message.Text = AppResources.Main_B_BeforeYouGo;
					break;
				case E_Message.MyFreeTaxes:
                    L_Message.Text = AppResources.Main_B_MyFreeTaxes;
					break;
				case E_Message.Resources:
                    L_Message.Text = AppResources.Main_B_Resources;
					break;
                case E_Message.Using211:
                    L_Message.Text = AppResources.Main_B_211;
                    break;
			}

			AI_Busy.StartAnimating();

			Task.Run(async () => 
            {
                string messageSlug = C_Message.SlugForMessage(Global.MessageToShow);

                string userLang = NSLocale.CurrentLocale.LocaleIdentifier;
                C_Message.E_Language lang = C_Message.E_Language.English;
                if (userLang == "es")
                    lang = C_Message.E_Language.Spanish;

                Message = await C_Message.GetMessage(lang, messageSlug);

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					AI_Busy.StopAnimating();

					if (Message == null)
                    {
                        MessageBox(this, "Error", "Unable to load the message.", E_MessageBoxButtons.Ok);
                        return;
    				}

                    WV_Content.LoadHtmlString(Message.Text, new NSUrl(""));
				}));
			});
		}

		public override void ViewDidAppear(bool animated)
		{
            View.BackgroundColor = C_Common.StandardBackground;
		}
	}
}