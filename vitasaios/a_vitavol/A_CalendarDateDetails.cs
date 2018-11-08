using System;
using System.Threading.Tasks;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;
using Android.Content.Res;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_CalendarDateDetails")]
    public class A_CalendarDateDetails : Activity
    {
        C_Global Global;

        TextView L_MainTitle;
        TextView L_SiteName;
        TextView L_Date;
        CheckBox CB_SiteIsOpen;
        Button B_OpenTime;
        TextView L_OpenTime;
        Button B_CloseTime;
        TextView L_CloseTime;
        ProgressBar PB_Busy;
        Button B_Save;
        TextView L_Note;

        C_TimePicker OpenTimePicker;
        C_TimePicker CloseTimePicker;

        C_HMS SelectedOpenTime;
        C_HMS SelectedCloseTime;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            if (Global.CalendarDateDetails == null)
                throw new ApplicationException("date details required");

            SetContentView(Resource.Layout.CalendarDateDetails);

            L_MainTitle = FindViewById<TextView>(Resource.Id.L_MainTitle);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SiteIsOpen);
            B_OpenTime = FindViewById<Button>(Resource.Id.B_OpenTime);
            L_OpenTime = FindViewById<TextView>(Resource.Id.L_OpenTime);
            B_CloseTime = FindViewById<Button>(Resource.Id.B_CloseTime);
            L_CloseTime = FindViewById<TextView>(Resource.Id.L_CloseTime);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            L_Note = FindViewById<TextView>(Resource.Id.L_Note);

            C_Common.SetViewColors(this, Resource.Id.V_CalendarDateDetails);

            if (Global.CalendarDateDetails.SaveAction == E_CalendarDateDetailsSaveAction.ReadOnly)
            {
                CB_SiteIsOpen.Enabled = false;
                B_OpenTime.Enabled = false;
                B_CloseTime.Enabled = false;
                B_Save.Visibility = ViewStates.Gone;
            }

            B_OpenTime.Click += (sender, e) =>
                OpenTimePicker.Show(FragmentManager, "vita");

            B_CloseTime.Click += (sender, e) =>
                CloseTimePicker.Show(FragmentManager, "vita");

            CB_SiteIsOpen.CheckedChange += (object sender, CompoundButton.CheckedChangeEventArgs e) => 
            {
                B_OpenTime.Enabled = e.IsChecked;
                B_CloseTime.Enabled = e.IsChecked;
            };

            B_Save.Click += (object sender, EventArgs e) => 
            {
                Global.CalendarDateDetails.CalendarEntry.SiteIsOpen = CB_SiteIsOpen.Checked;
                Global.CalendarDateDetails.CalendarEntry.OpenTime = SelectedOpenTime;
                Global.CalendarDateDetails.CalendarEntry.CloseTime = SelectedCloseTime;

                if (Global.CalendarDateDetails.SaveAction == E_CalendarDateDetailsSaveAction.None)
                    GoBack();
                else if (Global.CalendarDateDetails.SaveAction == E_CalendarDateDetailsSaveAction.Save)
                {
                    PB_Busy.Visibility = ViewStates.Visible;
                    EnableUI(true);

                    Task.Run(async () =>
                    {
                        C_VitaSite site = await Global.FetchSiteWithSlug(Global.SelectedSiteSlug);
                        C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

                        C_IOResult ior = await Global.UpdateCalendarEntry(site, user.Token, Global.CalendarDateDetails.CalendarEntry);

                        void p()
                        {
                            PB_Busy.Visibility = ViewStates.Gone;
                            EnableUI(true);

                            if ((ior != null) && ior.Success)
                                GoBack();
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
                }
            };

            L_MainTitle.Text = Global.CalendarDateDetails.MainTitle;
            L_SiteName.Text = Global.CalendarDateDetails.SiteName;
            L_Date.Text = Global.CalendarDateDetails.Date;
            L_Note.Text = Global.CalendarDateDetails.Note;

            CB_SiteIsOpen.Checked = Global.CalendarDateDetails.CalendarEntry.SiteIsOpen;
            B_OpenTime.Enabled = CB_SiteIsOpen.Checked && (Global.CalendarDateDetails.SaveAction != E_CalendarDateDetailsSaveAction.ReadOnly);
            B_CloseTime.Enabled = CB_SiteIsOpen.Checked && (Global.CalendarDateDetails.SaveAction != E_CalendarDateDetailsSaveAction.ReadOnly);

            OpenTimePicker = new C_TimePicker(Global.CalendarDateDetails.CalendarEntry.OpenTime);
            OpenTimePicker.TimeSelected += (object sender, C_TimePicker.TimePickerEventArgs args) =>
            {
                SelectedOpenTime = args.Time;
                L_OpenTime.Text = args.Time.ToString("hh:mm p");
            };
            L_OpenTime.Text = Global.CalendarDateDetails.CalendarEntry.OpenTime.ToString("hh:mm p");
            SelectedOpenTime = Global.CalendarDateDetails.CalendarEntry.OpenTime;

            CloseTimePicker = new C_TimePicker(Global.CalendarDateDetails.CalendarEntry.CloseTime);
            CloseTimePicker.TimeSelected += (object sender, C_TimePicker.TimePickerEventArgs args) =>
            {
                SelectedCloseTime = args.Time;
                L_CloseTime.Text = args.Time.ToString("hh:mm p");
            };
            L_CloseTime.Text = Global.CalendarDateDetails.CalendarEntry.CloseTime.ToString("hh:mm p");
            SelectedCloseTime = Global.CalendarDateDetails.CalendarEntry.CloseTime;
        }

        private void EnableUI(bool en)
        {
            CB_SiteIsOpen.Enabled = en && (Global.CalendarDateDetails.SaveAction != E_CalendarDateDetailsSaveAction.ReadOnly);
            B_OpenTime.Enabled = en && Global.CalendarDateDetails.CalendarEntry.SiteIsOpen && (Global.CalendarDateDetails.SaveAction != E_CalendarDateDetailsSaveAction.ReadOnly);
            B_CloseTime.Enabled = en && Global.CalendarDateDetails.CalendarEntry.SiteIsOpen && (Global.CalendarDateDetails.SaveAction != E_CalendarDateDetailsSaveAction.ReadOnly);
            B_Save.Enabled = en && (Global.CalendarDateDetails.SaveAction != E_CalendarDateDetailsSaveAction.ReadOnly);
        }

        public override void OnBackPressed() =>
            GoBack();

        private void GoBack()
        {
            Intent intent = null;
            switch (Global.ViewCameFrom)
            {
                case E_ViewCameFrom.SCSite:
                    intent = new Intent(this, typeof(A_SCSite));
                    break;
                case E_ViewCameFrom.AdminSiteCalendar:
                    intent = new Intent(this, typeof(A_AdminSiteCalendar));
                    break;
                case E_ViewCameFrom.AdminSiteCalReset:
                    intent = new Intent(this, typeof(A_AdminSiteCalReset));
                    break;
                case E_ViewCameFrom.SiteCalendar:
                    intent = new Intent(this, typeof(A_SiteCalendar));
                    break;
                case E_ViewCameFrom.AdminMobileDate:
                    intent = new Intent(this, typeof(A_AdminMobileDate));
                    break;
                default:
                    throw new ApplicationException("unknown view from value");
            }

            if (intent != null)
                StartActivity(intent);
        }
    }
}
