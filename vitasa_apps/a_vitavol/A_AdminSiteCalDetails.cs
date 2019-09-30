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

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteCalDetails")]
    public class A_AdminSiteCalDetails : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;
        C_CalendarEntry SelectedCalendarEntry;

        TextView L_SiteName;
        TextView L_Date;

        CheckBox CB_SiteIsOpen;
        Button B_OpenTime;
        Button B_CloseTime;
        TextView L_OpenTime;
        TextView L_CloseTime;

        Button B_Done;
        ProgressBar PB_Busy;

        C_TimePicker OpenTimePicker;
        C_TimePicker CloseTimePicker;

        C_HMS SelectedOpenTime;
        C_HMS SelectedCloseTime;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            SetContentView(Resource.Layout.AdminSiteCalDetails);

            View view = FindViewById(Resource.Id.V_AdminSiteCalDetails);
            view.SetBackgroundColor(C_Common.StandardBackground);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.SelectedSiteTemp;
            SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(Global.CalendarDate);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            B_OpenTime = FindViewById<Button>(Resource.Id.B_OpenTime);
            B_CloseTime = FindViewById<Button>(Resource.Id.B_CloseTime);
            L_OpenTime = FindViewById<TextView>(Resource.Id.L_OpenTime);
            L_CloseTime = FindViewById<TextView>(Resource.Id.L_CloseTime);
            B_Done = FindViewById<Button>(Resource.Id.B_Save);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SiteIsOpen);

            B_Done.Click += (sender, e) => 
            {
                SaveCalDetails();

                StartActivity(new Intent(this, typeof(A_AdminSiteCalendar)));
            };

            B_OpenTime.Click += (sender, e) =>
            {
                OpenTimePicker.Show(FragmentManager, "vita");
            };

            B_CloseTime.Click += (sender, e) =>
            {
                CloseTimePicker.Show(FragmentManager, "vita");
            };

            CB_SiteIsOpen.CheckedChange += (sender, e) =>
            {
                B_OpenTime.Enabled = SelectedCalendarEntry.SiteIsOpen;
                B_CloseTime.Enabled = SelectedCalendarEntry.SiteIsOpen;
            };

            OpenTimePicker = new C_TimePicker(SelectedCalendarEntry.OpenTime);
            OpenTimePicker.TimeSelected += (object sender, C_TimePicker.TimePickerEventArgs args) =>
            {
                SelectedOpenTime = args.Time;
                L_OpenTime.Text = args.Time.ToString("hh:mm p");
            };
            L_OpenTime.Text = SelectedCalendarEntry.OpenTime.ToString("hh:mm p");

            CloseTimePicker = new C_TimePicker(SelectedCalendarEntry.CloseTime);
            CloseTimePicker.TimeSelected += (object sender, C_TimePicker.TimePickerEventArgs args) =>
            {
                SelectedCloseTime = args.Time;
                L_CloseTime.Text = args.Time.ToString("hh:mm p");
            };
            L_CloseTime.Text = SelectedCalendarEntry.CloseTime.ToString("hh:mm p");

            L_SiteName.Text = SelectedSite.Name;
            L_Date.Text = Global.CalendarDate.ToString("mmm dd, yyyy");

            B_OpenTime.Enabled = SelectedCalendarEntry.SiteIsOpen;
            B_CloseTime.Enabled = SelectedCalendarEntry.SiteIsOpen;

            CB_SiteIsOpen.Checked = SelectedCalendarEntry.SiteIsOpen;
        }

        public override void OnBackPressed()
        {
            SaveCalDetails();

            StartActivity(new Intent(this, typeof(A_AdminSiteCalendar)));
        }

        private void SaveCalDetails()
        {
            SelectedCalendarEntry.SiteIsOpen = CB_SiteIsOpen.Checked;
            SelectedCalendarEntry.OpenTime = SelectedOpenTime;
            SelectedCalendarEntry.CloseTime = SelectedCloseTime;

            SelectedCalendarEntry.Dirty = true;
            SelectedSite.Dirty = true;
        }
    }
}
