using System;
using Android.App;
using Android.Content;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.OS;

namespace app1
{
    [Activity(Label = "My First Android App", MainLauncher = true)]
    public class MainActivity : Activity
    {// , Icon = "@mipmap/icon"
		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            EditText phoneNumberText = FindViewById<EditText>(Resource.Id.TB_phoneNumber);
            Button translateButton = FindViewById<Button>(Resource.Id.B_Translate);
            Button callButton = FindViewById<Button>(Resource.Id.B_Call);

            callButton.Enabled = false;
            string translatedNumber = string.Empty;

			translateButton.Click += (object sender, EventArgs e) =>
            {
            	// Translate user's alphanumeric phone number to numeric
                translatedNumber = PhoneTranslator.ToNumber(phoneNumberText.Text);
	            if (String.IsNullOrWhiteSpace(translatedNumber))
	            {
		            callButton.Text = "Call";
		            callButton.Enabled = false;
				}
				else
				{
					callButton.Text = "Call " + translatedNumber;
					callButton.Enabled = true;
				}
            };

			callButton.Click += (object sender, EventArgs e) =>
			{
				// On "Call" button click, try to dial phone number.
				var callDialog = new AlertDialog.Builder(this);
				callDialog.SetMessage("Call " + translatedNumber + "?");
				callDialog.SetNeutralButton("Call", delegate
				{
					// Create intent to dial phone
					var callIntent = new Intent(Intent.ActionCall);
					callIntent.SetData(Android.Net.Uri.Parse("tel:" + translatedNumber));
					StartActivity(callIntent);
				});
				callDialog.SetNegativeButton("Cancel", delegate { });

				// Show the alert dialog to the user and wait for response.
				callDialog.Show();
			};
        }
    }
}

