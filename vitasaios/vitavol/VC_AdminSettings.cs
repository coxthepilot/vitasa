using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSettings : UIViewController
    {
        C_Global Global;

        C_DatePicker FirstDatePicker;
        C_DatePicker LastDatePicker;

        bool Dirty;

        public VC_AdminSettings (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            Dirty = false;

            B_Back.TouchUpInside += async (sender, e) => 
            {
                if (Dirty)
                {
                    E_MessageBoxResults mbres = await MessageBox(this,
                        "Changes",
                        "Changes made. Save the changes?",
                         E_MessageBoxButtons.YesNoCancel);

                    if (mbres == E_MessageBoxResults.Yes)
                        SaveForm();
                    else if (mbres == E_MessageBoxResults.No)
                        PerformSegue("Segue_AdminSettingsToAdminMenu", this);
                    // else cancel, just return to the form
                }
                else
                   PerformSegue("Segue_AdminSettingsToAdminMenu", this);
            };

            B_Save.TouchUpInside += async (sender, e) => 
            {
                if (LastDatePicker.Value <= FirstDatePicker.Value)
                {
                    E_MessageBoxResults mbres = await MessageBox(this,
                        "Error",
                        "The season start must be before the season end.",
                         E_MessageBoxButtons.Ok);
                    return;
                }

                SaveForm();
            };

            TB_Last.AddTarget((sender, e) => { Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_First.AddTarget((sender, e) => { Dirty = true; }, UIControlEvent.AllEditingEvents);
        }

        private void SaveForm()
        {
            C_YMD first = FirstDatePicker.Value;
            C_YMD last = LastDatePicker.Value;

            //Task.Run(async () =>
            //{
            //    C_IOResult iorf = await Global.SetSeasonFirst(first);
            //    C_IOResult iorl = await Global.SetSeasonLast(last);

            //    async void p()
            //    {
            //        if (iorf.Success && iorl.Success)
            //            PerformSegue("Segue_AdminSettingsToAdminMenu", this);
            //        else
            //        {
            //            E_MessageBoxResults mbres = await MessageBox(this,
            //                "Error",
            //                "Unable to save the settings.",
            //                E_MessageBoxButtons.Ok);
            //        }
            //    }
            //    UIApplication.SharedApplication.InvokeOnMainThread(new Action(p));
            //});
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            View.BackgroundColor = C_Common.StandardBackground;
            B_Save.BackgroundColor = C_Common.StandardButton;
            TB_Last.BackgroundColor = C_Common.StandardButton;
            TB_First.BackgroundColor = C_Common.StandardButton;

            B_Save.SetTitleColor(UIColor.FromRGBA(255, 255, 255, 64), UIControlState.Disabled);
            B_Back.SetTitleColor(UIColor.FromRGBA(255, 255, 255, 64), UIControlState.Disabled);

            //Task.Run(async () => 
            //{
            //    C_YMD first = await Global.GetSeasonFirst();
            //    C_YMD last = await Global.GetSeasonLast();

            //    void p()
            //    {
            //        FirstDatePicker = new C_DatePicker(TB_First);
            //        FirstDatePicker.SetValue(first);

            //        LastDatePicker = new C_DatePicker(TB_Last);
            //        LastDatePicker.SetValue(last);
            //    }
            //    UIApplication.SharedApplication.InvokeOnMainThread(new Action(p));
            //});
        }
    }
}