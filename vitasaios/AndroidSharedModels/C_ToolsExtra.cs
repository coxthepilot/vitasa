using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;

using zsquared;


using Android.Gms.Location;
using Android.Gms.Common;
using Android.Gms.Common.Apis;
using Android.Util;
using Android.Locations;

namespace zsquared
{
    public class C_ToolsExtra : Activity
    {
        public C_ToolsExtra()
        {
        }

		public void UpdateBytesCounter(int b)
		{
            a_vitavol.MyAppDelegate myAppDelegate = (a_vitavol.MyAppDelegate)Application;
			I_Global iad = myAppDelegate as I_Global;
			iad.UpdateBytesReceived(b);
		}
	}
}
