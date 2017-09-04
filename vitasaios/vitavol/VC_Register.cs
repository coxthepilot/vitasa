using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;

using zsquared;

namespace vitavol
{
    public partial class VC_Register : UIViewController
    {
        public VC_Register (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_RegisterToLogin", this);

			SW_Basic.ValueChanged += (sender, e) => 
                SW_Advanced.On = !SW_Basic.On;

            SW_Advanced.ValueChanged += (sender, e) =>
				SW_Basic.On = !SW_Advanced.On;

            TB_Name.AddTarget((sender, e) =>
			{
                B_Submit.Enabled = CheckReadyToSubmit();

			}, UIControlEvent.EditingChanged);

            TB_Email.AddTarget((sender, e) =>
			{
				B_Submit.Enabled = CheckReadyToSubmit();

			}, UIControlEvent.EditingChanged);

            TB_Password.AddTarget((sender, e) =>
			{
				B_Submit.Enabled = CheckReadyToSubmit();

			}, UIControlEvent.EditingChanged);

            TB_VerifyPassword.AddTarget((sender, e) =>
			{
				B_Submit.Enabled = CheckReadyToSubmit();

			}, UIControlEvent.EditingChanged);

            TB_Phone.AddTarget((sender, e) =>
			{
				B_Submit.Enabled = CheckReadyToSubmit();

			}, UIControlEvent.EditingChanged);

            B_Submit.TouchUpInside += (sender, e) => 
            {
                // send the registration to the backend
                E_Certification loc = E_Certification.Basic;
                if (SW_Advanced.On)
                    loc = E_Certification.Advanced;

                // need to get these values before we leave the UI thread
                string uname = TB_Name.Text;
                string uemail = TB_Email.Text;
                string upassword = TB_Password.Text;
                string uphone = TB_Phone.Text;

                Task.Run(async () => 
                {
                    try
                    {
                        bool success = await C_Registration.SubmitRegistration(uname, uemail, upassword, uphone, loc);

                        UIApplication.SharedApplication.InvokeOnMainThread(
                        new Action(() =>
                        {
                            // tell the user that the staff will approve, check back later
                            Tools.MessageBox(this, 
                                             "Registration Submitted", 
                                             "Your registration has been submitted. Staff will respond shortly.", 
                                             Tools.E_MessageBoxButtons.Ok);
                            PerformSegue("Segue_RegistrationToLogin", this);
                        }));
                    }
                    catch (Exception e1)
                    {
                        Console.WriteLine(e1.Message);
                    }

				});

            };
		}

        private bool CheckReadyToSubmit()
        {
            bool ready = (TB_Name.Text.Length > 4)
                && (TB_Password.Text.Length > 7)
                && (TB_Password.Text == TB_VerifyPassword.Text)
                && ValidPhoneNumber(TB_Phone.Text);

            return ready;
		}

        private bool ValidPhoneNumber(string pn)
        {
            // we consider a phone number valid if it has 10 numerics, no alphas, only dashes
            bool res = true;

            int numCount = 0;
            foreach(char c in pn){
                if (char.IsDigit(c))
                {
                    numCount++;
                    continue;
                }
                else if (char.IsLetter(c))
                {
                    res = false;
                    break;
                }
                else if (c != '-')
                {
                    res = false;
                    break;
                }
            }

            return res && (numCount == 10);
        }
    }
}