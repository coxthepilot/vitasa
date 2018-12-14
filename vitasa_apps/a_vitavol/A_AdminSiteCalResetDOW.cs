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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteCalResetDOW")]
    public class A_AdminSiteCalResetDOW : Activity
    {
        C_Global Global;
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

        bool Dirty;

        C_HMS SelectedOpenTime;
        C_HMS SelectedCloseTime;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            SetContentView(Resource.Layout.AdminSiteCalResetDOW);

            View view = FindViewById(Resource.Id.V_AdminSiteCalResetDOW);
            view.SetBackgroundColor(C_Common.StandardBackground);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            Dirty = false;

            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SiteIsOpen);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            B_OpenTime = FindViewById<Button>(Resource.Id.B_OpenTime);
            B_CloseTime = FindViewById<Button>(Resource.Id.B_CloseTime);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_Date = FindViewById<TextView>(Resource.Id.L_DOW);
            L_OpenTime = FindViewById<TextView>(Resource.Id.L_OpenTime);
            L_CloseTime = FindViewById<TextView>(Resource.Id.L_CloseTime);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

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
                Dirty = true;

                B_OpenTime.Enabled = CB_SiteIsOpen.Checked;
                B_CloseTime.Enabled = CB_SiteIsOpen.Checked;
            };

            B_Save.Click += (sender, e) =>
            {
                SaveForm();

                StartActivity(new Intent(this, typeof(A_AdminSiteCalReset)));
            };

            CB_SiteIsOpen.CheckedChange += (sender, e) => { Dirty = true; };

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
            L_Date.Text = Global.SelectedDOW.ToString();

            var ou = Global.DOWCalendar.Where(ce => ce.DOW == Global.SelectedDOW);
            if (ou.Any())
            {
                C_CalendarEntry SelectedCalendarEntry = ou.FirstOrDefault();

                CB_SiteIsOpen.Checked = SelectedCalendarEntry.SiteIsOpen;
                B_OpenTime.Enabled = CB_SiteIsOpen.Checked;
                B_CloseTime.Enabled = CB_SiteIsOpen.Checked;

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

                SelectedCalendarEntry.Dirty = true;
            }
        }

        public override void OnBackPressed()
        {
            if (Dirty)
            {
                C_MessageBox mbox = new C_MessageBox(this,
                    "Changes",
                    "Changes made. Save the changes?",
                     E_MessageBoxButtons.YesNoCancel);
                mbox.Show();
                mbox.Dismissed += (object sender, C_MessageBoxEventArgs args) =>
                {
                    if (args.Result == E_MessageBoxResults.Yes)
                    {
                        SaveForm();

                        StartActivity(new Intent(this, typeof(A_AdminSiteCalReset)));
                    }
                    else if (args.Result == E_MessageBoxResults.No)
                        StartActivity(new Intent(this, typeof(A_AdminSiteCalReset)));
                    // else cancel, just return to the form
                };
            }
            else
                StartActivity(new Intent(this, typeof(A_AdminSiteCalReset)));
        }

        private void SaveForm()
        {
            var ou = Global.DOWCalendar.Where(ce => ce.DOW == Global.SelectedDOW);
            if (!ou.Any())
                return;

            C_CalendarEntry cex = ou.FirstOrDefault();

            cex.SiteIsOpen = CB_SiteIsOpen.Checked;

            cex.OpenTime = SelectedOpenTime;
            cex.CloseTime = SelectedCloseTime;
        }
    }
}
