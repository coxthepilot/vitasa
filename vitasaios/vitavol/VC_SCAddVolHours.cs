using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_SCAddVolHours : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;

        C_ItemPicker<C_VitaUser> UserItemPicker;

        public VC_SCAddVolHours (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SCAddVolHoursToSCVolHours", this);

            B_Cancel.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SCAddVolHoursToSCVolHours", this);

            B_Save.TouchUpInside += (sender, e) => 
            {
                double hours = 0.0f;
                double.TryParse(TB_Hours.Text, out hours);

                int uid = UserItemPicker.Selection.id;

                C_IOResult ior = null;

                AI_Busy.StartAnimating();
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
                            UserId = uid,
                            Hours = (float)hours
                        };
                        C_VitaUser nuser = Global.GetUserFromCacheNoFetch(wi.UserId);
                        SelectedSite.WorkLogItems.Add(wi);

                        ior = await Global.AddWorkLogItem(nuser, LoggedInUser.Token, wi);
                    }
                    else
                    {
                        C_VitaUser euser = Global.GetUserFromCacheNoFetch(wi.UserId);
                        ior = await Global.UpdateWorkLogItem(euser, LoggedInUser.Token, wi);
                    }

                    async void p()
                    {
                        if (!ior.Success)
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                                "Error",
                                "Unable to save the work items.",
                                E_MessageBoxButtons.Ok);
                        }

                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        PerformSegue("Segue_SCAddVolHoursToSCVolHours", this);
                    }

                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            TB_Hours.AddTarget((sender, e) => 
            {
                SetSaveEnabled();
            }, UIControlEvent.AllEditingEvents);

            TB_Volunteer.AddTarget((sender, e) => 
            {
                SetSaveEnabled();
            }, UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_Date.Text = Global.CalendarDate.ToString("dow mmm dd, yyyy");
            L_SiteName.Text = SelectedSite.Name;

            // build the list of volunteers to choose from
            List<C_VitaUser> users = Global.GetAllUsersNoCache();
            List<C_VitaUser> volunteers = new List<C_VitaUser>();
            foreach (C_VitaUser user in users)
                if (user.HasVolunteer) volunteers.Add(user);
            volunteers.Sort(C_VitaUser.CompareByNameToLower);

            UserItemPicker = new C_ItemPicker<C_VitaUser>(TB_Volunteer, volunteers);

            if (Global.SelectedWorkItem != null)
            {
                TB_Hours.Text = Global.SelectedWorkItem.Hours.ToString();

                C_VitaUser suser = null;
                foreach(C_VitaUser u in users)
                {
                    if (u.id == Global.SelectedWorkItem.UserId)
                    {
                        suser = u;
                        break;
                    }
                }

                if (suser != null)
                    UserItemPicker.SetSelection(suser);
            }

            SetSaveEnabled();
        }

        private void EnableUI(bool en)
        {
            C_Common.EnableUI(View, en);

            B_Save.Enabled = en && !(string.IsNullOrWhiteSpace(TB_Hours.Text) || string.IsNullOrWhiteSpace(TB_Volunteer.Text));
        }

        private void SetSaveEnabled()
        {
            bool en = !(string.IsNullOrWhiteSpace(TB_Hours.Text) || string.IsNullOrWhiteSpace(TB_Volunteer.Text));
            B_Save.Enabled = en;
        }
    }
}