using System;
using UIKit;
using System.Collections.Generic;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminMenu : UIViewController
    {
        enum E_AdminMenu { Users, Sites, Notifications, Suggestions, Mobile, NewUserEmail, NewFeedbackEmail, Settings }

        C_Global Global;
        C_PersistentSettings Settings;

        public VC_AdminMenu (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
            {
                UIStoryboard newStoryBoard = UIStoryboard.FromName("Main", null);
                UIViewController viewControllerYouWantToLoad = newStoryBoard.InstantiateViewController("VCMain");
                PresentViewController(viewControllerYouWantToLoad, false, null);
            };

            B_Logout.TouchUpInside += (sender, e) => 
            {
                Global.LoggedInUserId = -1;

                Settings.UserEmail = "";
                Settings.UserPassword = "";

                UIStoryboard newStoryBoard = UIStoryboard.FromName("Main", null);
                UIViewController viewControllerYouWantToLoad = newStoryBoard.InstantiateViewController("VCMain");
                PresentViewController(viewControllerYouWantToLoad, false, null);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            List<E_AdminMenu> menu = new List<E_AdminMenu>();
            foreach (E_AdminMenu eam in Enum.GetValues(typeof(E_AdminMenu)))
                menu.Add(eam);

            C_TableSource<E_AdminMenu> MenuSource = new C_TableSource<E_AdminMenu>(this, TV_Menu, menu, "menuitem");
            MenuSource.GetTextLabel += (sender, args) => 
            {
                E_AdminMenu wi = args.Item;
                return Tools.FixCamelCaseDisplay(wi.ToString());
            };
            MenuSource.Selected += (sender, args) => 
            {
                switch (args.Item)
                {
                    case E_AdminMenu.Users:
                        PerformSegue("Segue_AdminMenuToAdminUsers", this);
                        break;
                    case E_AdminMenu.Sites:
                        PerformSegue("Segue_AdminMenuToAdminSites", this);
                        break;
                    case E_AdminMenu.Notifications:
                        PerformSegue("Segue_AdminMenuToAdminNotifications", this);
                        break;
                    case E_AdminMenu.Suggestions:
                        PerformSegue("Segue_AdminMenuToAdminSuggestions", this);
                        break;
                    case E_AdminMenu.Mobile:
                        PerformSegue("Segue_AdminMenuToAdminMobile", this);
                        break;
                    case E_AdminMenu.NewUserEmail:
                        Global.EmailDistroType = E_DistroType.NewUser;
                        PerformSegue("Segue_AdminMenuToAdminEmailDistroMgmt", this);
                        break;
                    case E_AdminMenu.NewFeedbackEmail:
                        Global.EmailDistroType = E_DistroType.Feedback;
                        PerformSegue("Segue_AdminMenuToAdminEmailDistroMgmt", this);
                        break;
                    case E_AdminMenu.Settings:
                        Global.ViewCameFrom = E_ViewCameFrom.Admin;

                        UIStoryboard adminStoryBoard = UIStoryboard.FromName("Main", null);
                        UIViewController vc_adminmenu = adminStoryBoard.InstantiateViewController("VolEditSettings");
                        PresentViewController(vc_adminmenu, false, null);
                        //PerformSegue("Segue_AdminMenuToAdminSettings", this);
                        break;
                }
            };
            TV_Menu.Source = MenuSource;
            TV_Menu.ReloadData();
        }
    }
}