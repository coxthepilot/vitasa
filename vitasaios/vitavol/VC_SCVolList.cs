using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;
using zsquared;

namespace vitavol
{
    public partial class VC_SCVolList : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_TableSource<C_VitaUser> VolunteersTableSource;

        public VC_SCVolList (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SCVolListToSCSites", this);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            Task.Run(async () => 
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_VitaUser> volunteers = new List<C_VitaUser>();
                foreach(C_VitaUser u in users)
                {
                    if (u.HasVolunteer)
                        volunteers.Add(u);
                }
                volunteers.Sort(SortVolunteers);

                void p()
                {
                    VolunteersTableSource = new C_TableSource<C_VitaUser>(this, TV_Volunteers, volunteers);
                    VolunteersTableSource.GetTextLabel += (object sender, C_TableSource<C_VitaUser>.TableSourceEventArgs<C_VitaUser> args) =>
                    {
                        C_VitaUser user = args.Item;
                        return user.Name;
                    };
                    VolunteersTableSource.GetDetailTextLabel += (object sender, C_TableSource<C_VitaUser>.TableSourceEventArgs<C_VitaUser> args) =>
                    {
                        C_VitaUser user = args.Item;
                        return user.Certification.ToString();
                    };
                    TV_Volunteers.Source = VolunteersTableSource;
                    TV_Volunteers.ReloadData();
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private int SortVolunteers(C_VitaUser u1, C_VitaUser u2)
        {
            int res = u1.Certification.CompareTo(u2.Certification);

            if (res == 0)
                res = string.Compare(u1.Name, u2.Name, StringComparison.Ordinal);

            return res;
        }
    }
}