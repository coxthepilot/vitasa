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
        C_ItemPicker<C_YMD> DatePicker;

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

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() =>
            {
                C_Common.DropFirstResponder(View);
            });

            L_Title.UserInteractionEnabled = true;
            L_Title.AddGestureRecognizer(labelTap);
            L_SiteName.UserInteractionEnabled = true;
            L_SiteName.AddGestureRecognizer(labelTap);

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SCAddVolHoursToSCVolHours", this);

            B_Cancel.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SCAddVolHoursToSCVolHours", this);

            B_Save.TouchUpInside += (sender, e) => 
            {
                double hours = 0.0f;
                double.TryParse(TB_Hours.Text, out hours);

                C_VitaUser userPicked = UserItemPicker.Selection;

                C_IOResult ior = null;

                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    if (Global.SelectedWorkItem == null)
                    {
                        // we are to create a new workitem
                        C_WorkLogItem wi = new C_WorkLogItem(userPicked.id);
                        wi.Date = DatePicker.Selection;
                        wi.SiteSlug = SelectedSite.Slug;
                        wi.Hours = (float)hours;
                        //SelectedSite.WorkLogItems.Add(wi);

                        ior = await Global.AddWorkLogItem(userPicked, LoggedInUser.Token, wi);
                    }
                    else
                    {
                        // if the user is changed, then we need to delete the old work item (since these are under users)
                        C_VitaUser originalUser = FindUserForWorkItem(Global.SelectedWorkItem);
                        if (originalUser.id != UserItemPicker.Selection.id)
                        {
                            C_VitaUser oldUser = FindUserForWorkItem(Global.SelectedWorkItem);
                            if (oldUser != null)
                                ior = await Global.RemoveWorkLogItem(oldUser, LoggedInUser.Token, Global.SelectedWorkItem);

                            Global.SelectedWorkItem.Hours = (float)hours;
                            Global.SelectedWorkItem.Date = DatePicker.Selection;
                            ior = await Global.AddWorkLogItem(userPicked, LoggedInUser.Token, Global.SelectedWorkItem);
                        }
                        else
                        {
                            Global.SelectedWorkItem.Hours = (float)hours;
                            Global.SelectedWorkItem.Date = DatePicker.Selection;
                            ior = await Global.UpdateWorkLogItem(userPicked, LoggedInUser.Token, Global.SelectedWorkItem);
                        }
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

            L_SiteName.Text = SelectedSite.Name;

            // build the list of volunteers to choose from
            List<C_VitaUser> users = Global.GetAllUsersNoCache();

            List<C_VitaUser> volunteers = new List<C_VitaUser>();
            foreach (C_VitaUser user in users)
                if (user.HasVolunteer) volunteers.Add(user);
            volunteers.Sort(C_VitaUser.CompareByNameToLower);
            UserItemPicker = new C_ItemPicker<C_VitaUser>(TB_Volunteer, volunteers);

            List<C_YMD> dates = new List<C_YMD>();
            foreach (C_CalendarEntry ce in SelectedSite.SiteCalendar)
            {
                if (ce.SiteIsOpen && !dates.Contains(ce.Date))
                    dates.Add(ce.Date);
            }
            dates.Sort(C_YMD.CompareYMD);
            DatePicker = new C_ItemPicker<C_YMD>(TB_Date, dates);

            if (Global.CalendarDate < dates[0])
                Global.CalendarDate = dates[0];
            if (Global.SelectedWorkItem == null)
                DatePicker.SetSelection(Global.CalendarDate);

            if (Global.SelectedWorkItem != null)
            {
                TB_Hours.Text = Global.SelectedWorkItem.Hours.ToString();

                C_VitaUser suser = Global.GetUserFromCacheNoFetch(Global.SelectedWorkItem.UserId);
                if (suser == null)
                    suser = FindUserForWorkItem(Global.SelectedWorkItem);

                if (suser != null)
                    UserItemPicker.SetSelection(suser);

                DatePicker.SetSelection(Global.SelectedWorkItem.Date);
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