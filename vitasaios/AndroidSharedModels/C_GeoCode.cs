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
    public static class C_GeoCode
    {
        public static  GeoPoint GetLocationFromAddress(Context context, string strAddress)
        {
            Geocoder coder = new Geocoder(context);
            IList<Address> addresses;
            GeoPoint _geoPoint = null;
            try
            {
                addresses = coder.GetFromLocationName(strAddress, 5);
                if ((addresses == null) || (addresses.Count == 0))
                {
                    return null;
                }
                Address location = addresses[0];
                _geoPoint = new GeoPoint(location.Latitude, location.Longitude);
            }
            catch (Exception ex) { Log.Debug("vita", ex.Message); _geoPoint = null; }

            return _geoPoint;
        }

        public class GeoPoint
        {
            public double Latitude;
            public double Longitude;

            public GeoPoint(double lat, double longi)
            {
                Latitude = lat;
                Longitude = longi;
            }
        }
    }
}
