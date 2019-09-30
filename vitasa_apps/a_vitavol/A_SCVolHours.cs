using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "VITA: Volunteer Hours")]
    public class A_SCVolHours : Activity
    {
        C_Global Global;
        C_VitaSite SelectedSite;
        C_VitaUser LoggedInUser;

        ListView LV_Volunteers;
        TextView L_SiteName;
        Button B_MarkApproved;
        Button B_AddHours;
        Button B_SiteCalendar;
        ProgressBar PB_Busy;

        C_ListViewHelper<C_WorkLogItem> WorkItemsListViewHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            //SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.SCVolHours);

            LV_Volunteers = FindViewById<ListView>(Resource.Id.LV_List);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            B_AddHours = FindViewById<Button>(Resource.Id.B_Add);
            B_MarkApproved = FindViewById<Button>(Resource.Id.B_MarkApproved);
            B_SiteCalendar = FindViewById<Button>(Resource.Id.B_SCCalendar);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_SCVolHours);

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            B_MarkApproved.Click += (sender, e) => 
            {
                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () =>
                {
                    bool ioerror = false;
                    foreach (C_WorkLogItem wi in SelectedSite.WorkLogItems)
                    {
                        wi.Approved = true;
                        C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                        if (user == null)
                            user = FindUserForWorkItem(wi);
                        if (user != null)
                        {
                            C_IOResult ior = await Global.UpdateWorkLogItem(user, LoggedInUser.Token, wi);
                            if (!ior.Success)
                                ioerror = true;
                        }
                    }

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (ioerror)
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                                "Error",
                                "Unable to save one or more work items.",
                                E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                        WorkItemsListViewHelper.NotifyDataSetChanged();
                    }
                    RunOnUiThread(p);
                });
            };

            B_AddHours.Click += (sender, e) => 
            {
                // signal that this is a new item
                Global.SelectedWorkItem = null;
                StartActivity(new Intent(this, typeof(A_SCAddVolHours)));
            };

            B_SiteCalendar.Click += (sender, e) =>
            {
                StartActivity(new Intent(this, typeof(A_SCSite)));
            };

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);
            Task.Run(async () =>
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                SelectedSite = await Global.FetchSiteWithSlug(Global.SelectedSiteSlug);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    L_SiteName.Text = SelectedSite.Name;

                    SelectedSite.WorkLogItems.Sort(C_WorkLogItem.CompareByDateReverse);
                    WorkItemsListViewHelper = new C_ListViewHelper<C_WorkLogItem>(this, LV_Volunteers, SelectedSite.WorkLogItems);
                    WorkItemsListViewHelper.GetTextLabel += (sender, args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        C_VitaUser wi_user = Global.GetUserFromCacheNoFetch(wi.UserId);
                        if (wi_user == null)
                            wi_user = FindUserForWorkItem(wi);
                        string s = wi_user == null ? "" : wi_user.Name;
                        return s;
                    };
                    WorkItemsListViewHelper.GetDetailTextLabel += (sender, args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        string apps = wi.Approved ? " [approved]" : " [not approved]";
                        return wi.Date.ToString("mmm dd, yyyy") + " for " + wi.Hours.ToString() + " hours" + apps;
                    };
                    LV_Volunteers.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) => 
                    {
                        // signal that we are doing an edit, not creating a new item
                        Global.SelectedWorkItem = WorkItemsListViewHelper.Items[e.Position];

                        StartActivity(new Intent(this, typeof(A_SCAddVolHours)));
                    };
                }
                RunOnUiThread(p);
            });
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(A_SCSites)));
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            LV_Volunteers.Enabled = en;
            B_AddHours.Enabled = en;
            B_MarkApproved.Enabled = en;
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

    }
}
