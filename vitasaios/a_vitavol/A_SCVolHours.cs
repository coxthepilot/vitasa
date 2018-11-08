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
        Spinner SP_Date;
        ProgressBar PB_Busy;

        List<C_WorkLogItem> OurWorkLogItems;
        List<C_YMD> DatesTheSiteHasACalendarEntry;
        C_ListViewHelper<C_WorkLogItem> DatesListViewHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.SCVolHours);

            LV_Volunteers = FindViewById<ListView>(Resource.Id.LV_List);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            B_AddHours = FindViewById<Button>(Resource.Id.B_Add);
            B_MarkApproved = FindViewById<Button>(Resource.Id.B_MarkApproved);
            SP_Date = FindViewById<Spinner>(Resource.Id.SP_Date);
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
                    foreach (C_WorkLogItem wi in OurWorkLogItems)
                    {
                        wi.Approved = true;
                        C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
                        C_IOResult ior = await Global.UpdateWorkLogItem(user, LoggedInUser.Token, wi);
                        if (!ior.Success)
                            ioerror = true;
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
                        DatesListViewHelper.NotifyDataSetChanged();
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

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);
            Task.Run(async () =>
            {
                OurWorkLogItems = new List<C_WorkLogItem>();
                foreach (C_WorkLogItem wi in SelectedSite.WorkLogItems)
                {
                    if (wi.Date == Global.CalendarDate)
                        OurWorkLogItems.Add(wi);
                }

                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    L_SiteName.Text = SelectedSite.Name;

                    // figure out all the dates that have worklog items
                    DatesTheSiteHasACalendarEntry = new List<C_YMD>();
                    foreach (C_CalendarEntry ce in SelectedSite.SiteCalendar)
                        DatesTheSiteHasACalendarEntry.Add(ce.Date);
                    DatesTheSiteHasACalendarEntry.Sort(C_YMD.CompareYMD);

                    C_SPinnerHelper<C_YMD> DatesHelper = new C_SPinnerHelper<C_YMD>(this, SP_Date, DatesTheSiteHasACalendarEntry);
                    DatesHelper.ItemSelected += (object sender, SpinnerEventArgs<C_YMD> args) => 
                    {
                        OurWorkLogItems.Clear();
                        foreach (C_WorkLogItem wi in SelectedSite.WorkLogItems)
                        {
                            if (wi.Date == Global.CalendarDate)
                                OurWorkLogItems.Add(wi);
                        }
                        DatesListViewHelper.NotifyDataSetChanged();
                    };

                    DatesListViewHelper = new C_ListViewHelper<C_WorkLogItem>(this, LV_Volunteers, OurWorkLogItems);
                    DatesListViewHelper.GetTextLabel += (sender, args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        C_VitaUser wi_user = Global.GetUserFromCacheNoFetch(wi.UserId);
                        return wi_user.Name;
                    };
                    DatesListViewHelper.GetDetailTextLabel += (sender, args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        string apps = wi.Approved ? " [approved]" : " [not approved]";
                        return wi.Hours.ToString() + " hours" + apps;
                    };
                    LV_Volunteers.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) => 
                    {
                        // signal that we are doing an edit, not creating a new item
                        Global.SelectedWorkItem = DatesListViewHelper.Items[e.Position];

                        StartActivity(new Intent(this, typeof(A_SCAddVolHours)));
                    };
                }
                RunOnUiThread(p);
            });
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(A_SCSite)));

        private void EnableUI(bool en)
        {
            LV_Volunteers.Enabled = en;
            B_AddHours.Enabled = en;
            B_MarkApproved.Enabled = en;
            SP_Date.Enabled = en;
        }
    }
}
