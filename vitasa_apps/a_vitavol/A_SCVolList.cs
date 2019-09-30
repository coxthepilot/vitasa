using System;
using System.Collections.Generic;
using System.Threading.Tasks;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_SCVolList")]
    public class A_SCVolList : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        ListView LV_Volunteers;
        ProgressBar PB_Busy;

        C_ListViewHelper<C_VitaUser> VolunteersListViewHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.SCVolList);

            LV_Volunteers = FindViewById<ListView>(Resource.Id.LV_Volunteers);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_SCSites);

            PB_Busy.Visibility = Android.Views.ViewStates.Visible;

            Task.Run(async () => 
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_VitaUser> volunteers = new List<C_VitaUser>();
                foreach (C_VitaUser u in users)
                {
                    if (u.HasVolunteer)
                        volunteers.Add(u);
                }
                volunteers.Sort(SortVolunteers);

                void p()
                {
                    PB_Busy.Visibility = Android.Views.ViewStates.Gone;

                    VolunteersListViewHelper = new C_ListViewHelper<C_VitaUser>(this, LV_Volunteers, volunteers);
                    VolunteersListViewHelper.GetTextLabel += (sender, args) =>
                    {
                        return args.Item.Name;
                    };
                    VolunteersListViewHelper.GetDetailTextLabel += (object sender, ListAdapterEventArgs<C_VitaUser> args) => 
                    {
                        C_VitaUser user = args.Item;
                        return user.Certification.ToString();
                    };
                }
                RunOnUiThread(p);
            });
        }

        private int SortVolunteers(C_VitaUser u1, C_VitaUser u2)
        {
            int res = u1.Certification.CompareTo(u2.Certification);

            if (res == 0)
                res = string.Compare(u1.Name, u2.Name, StringComparison.Ordinal);

            return res;
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(A_SCSites)));
    }
}
