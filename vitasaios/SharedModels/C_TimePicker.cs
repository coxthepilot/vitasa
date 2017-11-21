using System;
using UIKit;

namespace zsquared
{
	public class C_TimePicker
	{
		readonly UITextField TB_;
		public event TimePickerEventHandler TimePickerDone;
		readonly UIDatePicker DP_;
		C_HMS HMS;

		public C_TimePicker(UITextField tb)
		{
			TB_ = tb;

			DP_ = new UIDatePicker()
			{
				Mode = UIDatePickerMode.Time
			};

			UIToolbar ToolBar_OpenTime = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_OpenTime.SizeToFit();

			UIBarButtonItem doneButtonOpen = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
				DateTime dt = C_NSDateConversions.NSDateToDateTime(DP_.Date);
				HMS = new C_HMS(dt);
				TB_.Text = HMS.ToString("hh:mm p");
				TimePickerDone?.Invoke(this, new C_TimePickerSelect(HMS));
				TB_.ResignFirstResponder();
			});
			ToolBar_OpenTime.SetItems(new UIBarButtonItem[] { doneButtonOpen }, true);
			UITextAttributes uitaot = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonOpen.SetTitleTextAttributes(uitaot, UIControlState.Normal);

			TB_.InputView = DP_;
			TB_.InputAccessoryView = ToolBar_OpenTime;
		}

		public C_HMS Value
		{
			get { return HMS; }
		}

		public void SetValue(C_HMS hms)
		{
			HMS = hms;
			DP_.Date = C_NSDateConversions.BuildNSDateFromTime(hms.ToString("hh:mm"));
			TB_.Text = hms.ToString("hh:mm p");
		}
	}

	public class C_TimePickerSelect : EventArgs
	{
		public C_HMS HMS;

		public C_TimePickerSelect(C_HMS hms)
		{
			HMS = hms;
		}
	}

	public delegate void TimePickerEventHandler(object sender, C_TimePickerSelect e);
}
