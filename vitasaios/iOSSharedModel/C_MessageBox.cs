using System;
using System.Threading.Tasks;
using UIKit;

namespace zsquared
{
    public static class C_MessageBox
    {
		public enum E_MessageBoxButtons { Ok, YesNo, OkCancel, YesNoCancel }
		public enum E_MessageBoxResults { Ok, Yes, No, Cancel }

		public static Task<E_MessageBoxResults> MessageBox(UIViewController parent, string title, string message, E_MessageBoxButtons buttons)
		{
			var taskCompletionSource = new TaskCompletionSource<E_MessageBoxResults>();

			var alert = UIAlertController.Create(title, message, UIAlertControllerStyle.Alert);
			if (alert.PopoverPresentationController != null)
			{
				alert.PopoverPresentationController.SourceView = parent.View;
				alert.PopoverPresentationController.SourceRect = parent.View.Bounds;
			}

			if ((buttons == E_MessageBoxButtons.Ok) || (buttons == E_MessageBoxButtons.OkCancel))
				alert.AddAction(UIAlertAction.Create("OK", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.Ok)));

			if ((buttons == E_MessageBoxButtons.YesNo) || (buttons == E_MessageBoxButtons.YesNoCancel))
				alert.AddAction(UIAlertAction.Create("Yes", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.Yes)));

			if ((buttons == E_MessageBoxButtons.YesNo) || (buttons == E_MessageBoxButtons.YesNoCancel))
				alert.AddAction(UIAlertAction.Create("No", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.No)));

			if ((buttons == E_MessageBoxButtons.OkCancel) || (buttons == E_MessageBoxButtons.YesNoCancel))
				alert.AddAction(UIAlertAction.Create("Cancel", UIAlertActionStyle.Default, a => taskCompletionSource.SetResult(E_MessageBoxResults.Cancel)));
			parent.PresentViewController(alert, true, null);

			return taskCompletionSource.Task;
        }
    }
}
