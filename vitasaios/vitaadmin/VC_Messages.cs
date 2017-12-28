using Foundation;

using System;
using System.Collections.Generic;

using UIKit;

using zsquared;


namespace vitaadmin
{
    public partial class VC_Messages : UIViewController
    {
        C_Global Global;
        bool Dirty;
        MessagePickerViewModel PickerModel;
        C_Message EnglishMessage;
        C_Message SpanishMessage;

        Dictionary<string, string> MessagesAndSlugs = new Dictionary<string, string>() 
        { 
            { "Before You Go", "before-you-go"}, 
            { "Community Resources", "community-resources"},
			{ "About", "about-this-app"},
			{ "Becoming A Volunteer", "become-a-volunteer"},
			{ "211", "using-211"},
			{ "My Free Taxes", "my-free-taxes"}
        };
        
        public VC_Messages (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MessagesToMain", this);
            };

            B_Load.TouchUpInside += async (sender, e) => 
            {
                C_IOResult ior = await Global.GetMessage(E_Language.English, TB_Slug.Text);
                EnglishMessage = ior.Message;
                if (EnglishMessage == null)
                {
                    EnglishMessage = new C_Message(TB_Slug.Text, "", E_Language.English);
                    EnglishMessage.Slug = TB_Slug.Text;
                }
                TxV_English.Text = EnglishMessage.Text;

                C_IOResult ior1 = await Global.GetMessage(E_Language.Spanish, TB_Slug.Text);
                SpanishMessage = ior1.Message;
                if (SpanishMessage == null)
                {
                    SpanishMessage = new C_Message(TB_Slug.Text, "", E_Language.Spanish)
                    {
                        Slug = TB_Slug.Text
                    };
                }
                TxV_Spanish.Text = SpanishMessage.Text;
			};

            B_Save.TouchUpInside += async (sender, e) => 
            {
                EnglishMessage.Text = TxV_English.Text;
                SpanishMessage.Text = TxV_Spanish.Text;

                C_VitaUser LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

                bool success;
                if (EnglishMessage.id == -1)
                {
                    C_IOResult ior = await Global.AddMessage(LoggedInUser.Token, EnglishMessage, SpanishMessage);
                    success = ior.Success;
                }
                else
				{
                    C_IOResult iore = await Global.UpdateMessage(EnglishMessage, LoggedInUser.Token);
                    C_IOResult iors = await Global.UpdateMessage(SpanishMessage, LoggedInUser.Token);
                    success = iore.Success && iors.Success;
				}

                if (success)
                {
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Success", "Message successfully saved.", C_MessageBox.E_MessageBoxButtons.Ok);
                }
                else
                {
					C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Error", "Message was not saved.", C_MessageBox.E_MessageBoxButtons.Ok);
				}
			};

            PickerModel = new MessagePickerViewModel(MessagesAndSlugs);
            UIPickerView PV_Message = new UIPickerView()
            {
                Model = PickerModel
            };
            UIToolbar ToolBar_Message = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_Message.SizeToFit();

            UIBarButtonItem doneButtonMessage = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
				nint num = PV_Message.SelectedRowInComponent(0);

                TB_Message.Text = PickerModel.GetChoiceAt(num);
				TB_Message.ResignFirstResponder();
				TB_Slug.Text = PickerModel.GetSlugAt(num);

				Dirty = true;
                B_Save.Enabled = true;
			});
			ToolBar_Message.SetItems(new UIBarButtonItem[] { doneButtonMessage }, true);
			UITextAttributes uitaef = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonMessage.SetTitleTextAttributes(uitaef, UIControlState.Normal);

            PV_Message.Select(0, 0, true);
            TB_Message.InputView = PV_Message;
			TB_Message.InputAccessoryView = ToolBar_Message;
		}


		public class MessagePickerViewModel : UIPickerViewModel
		{
			readonly List<string> Choices;
            Dictionary<string, string> MandS;

            public MessagePickerViewModel(Dictionary<string, string> mands)
			{
                MandS = mands;
				Choices = new List<string>();

                foreach(KeyValuePair<string, string> kvp in MandS)
                    Choices.Add(kvp.Key);
			}

            public string GetSlugAt(nint ix)
            {
                string choice = Choices[(int)ix];
                return MandS[choice];
            }

			public string GetChoiceAt(nint ix)
			{
				return Choices[(int)ix];
			}

			public override nint GetComponentCount(UIPickerView pickerView)
			{
				return 1;
			}

			public override nint GetRowsInComponent(UIPickerView pickerView, nint component)
			{
				return Choices.Count;
			}

			public override string GetTitle(UIPickerView pickerView, nint row, nint component)
			{
				return Choices[(int)row];
			}
		}

	}
}