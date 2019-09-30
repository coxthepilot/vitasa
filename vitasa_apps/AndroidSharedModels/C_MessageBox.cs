using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Gms.Common.Apis;
using Android.Views;

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

    public class C_AlertBox
    {
        readonly Dialog dialog;
        AlertDialog.Builder alert;

        public C_AlertBox(Activity context, string title, string message)
        {
            alert = new AlertDialog.Builder((Context)context);
            alert.SetTitle(title);
            alert.SetMessage(message);
            dialog = alert.Create();
            dialog.SetCanceledOnTouchOutside(false);
        }

        public void Show()
        {
            dialog.Show();
        }

        public void SetMessage(string m)
        {
            //alert.SetMessage(m);
            TextView tv = (TextView)dialog.FindViewById(Android.Resource.Id.Message);
            tv.Text = m;
        }

        public void Hide()
        {
            dialog.Hide();
        }
    }

    public class C_BusyBox
    {
        Dialog dialog;
        AlertDialog.Builder alert;
        readonly View PB_Busy_View;
        bool BoxIsVisible;

        public C_BusyBox(Activity context, string message)
        {
            PB_Busy_View = context.LayoutInflater.Inflate(a_vitavol.Resource.Layout.BusyBox, null);

            alert = new AlertDialog.Builder((Context)context);
            alert.SetTitle("");
            alert.SetMessage(message);
            alert.SetView(PB_Busy_View);
            dialog = alert.Create();

            BoxIsVisible = false;
        }

        public void Show()
        {
            BoxIsVisible = true;
            dialog.Show();
        }

        public void SetMessage(string m)
        {
            alert.SetMessage(m);
        }

        public void Hide()
        {
            if (BoxIsVisible)
                dialog.Hide();
        }

        //public void Dispose()
        //{
        //    dialog = null;
        //}
    }
}
