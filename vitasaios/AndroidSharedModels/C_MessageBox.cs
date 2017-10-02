using Android.App;
using Android.Content;

using System;

namespace zsquared
{
	public enum E_MessageBoxResults { Ok, Yes, No, Cancel }
	public enum E_MessageBoxButtons { Ok, OkCancel, YesNo, YesNoCancel }
	public class C_MessageBox
	{
		readonly Dialog dialog;
		public event MessageBoxEventHandler Dismissed;

        public C_MessageBox(Activity context, string title, string message, E_MessageBoxButtons buttons)
		{
            AlertDialog.Builder alert = new AlertDialog.Builder((Context)context);
			alert.SetTitle(title);
			alert.SetMessage(message);

			switch (buttons)
			{
				case E_MessageBoxButtons.Ok:
					alert.SetPositiveButton("Ok", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.Ok }); });
					break;
				case E_MessageBoxButtons.OkCancel:
					alert.SetPositiveButton("Ok", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.Ok }); });
					alert.SetNegativeButton("Cancel", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.Cancel }); });
					break;
				case E_MessageBoxButtons.YesNo:
					alert.SetPositiveButton("Yes", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.Yes }); });
					alert.SetNegativeButton("No", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.No }); });
					break;
				case E_MessageBoxButtons.YesNoCancel:
					alert.SetPositiveButton("Yes", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.Yes }); });
					alert.SetNeutralButton("No", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.No }); });
					alert.SetNegativeButton("Cancel", (senderAlert, args) => { Dismissed?.Invoke(this, new C_MessageBoxEventArgs() { Result = E_MessageBoxResults.Cancel }); });
					break;
			}

			dialog = alert.Create();
		}

		public void Show()
		{
			dialog.Show();
		}
	}

	public delegate void MessageBoxEventHandler(object sender, C_MessageBoxEventArgs args);

	public class C_MessageBoxEventArgs : EventArgs
	{
		public E_MessageBoxResults Result { get; set; }
	}
}
