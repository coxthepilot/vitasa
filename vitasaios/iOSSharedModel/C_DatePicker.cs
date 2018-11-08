using System;
using UIKit;

namespace zsquared
{
    public class C_DatePicker
    {
        readonly UITextField TB_;
        public event DatePickerEventHandler DatePickerDone;
        readonly UIDatePicker DP_;
        C_YMD YMD;

        public C_DatePicker(UITextField tb)
        {
            TB_ = tb;

            DP_ = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Date
            };

            UIToolbar ToolBar_OpenDate = new UIToolbar()
            {
                BarStyle = UIBarStyle.Black,
                Translucent = true
            };
            ToolBar_OpenDate.SizeToFit();

            UIBarButtonItem doneButtonOpen = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
            {
                DateTime dt = C_NSDateConversions.NSDateToDateTime(DP_.Date);
                YMD = new C_YMD(dt);
                TB_.Text = YMD.ToString("dow mmm dd, yyyy");
                DatePickerDone?.Invoke(this, new C_DatePickerSelect(YMD));
                TB_.ResignFirstResponder();
            });
            ToolBar_OpenDate.SetItems(new UIBarButtonItem[] { doneButtonOpen }, true);
            UITextAttributes uitaot = new UITextAttributes()
            {
                TextColor = UIColor.White
            };
            doneButtonOpen.SetTitleTextAttributes(uitaot, UIControlState.Normal);

            TB_.InputView = DP_;
            TB_.InputAccessoryView = ToolBar_OpenDate;
        }

        public C_YMD Value
        {
            get { return YMD; }
        }

        public void SetValue(C_YMD ymd)
        {
            YMD = ymd;
            DP_.Date = C_NSDateConversions.BuildNSDateFromDate(ymd); //.BuildNSDateFromTime(hms.ToString("hh:mm"));
            TB_.Text = ymd.ToString("dow mmm dd, yyyy");
        }
    }

    public class C_DatePickerSelect : EventArgs
    {
        public C_YMD YMD;

        public C_DatePickerSelect(C_YMD ymd)
        {
            YMD = ymd;
        }
    }

    public delegate void DatePickerEventHandler(object sender, C_DatePickerSelect e);
}
