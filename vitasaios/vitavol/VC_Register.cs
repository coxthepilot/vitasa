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

			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;

			B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_RegisterToLogin", this);

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

            B_Submit.TouchUpInside += async (sender, e) => 
            {
                // send the registration to the backend
                nint cl = SC_Certification.SelectedSegment;
                E_Certification loc = cl == 0 ? E_Certification.Basic : E_Certification.Advanced;

                // need to get these values before we leave the UI thread
                string uname = TB_Name.Text;
                string uemail = TB_Email.Text;
                string upassword = TB_Password.Text;
                string uphone = TB_Phone.Text;

                AI_Submitting.StartAnimating();
                EnableUI(false);

                try
                {
                    bool success = await C_Registration.SubmitRegistration(uname, uemail, upassword, uphone, loc);

                    if (success)
                    {
                        UIApplication.SharedApplication.InvokeOnMainThread(
                        new Action(async () =>
                        {
							AI_Submitting.StopAnimating();
							EnableUI(true);

							// tell the user that the staff will approve, check back later
                            C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
                                             "Registration Submitted",
                                             "Your registration has been submitted. Staff will respond shortly.",
                                             C_MessageBox.E_MessageBoxButtons.Ok);
                            PerformSegue("Segue_RegisterToLogin", this);
                        }));
                    }
                    else
                    {
						UIApplication.SharedApplication.InvokeOnMainThread(
						new Action(async () =>
						{
							AI_Submitting.StopAnimating();
							EnableUI(true);

							// tell the user that the staff will approve, check back later
							C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
											"Error",
											"Unable to submit registration, possibly due to a duplicate registration.",
											 C_MessageBox.E_MessageBoxButtons.Ok);
						}));
                        return;
                    }
                }
                catch (Exception e1)
                {
                    Console.WriteLine(e1.Message);
                }
                finally
                {
					AI_Submitting.StopAnimating();
					EnableUI(true);
				}
            };
		}

        private void EnableUI(bool en)
        {
            TB_Name.Enabled = en;
            TB_Email.Enabled = en;
            TB_Password.Enabled = en;
            TB_VerifyPassword.Enabled = en;
            TB_Phone.Enabled = en;
            SC_Certification.Enabled = en;
            B_Back.Enabled = en;
            B_Submit.Enabled = en;
        }

        private bool CheckReadyToSubmit()
        {
			bool ok = true;

			ok &= TB_Name.Text.Length > 4;
			ok &= TB_Email.Text.Length > 4;
			ok &= TB_Password.Text.Length > 7;
			ok &= TB_Password.Text.Length > 7;

			ok &= ValidPhoneNumber(TB_Phone.Text);
			ok &= TB_Email.Text.Contains("@");
			ok &= TB_Password.Text == TB_VerifyPassword.Text;

			return ok;
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