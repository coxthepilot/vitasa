using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_SCAddVolHours")]
    public class A_SCAddVolHours : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;

        Spinner SP_Volunteer;
        EditText TB_Hours;
        ProgressBar PB_Busy;
        Button B_Save;
        TextView L_Date;
        TextView L_SiteName;

        List<C_VitaUser> AllVolunteers;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            SetContentView(Resource.Layout.SCAddVolHours);

            SP_Volunteer = FindViewById<Spinner>(Resource.Id.SP_Volunteer);
            TB_Hours = FindViewById<EditText>(Resource.Id.TB_Hours);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);

            C_Common.SetViewColors(this, Resource.Id.V_SCAddVolHours);

            B_Save.Click += (sender, e) => 
            {
                float hours = 0.0f;
                float.TryParse(TB_Hours.Text, out hours);

                int uid = SP_Volunteer.SelectedItemPosition;
                C_VitaUser u = AllVolunteers[uid];

                C_IOResult ior = null;

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);
                Task.Run(async () =>
                {
                    C_WorkLogItem wi = Global.SelectedWorkItem;
                    if (wi == null)
                    {
                        // we are to create a new workitem
                        wi = new C_WorkLogItem
                        {
                            Approved = false,
                            Date = Global.CalendarDate,
                            id = -1,
                            SiteId = SelectedSite.id,
                            UserId = u.id,
                            Hours = hours
                        };
                        SelectedSite.WorkLogItems.Add(wi);
                        ior = await Global.AddWorkLogItem(u, LoggedInUser.Token, wi);
                    }
                    else
                    {
                        wi.UserId = u.id;
                        wi.Hours = hours;

                        ior = await Global.UpdateWorkLogItem(u, LoggedInUser.Token, wi);
                    }

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                                "Error",
                                "Unable to save the work items.",
                                E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                        StartActivity(new Intent(this, typeof(A_SCVolHours)));
                    }
                    RunOnUiThread(p);
                });
            };

            TB_Hours.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => SetSaveEnabled();

            L_Date.Text = Global.CalendarDate.ToString("mmm dd, yyyy");
            L_SiteName.Text = SelectedSite.Name;

            // build the list of volunteers to choose from
            List<C_VitaUser> users = Global.GetAllUsersNoCache();
            AllVolunteers = new List<C_VitaUser>();
            foreach (C_VitaUser user in users)
            {
                if (user.HasVolunteer)
                    AllVolunteers.Add(user);
            }
            AllVolunteers.Sort(C_VitaUser.CompareByNameToLower);

            ArrayAdapter VolunteerAdapter = new ArrayAdapter(this, Resource.Layout.SpinnerItem, AllVolunteers);
            VolunteerAdapter.SetDropDownViewResource(Resource.Layout.SpinnerItem);
            SP_Volunteer.Adapter = VolunteerAdapter;

            if (Global.SelectedWorkItem != null)
            {
                TB_Hours.Text = Global.SelectedWorkItem.Hours.ToString();

                var ou = AllVolunteers.Where(u1 => u1.id == Global.SelectedWorkItem.UserId);
                C_VitaUser u = ou.FirstOrDefault();
                int selix = AllVolunteers.IndexOf(u);

                if (selix != -1)
                    SP_Volunteer.SetSelection(selix);
            }

            SetSaveEnabled();
        }

        private void EnableUI(bool en)
        {
            SP_Volunteer.Enabled = en;
            TB_Hours.Enabled = en;
            B_Save.Enabled = en;
        }

        private void SetSaveEnabled()
        {
            bool en = !(string.IsNullOrWhiteSpace(TB_Hours.Text) && HoursAreOK());
            B_Save.Enabled = en;
        }

        private bool HoursAreOK()
        {
            if (TB_Hours.Text.Length == 0)
                return false;

            bool res = false;
            try
            {
                float f = Convert.ToSingle(TB_Hours.Text);
                res = Math.Abs(f) > 0.001F;
            }
            catch
            {
                res = false;
            }

            return res;
        }

        public override void OnBackPressed() => 
            StartActivity(new Intent(this, typeof(A_SCVolHours)));
    }
}
