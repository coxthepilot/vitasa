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

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteCalResetAction")]
    public class A_AdminSiteCalResetAction : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        TextView L_SiteName;
        CheckBox CB_Confirm;
        Button B_FirstDate;
        TextView L_FirstDate;
        Button B_LastDate;
        TextView L_LastDate;
        ProgressBar PB_Busy;
        Button B_Save;

        C_DatePicker FirstDatePicker;
        C_DatePicker LastDatePicker;

        C_YMD SelectedFirstDate;
        C_YMD SelectedLastDate;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSiteCalResetAction);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            CB_Confirm = FindViewById<CheckBox>(Resource.Id.CB_Confirm);
            B_FirstDate = FindViewById<Button>(Resource.Id.B_FirstDate);
            L_FirstDate = FindViewById<TextView>(Resource.Id.L_FirstDate);
            B_LastDate = FindViewById<Button>(Resource.Id.B_LastDate);
            L_LastDate = FindViewById<TextView>(Resource.Id.L_LastDate);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteCalResetAction);

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
            CB_Confirm.Checked = false;
            B_Save.Enabled = CB_Confirm.Checked;

            CB_Confirm.CheckedChange += (object sender, CompoundButton.CheckedChangeEventArgs e) => 
                B_Save.Enabled = e.IsChecked;

            B_FirstDate.Click += (sender, e) =>
                FirstDatePicker.Show(FragmentManager, "vita");

            B_LastDate.Click += (sender, e) =>
                LastDatePicker.Show(FragmentManager, "vita");

            B_Save.Click += (object sender, EventArgs e) => 
            {
                C_MessageBox mbox = new C_MessageBox(this,
                    "Are you really sure?",
                    "This action will erase the existing site calendar and create a new one. No Undo.",
                    E_MessageBoxButtons.YesNoCancel);
                mbox.Show();
                mbox.Dismissed += (object sender1, C_MessageBoxEventArgs args) =>
                {
                    if (args.Result == E_MessageBoxResults.Cancel)
                        return;

                    if (args.Result == E_MessageBoxResults.No)
                    {
                        Global.DOWCalendar = null;
                        StartActivity(new Intent(this, typeof(A_AdminSiteCalendar)));
                        return;
                    }

                    bool errors = false;
                    PB_Busy.Visibility = ViewStates.Visible;
                    EnableUI(false);

                    Task.Run(async () => 
                    {
                        errors = await SaveForm();

                        void p()
                        {
                            PB_Busy.Visibility = ViewStates.Gone;
                            EnableUI(true);

                            if (!errors)
                            {
                                Global.DOWCalendar = null;
                                StartActivity(new Intent(this, typeof(A_AdminSiteCalendar)));
                                return;
                            }

                            C_MessageBox mbox1 = new C_MessageBox(this,
                                "Error",
                                "One or more errors occurred. Calendar not updated.",
                                E_MessageBoxButtons.Ok);
                            mbox1.Show();
                        }
                        RunOnUiThread(p);
                    });
                };
            };

            SelectedFirstDate = new C_YMD(2019, 01, 01);
            FirstDatePicker = new C_DatePicker(SelectedFirstDate);
            FirstDatePicker.DateSelected += (object sender, C_DatePicker.DatePickerEventArgs args) =>
            {
                SelectedFirstDate = args.Date;
                L_FirstDate.Text = SelectedFirstDate.ToString("mmm dd, yyyy");
            };
            L_FirstDate.Text = SelectedFirstDate.ToString("mmm dd, yyyy");

            SelectedLastDate = new C_YMD(2019, 04, 15);
            LastDatePicker = new C_DatePicker(SelectedLastDate);
            LastDatePicker.DateSelected += (object sender, C_DatePicker.DatePickerEventArgs args) =>
            {
                SelectedLastDate = args.Date;
                L_LastDate.Text = SelectedLastDate.ToString("mmm dd, yyyy");
            };
            L_LastDate.Text = SelectedLastDate.ToString("mmm dd, yyyy");

            B_FirstDate.Enabled = true;
            B_LastDate.Enabled = true;
        }

        private void EnableUI(bool en)
        {
            B_Save.Enabled = en && CB_Confirm.Checked;
            B_LastDate.Enabled = en;
            B_FirstDate.Enabled = en;
            CB_Confirm.Enabled = en;
        }

        public override void OnBackPressed()
        {
            Global.DOWCalendar = null;
            StartActivity(new Intent(this, typeof(A_AdminSiteCalendar)));
        }

        private async Task<bool> SaveForm()
        {
            bool error = false;
            try
            {
                List<C_CalendarEntry> celist = new List<C_CalendarEntry>();
                foreach (C_CalendarEntry ce in Global.SelectedSiteTemp.SiteCalendar)
                    celist.Add(ce);
                foreach (C_CalendarEntry ce in celist)
                {
                    C_IOResult ior = await Global.RemoveCalendarEntry(Global.SelectedSiteTemp, LoggedInUser.Token, ce);
                    if (!ior.Success)
                    {
                        error = true;
                        break;
                    }
                }

                if (!error)
                {
                    C_YMD today = SelectedFirstDate;
                    C_YMD last = SelectedLastDate;
                    while (today <= last)
                    {
                        DayOfWeek dow = today.DayOfWeek;

                        var ou = Global.DOWCalendar.Where(ce => ce.DOW == dow);
                        if (ou.Any())
                        {
                            C_CalendarEntry tce = ou.FirstOrDefault();
                            C_CalendarEntry nce = new C_CalendarEntry(tce)
                            {
                                Date = today,
                                SiteID = Global.SelectedSiteTemp.id
                            };
                            C_IOResult tior = await Global.CreateCalendarEntry(Global.SelectedSiteTemp, LoggedInUser.Token, nce);

                            if (!tior.Success)
                            {
                                error = true;
                                break;
                            }
                        }
                        today = today.AddDays(1);
                    }
                }
            }
            catch (Exception ex)
            { 
                Log.Debug("vita", ex.Message); 
            }

            return error;
        }
    }
}
