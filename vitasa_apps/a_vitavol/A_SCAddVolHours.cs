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
        Spinner SP_Date;
        EditText TB_Hours;
        ProgressBar PB_Busy;
        Button B_Save;
        TextView L_SiteName;

        List<C_VitaUser> AllVolunteers;
        List<C_YMD> AllDates;

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
            SP_Date = FindViewById<Spinner>(Resource.Id.SP_Date);
            TB_Hours = FindViewById<EditText>(Resource.Id.TB_Hours);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            //L_Date = FindViewById<TextView>(Resource.Id.L_Date);

            C_Common.SetViewColors(this, Resource.Id.V_SCAddVolHours);

            B_Save.Click += (sender, e) => 
            {
                float hours = 0.0f;
                float.TryParse(TB_Hours.Text, out hours);

                int uid = SP_Volunteer.SelectedItemPosition;
                C_VitaUser wiUser = AllVolunteers[uid];

                C_IOResult ior = null;

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                int dateix = SP_Date.SelectedItemPosition;
                C_YMD wiDate = AllDates[dateix];

                Task.Run(async () =>
                {
                    if (Global.SelectedWorkItem == null)
                    {
                        // we are to create a new workitem
                        C_WorkLogItem wi = new C_WorkLogItem(wiUser.id);
                        wi.Date = wiDate;
                        wi.SiteSlug = SelectedSite.Slug;
                        wi.Hours = (float)hours;

                        ior = await Global.AddWorkLogItem(wiUser, LoggedInUser.Token, wi);
                    }
                    else
                    {
                        // if the user is changed, then we need to delete the old work item (since these are under users)
                        C_VitaUser originalUser = FindUserForWorkItem(Global.SelectedWorkItem);
                        Console.WriteLine("old id: " + originalUser.id.ToString() + " new: " + wiUser.id.ToString());
                        if (originalUser.id != wiUser.id)
                        {
                            C_VitaUser oldUser = FindUserForWorkItem(Global.SelectedWorkItem);
                            if (oldUser != null)
                                ior = await Global.RemoveWorkLogItem(oldUser, LoggedInUser.Token, Global.SelectedWorkItem);

                            Global.SelectedWorkItem.Hours = hours;
                            Global.SelectedWorkItem.Date = wiDate;
                            ior = await Global.AddWorkLogItem(wiUser, LoggedInUser.Token, Global.SelectedWorkItem);
                        }
                        else
                        {
                            Global.SelectedWorkItem.Hours = hours;
                            Global.SelectedWorkItem.Date = wiDate;
                            ior = await Global.UpdateWorkLogItem(wiUser, LoggedInUser.Token, Global.SelectedWorkItem);
                        }
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

            //L_Date.Text = Global.CalendarDate.ToString("mmm dd, yyyy");
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

            AllDates = new List<C_YMD>();
            foreach (C_CalendarEntry ce in SelectedSite.SiteCalendar)
            {
                if (ce.SiteIsOpen && !AllDates.Contains(ce.Date))
                    AllDates.Add(ce.Date);
            }
            AllDates.Sort(C_YMD.CompareYMD);
            //DatePicker = new C_ItemPicker<C_YMD>(TB_Date, dates);

            ArrayAdapter DatesAdapter = new ArrayAdapter(this, Resource.Layout.SpinnerItem, AllDates);
            DatesAdapter.SetDropDownViewResource(Resource.Layout.SpinnerItem);
            SP_Date.Adapter = DatesAdapter;

            if (Global.CalendarDate < AllDates[0])
                Global.CalendarDate = AllDates[0];
            SP_Date.SetSelection(0);

            if (Global.SelectedWorkItem != null)
            {
                TB_Hours.Text = Global.SelectedWorkItem.Hours.ToString();

                C_VitaUser suser = Global.GetUserFromCacheNoFetch(Global.SelectedWorkItem.UserId);
                if (suser == null)
                    suser = FindUserForWorkItem(Global.SelectedWorkItem);

                if (suser != null)
                {
                    var ou = AllVolunteers.Where(u1 => u1.id == suser.id);
                    C_VitaUser u = ou.FirstOrDefault();
                    int selix = AllVolunteers.IndexOf(u);

                    if (selix != -1)
                        SP_Volunteer.SetSelection(selix);
                }

                for (int ix = 0; ix != AllDates.Count; ix++) 
                {
                    if (AllDates[ix] == Global.SelectedWorkItem.Date)
                    {
                        SP_Date.SetSelection(ix);
                        break;
                    }
                }
            }

            SetSaveEnabled();
            EnableUI(true);
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            SP_Volunteer.Enabled = en;
            TB_Hours.Enabled = en;
            SetSaveEnabled();
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

        private C_VitaUser FindUserForWorkItem(C_WorkLogItem wi)
        {
            C_VitaUser user = null;
            // the backend is supposed to store the UserId; in the case where it doesn't we do another search for the user
            foreach (C_VitaUser u in Global.UserCache)
            {
                bool found = false;
                foreach (C_WorkLogItem wx in u.WorkItems)
                {
                    if (wx.id == wi.id)
                    {
                        found = true;
                        user = u;
                    }
                }
                if (found)
                    break;
            }
            return user;
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(A_SCVolHours)));
        }
    }
}
