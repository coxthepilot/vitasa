using System;

using Android.App;
using Android.Widget;
using Android.OS;

namespace zsquared
{
    public class C_DatePicker : DialogFragment, DatePickerDialog.IOnDateSetListener
    {
        public delegate void DatePickerEventHandler(object sender, DatePickerEventArgs args);
        public event DatePickerEventHandler DateSelected;

        public C_YMD SelectedDate;

        public C_DatePicker(C_YMD startDate)
        {
            SelectedDate = startDate;
        }

        public override Dialog OnCreateDialog(Bundle savedInstanceState)
        {
            DatePickerDialog dialog = new DatePickerDialog(Activity,this,
                                                           SelectedDate.Year,
                                                           SelectedDate.Month - 1,
                                                           SelectedDate.Day);
            return dialog;
        }

        public void OnDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth)
        {
            SelectedDate = new C_YMD(year, monthOfYear + 1, dayOfMonth);
            DateSelected?.Invoke(this, new DatePickerEventArgs(new C_YMD(year, monthOfYear + 1, dayOfMonth)));
        }

        public class DatePickerEventArgs : EventArgs
        {
            public C_YMD Date;

            public DatePickerEventArgs(C_YMD ymd)
            {
                Date = ymd;
            }
        }

    }
}
