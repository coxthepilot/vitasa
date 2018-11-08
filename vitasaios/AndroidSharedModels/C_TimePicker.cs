using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Views;

using Android.Gms.Common.Apis;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Locations;

namespace zsquared
{
    public class C_TimePicker : DialogFragment, TimePickerDialog.IOnTimeSetListener
    {
        public delegate void TimePickerEventHandler(object sender, TimePickerEventArgs args);
        public event TimePickerEventHandler TimeSelected;

        public C_HMS SelectedTime;

        public C_TimePicker(C_HMS startTime)
        {
            SelectedTime = startTime;
        }

        public override Dialog OnCreateDialog(Bundle savedInstanceState)
        {
            TimePickerDialog dialog = new TimePickerDialog(Activity, this, 
                                                           SelectedTime.Hour, 
                                                           SelectedTime.Minutes, 
                                                           false);

            return dialog;
        }

        public void OnTimeSet(TimePicker tpicker, int hour, int min)
        {
            SelectedTime = new C_HMS(hour, min, 0);
            TimeSelected?.Invoke(this, new TimePickerEventArgs(SelectedTime));
        }

        public class TimePickerEventArgs : EventArgs
        {
            public C_HMS Time;

            public TimePickerEventArgs(C_HMS time)
            {
                Time = time;
            }
        }

    }
}
