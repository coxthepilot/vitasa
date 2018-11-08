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
    public class C_SPinnerHelper<T>
    {
        public delegate void SpinnerEventHandler(object sender, SpinnerEventArgs<T> args);

        readonly Spinner OurSPinner;
        readonly List<T> Items;
        readonly ArrayAdapter Adapter;

        public event SpinnerEventHandler ItemSelected;

        public C_SPinnerHelper(Context context, Spinner sp, List<T> items)
        {
            OurSPinner = sp;
            Items = items;

            Adapter = new ArrayAdapter(context, a_vitavol.Resource.Layout.SpinnerItem, items);
            sp.Adapter = Adapter;

            OurSPinner.ItemSelected += (object sender, AdapterView.ItemSelectedEventArgs e) => 
            {
                int ix = e.Position;
                ItemSelected?.Invoke(this, new SpinnerEventArgs<T>(Items[ix], ix));
            };
        }

        public void SetValue(T t)
        {
            int ix = Items.IndexOf(t);
            if (ix != -1)
                OurSPinner.SetSelection(ix);
        }

        public T GetValue()
        {
            T res = default(T);
            int ix = OurSPinner.SelectedItemPosition;
            if (ix != -1)
              res = Items[ix];

            return res;
        }
    }

    public class SpinnerEventArgs<U> : EventArgs
    {
        public U Item;
        public int Position;

        public SpinnerEventArgs(U ux, int pos)
        {
            Item = ux;
            Position = pos;
        }
    }

}
