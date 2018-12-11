using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.Graphics;
using Android.Content.Res;

using System;
using System.Collections.Generic;

namespace zsquared
{
    public class C_DateTouchedEventArgs : EventArgs
    {
        public C_YMD Date;

        public C_DateTouchedEventArgs(C_YMD ymd)
        {
            Date = ymd;
        }
    }

    public class C_GVHelper2
    {
        public event EventHandler<C_DateTouchedEventArgs> DateTouched;

        readonly GridView GV;
        C_DateDetails2[] DateDetails;
        readonly Activity _activity;

        public C_GVHelper2(Activity a, GridView gv)
        {
            GV = gv;
            _activity = a;
        }

        public void SetNewDateDetails(C_DateDetails2[] dateDetails)
        {
            DateDetails = dateDetails;

            GV.ItemClick += GV_ItemClick;

            GV.Adapter = new C_GridViewCalendar2(_activity, DateDetails);
        }

        void GV_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            int FirstDayInMonthOffset = (int)DateDetails[0].Date.DayOfWeek;

            C_DateDetails2 res = new C_DateDetails2(null);
            res.NormalColor = C_Common.Color_StandardBackground;
            res.CanClick = false;

            if (e.Position >= 7)
            {
                int dayOfMonth = e.Position - 7 - FirstDayInMonthOffset;
                bool validDay = (dayOfMonth >= 0) && (dayOfMonth < DateDetails.Length);
                if (validDay)
                    res = DateDetails[dayOfMonth];
            }

            if (res.CanClick)
                DateTouched?.Invoke(this, new C_DateTouchedEventArgs(res.Date));
        }
    }

    public class C_DateDetails2
    {
        public Color NormalColor;
        public Color TextColor;
        public Color BoxColor;

        public bool ShowBox;
        public bool CanClick;

        public C_YMD Date;

        public C_DateDetails2(C_YMD date)
        {
            Date = date;
            CanClick = true;
        }
    }

    public class C_GridViewCalendar2 : BaseAdapter<C_DateDetails2>
    {
        readonly C_DateDetails2[] DateState;
        readonly Activity _activity;
        readonly int FirstDayInMonthOffset;

        public C_GridViewCalendar2(Activity a, C_DateDetails2[] dateDetails)
        {
            DateState = dateDetails;
            _activity = a;
            FirstDayInMonthOffset = (int)DateState[0].Date.DayOfWeek;

        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override int Count
        {
            get
            {
                return 7 * 7;
            }
        }

        public override C_DateDetails2 this[int position]
        {
            get
            {
                C_DateDetails2 res = new C_DateDetails2(null);
                res.NormalColor = C_Common.Color_StandardBackground;
                res.CanClick = false;

                if (position >= 7)
                {
                    int dayOfMonth = position - 7 - FirstDayInMonthOffset;
                    bool validDay = (dayOfMonth >= 0) && (dayOfMonth < DateState.Length);
                    if (validDay)
                        res = DateState[dayOfMonth];
                }

                return res;
            }
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            if (convertView == null)
                convertView = _activity.LayoutInflater.Inflate(a_vitavol.Resource.Layout.GridCell, null);

            TextView L_Cell = convertView.FindViewById<TextView>(a_vitavol.Resource.Id.L_Cell);
            L_Cell.SetHeight(50);

            C_YMD now = C_YMD.Now;

            if (position < 7)
            {
                // 0..6 get the name of the day of the week
                L_Cell.Text = C_Global.AbrevDayOfWeek[position];

                L_Cell.SetBackgroundColor(C_Common.Color_StandardBackground);
                L_Cell.SetTextColor(Color.White);
            }
            else
            {
                // 7..<end> get the day of the month number
                int dayOfMonth = position - 7 - FirstDayInMonthOffset;
                bool validDay = (dayOfMonth >= 0) && (dayOfMonth < DateState.Length);
                if (validDay)
                {
                    C_DateDetails2 dateState = DateState[dayOfMonth];
                    L_Cell.Text = dateState.Date.Day.ToString();

                    Color normColor = dateState.NormalColor;
                    Color textColor = dateState.TextColor;
                    if (dateState.Date < now)
                    {
                        normColor = C_Common.Color_StandardBackground;
                        textColor = Color.White;
                    }

                    L_Cell.SetBackgroundColor(normColor);
                    L_Cell.SetTextColor(textColor);

                    //if ((dateState.ShowBox) && ((dateState.Date >= now) || AllowPastDates))
                        //L_Cell.ContentView.Layer.BorderColor = dateState.BoxColor.CGColor;
                }
                else
                {
                    // non-date; make this blank and disappear
                    L_Cell.Text = "";
                    L_Cell.SetBackgroundColor(C_Common.Color_StandardBackground);
                }
            }

            return convertView;
        }
    }
}
