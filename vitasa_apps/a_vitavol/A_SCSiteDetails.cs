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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_SCSiteDetails")]
    public class A_SCSiteDetails : Activity
    {
        C_Global Global;
        C_VitaSite SelectedSite;
        C_YMD SelectedDate;
        C_CalendarEntry SelectedCalendarEntry;
        C_VitaUser LoggedInUser;

        TextView L_SiteName;
        TextView L_Date;
        TextView L_OpenTime;
        TextView L_CloseTime;
        CheckBox CB_SiteIsOpen;
        Button B_Save;
        Button B_OpenTime;
        Button B_CloseTime;
        ProgressBar PB_Busy;

        C_TimePicker OpenTimePicker;
        C_TimePicker CloseTimePicker;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            SetContentView(Resource.Layout.SCSiteDetails);

            View view = FindViewById(Resource.Id.V_SCSiteDetails);
            view.SetBackgroundColor(C_Common.StandardBackground);

            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SCSiteDetails_SiteOpen);
            B_Save = FindViewById<Button>(Resource.Id.B_SCSiteDetails_Save);
            B_OpenTime = FindViewById<Button>(Resource.Id.B_OpenTime);
            B_CloseTime = FindViewById<Button>(Resource.Id.B_CloseTime);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SCSiteDetails_SiteName);
            L_Date = FindViewById<TextView>(Resource.Id.L_SCSiteDetails_Date);
            L_OpenTime = FindViewById<TextView>(Resource.Id.L_OpenTime);
            L_CloseTime = FindViewById<TextView>(Resource.Id.L_CloseTime);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_SCSiteDetails_Busy);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            SelectedDate = Global.CalendarDate;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
            // we make a cloned copy so that we don't commit until the save
            SelectedCalendarEntry = new C_CalendarEntry(SelectedSite.GetCalendarEntryForDate(SelectedDate));

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
                SelectedCalendarEntry.SiteIsOpen = CB_SiteIsOpen.Checked;

                B_OpenTime.Enabled = SelectedCalendarEntry.SiteIsOpen;
                B_CloseTime.Enabled = SelectedCalendarEntry.SiteIsOpen;
            };

            B_Save.Click += (sender, e) => 
            {
                SelectedCalendarEntry.SiteIsOpen = CB_SiteIsOpen.Checked;
                //SelectedCalendarEntry.OpenTime = new C_HMS(L_OpenTime.Text);
                //SelectedCalendarEntry.CloseTime = new C_HMS(L_CloseTime.Text);
                C_CalendarEntry ce = SelectedSite.GetCalendarEntryForDate(SelectedDate);
                ce.CopyFrom(SelectedCalendarEntry);

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(true);

                Task.Run(async () =>
                {
                    C_IOResult ior = await Global.UpdateCalendarEntry(SelectedSite, LoggedInUser.Token, ce);

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if ((ior != null) && ior.Success)
                            StartActivity(new Intent(this, typeof(A_SCSite)));
                        else
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                                 "Error - enable to update the calendar",
                                 ior.ErrorMessage,
                                 E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                    }
                    RunOnUiThread(p);
                });
            };

            OpenTimePicker = new C_TimePicker(SelectedCalendarEntry.OpenTime);
            OpenTimePicker.TimeSelected += (object sender, C_TimePicker.TimePickerEventArgs args) =>
            {
                SelectedCalendarEntry.OpenTime = args.Time;
                L_OpenTime.Text = args.Time.ToString("hh:mm p");
            };
            L_OpenTime.Text = SelectedCalendarEntry.OpenTime.ToString("hh:mm p");

            CloseTimePicker = new C_TimePicker(SelectedCalendarEntry.CloseTime);
            CloseTimePicker.TimeSelected += (object sender, C_TimePicker.TimePickerEventArgs args) =>
            {
                SelectedCalendarEntry.CloseTime = args.Time;
                L_CloseTime.Text = args.Time.ToString("hh:mm p");
            };
            L_CloseTime.Text = SelectedCalendarEntry.CloseTime.ToString("hh:mm p");

            L_SiteName.Text = SelectedSite.Name;
            L_Date.Text = SelectedDate.ToString("mmm dd, yyyy");

            B_OpenTime.Enabled = SelectedCalendarEntry.SiteIsOpen;
            B_CloseTime.Enabled = SelectedCalendarEntry.SiteIsOpen;

            CB_SiteIsOpen.Checked = SelectedCalendarEntry.SiteIsOpen;
        }

        private void EnableUI(bool en)
        {
            CB_SiteIsOpen.Enabled = en;
            B_OpenTime.Enabled = en && SelectedCalendarEntry.SiteIsOpen;
            B_CloseTime.Enabled = en && SelectedCalendarEntry.SiteIsOpen;
            B_Save.Enabled = en;
        }

        public override void OnBackPressed()
        {
            StartActivity(new Intent(this, typeof(A_SCSite)));
        }
    }
}
