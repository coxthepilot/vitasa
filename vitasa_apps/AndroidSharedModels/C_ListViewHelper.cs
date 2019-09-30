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
    public class C_ListViewHelper<T> : BaseAdapter<T>
    {
        public readonly List<T> Items;
        readonly Activity Context;
        readonly ListView LV;

        public delegate string ReturnStringEventHandler(object sender, ListAdapterEventArgs<T> args);
        public delegate bool ReturnBoolEventHandler(object sender, ListAdapterEventArgs<T> args);
        public delegate void TableEventHandler(object sender, ListAdapterEventArgs<T> args);

        public event ReturnStringEventHandler GetTextLabel;
        public event ReturnStringEventHandler GetDetailTextLabel;
        public event ReturnBoolEventHandler IncludeSwitch;
        public event TableEventHandler SwitchValueChanged;

        public C_ListViewHelper(Activity context, ListView lv, List<T> items)
        {
            Context = context;
            Items = items;
            LV = lv;

            LV.Adapter = this;
        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override T this[int position]
        {
            get { return Items[position]; }
        }

        public override int Count
        {
            get { return Items.Count; }
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            View view = convertView;
            if (view == null) // no view to re-use, create new
                view = Context.LayoutInflater.Inflate(a_vitavol.Resource.Layout.ListViewCell, null);

            T t = Items[position];

            view.SetBackgroundColor(C_Common.Color_StandardBackground);

            string text1 = "";
            if (GetTextLabel != null)
                text1 = GetTextLabel(this, new ListAdapterEventArgs<T>(t, position));
            TextView tv1 = view.FindViewById<TextView>(a_vitavol.Resource.Id.Text1);
            tv1.Text = text1;
            tv1.SetTextColor(Android.Graphics.Color.White);

            string text2 = "";
            if (GetDetailTextLabel != null)
                text2 = GetDetailTextLabel(this, new ListAdapterEventArgs<T>(t, position));
            TextView tv2 = view.FindViewById<TextView>(a_vitavol.Resource.Id.Text2);
            tv2.Text = text2;
            tv2.SetTextColor(Android.Graphics.Color.White);

            CheckBox cb = view.FindViewById<CheckBox>(a_vitavol.Resource.Id.CB);
            if (IncludeSwitch != null)
            {
                bool switchState = IncludeSwitch(this, new ListAdapterEventArgs<T>(t, position));
                cb.Checked = switchState;
                cb.Visibility = ViewStates.Visible;
            }
            else
                cb.Visibility = ViewStates.Gone;

            cb.Click += (sender, e) =>
            {
                ListAdapterEventArgs<T> laea = new ListAdapterEventArgs<T>(t, position)
                {
                    SwitchState = cb.Checked
                };
                SwitchValueChanged?.Invoke(this, laea);
            };
            return view;
        }
    }

    public class ListAdapterEventArgs<U> : EventArgs
    {
        public U Item;
        public bool SwitchState;
        public int row;

        public ListAdapterEventArgs(U ux, int r)
        {
            Item = ux;
            row = r;
        }
    }
}
