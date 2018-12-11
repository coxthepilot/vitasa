using System;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSiteContactAndNotes : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_AdminSiteContactAndNotes (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() =>
            {
                C_Common.DropFirstResponder(View);
            });

            L_Title.UserInteractionEnabled = true;
            L_Title.AddGestureRecognizer(labelTap);
            L_SiteName.UserInteractionEnabled = true;
            L_SiteName.AddGestureRecognizer(labelTap);

            B_Back.TouchUpInside += (sender, e) =>
            {
                SaveContactAndNotes();
                PerformSegue("Segue_AdminSiteContactAndNotesToAdminSite", this);
            };

            B_Save.TouchUpInside += (sender, e) =>
            {
                SaveContactAndNotes();

                PerformSegue("Segue_AdminSiteContactAndNotesToAdminSite", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            TB_ContactName.Text = Global.SelectedSiteTemp.ContactName;
            TB_ContactPhone.Text = Global.SelectedSiteTemp.ContactPhone;
            TxV_Notes.Text = Global.SelectedSiteTemp.Notes;

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
        }

        private void SaveContactAndNotes()
        {
            Global.SelectedSiteTemp.ContactName = TB_ContactName.Text;
            Global.SelectedSiteTemp.ContactPhone = TB_ContactPhone.Text;
            Global.SelectedSiteTemp.Notes = TxV_Notes.Text;
        }
    }
}