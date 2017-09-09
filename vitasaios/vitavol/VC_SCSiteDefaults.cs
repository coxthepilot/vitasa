using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSiteDefaults : UIViewController
	{
        // Input
        //   SelectedSite
        //   SelectedDayOfWeek

		C_Global Global;

        // a flag to tell if the user made changes
        bool Dirty;

		public VC_SCSiteDefaults (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            if ((Global.SelectedSite == null)
                || (Global.SelectedDayOfWeek == -1))
                throw new ApplicationException("required parameters not found");

			B_Back.TouchUpInside += async (sender, e) => 
            {
                if (Dirty)
                {
                    Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this, 
                             "Save Changes?", 
                             "Changes were made. Save before leaving?", 
                             Tools.E_MessageBoxButtons.YesNo);

                    if (mbres != Tools.E_MessageBoxResults.Yes)
                    {
						PerformSegue("Segue_SCSiteDefaultsToSCSiteCalendar", this);
                        return;
					}
                        
                    bool success = await SaveChanges();
                    if (!success)
                    {
						Tools.E_MessageBoxResults mbres1 = await Tools.MessageBox(this,
								                                                  "Error",
								                                                  "Unable to save the changes?",
                                                                                  Tools.E_MessageBoxButtons.Ok);
                        return;
					}
                }

                PerformSegue("Segue_SCSiteDefaultsToSCSiteCalendar", this);
            };

            L_SiteName.Text = Global.SelectedSite.Name;
            L_DayOfWeek.Text = C_YMD.DayOfWeekNames[Global.SelectedDayOfWeek];

            C_SiteCalendarEntry calDefaults = Global.SelectedSite.SiteCalendar[Global.SelectedDayOfWeek];

            SW_IsOpen.On = calDefaults.OpenTime != calDefaults.CloseTime;

            SetEnableOnControls(SW_IsOpen.On);

			SW_IsOpen.ValueChanged += (sender, e) => 
            {
				SetEnableOnControls(SW_IsOpen.On);
                Dirty = true;
                B_SaveDefaults.Enabled = true;
			};

            B_SaveDefaults.TouchUpInside += async (sender, e) => 
            {
				bool success = await SaveChanges();
				if (!success)
				{
					Tools.E_MessageBoxResults mbres1 = await Tools.MessageBox(this,
																			  "Error",
																			  "Unable to save the changes?",
																			  Tools.E_MessageBoxButtons.Ok);
					return;
				}

				PerformSegue("Segue_SCSiteDefaultsToSCSiteCalendar", this);
			};

			// open time
			// Setup the textfield for the date to use a date picker in an action sheet/toolbar
			UIDatePicker DP_OpenTime = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Time,
                Date = Tools.BuildNSDateFromTime(calDefaults.OpenTime)
			};

            UIToolbar ToolBar_OpenTime = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_OpenTime.SizeToFit();

            UIBarButtonItem doneButtonOpen = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
                DateTime dt = Tools.NSDateToDateTime(DP_OpenTime.Date);
                C_HMS hms = new C_HMS(dt);
                TB_OpenTime.Text = hms.ToString("hh:mm p");
				TB_OpenTime.ResignFirstResponder();
                Dirty = true;
                B_SaveDefaults.Enabled = true;
			});
			ToolBar_OpenTime.SetItems(new UIBarButtonItem[] { doneButtonOpen }, true);
			UITextAttributes uitaot = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonOpen.SetTitleTextAttributes(uitaot, UIControlState.Normal);

			TB_OpenTime.InputView = DP_OpenTime;
			TB_OpenTime.InputAccessoryView = ToolBar_OpenTime;
			C_HMS openTime = new C_HMS(calDefaults.OpenTime);
			TB_OpenTime.Text = openTime.ToString("hh:mm p");

			// close time
			UIDatePicker DP_CloseTime = new UIDatePicker()
			{
				Mode = UIDatePickerMode.Time,
                Date = Tools.BuildNSDateFromTime(calDefaults.CloseTime)
			};

			UIToolbar ToolBar_CloseTime = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_CloseTime.SizeToFit();

			UIBarButtonItem doneButtonClose = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
				DateTime dt = Tools.NSDateToDateTime(DP_CloseTime.Date);
				C_HMS hms = new C_HMS(dt);
                TB_CloseTime.Text = hms.ToString("hh:mm p");
				TB_CloseTime.ResignFirstResponder();
				Dirty = true;
				B_SaveDefaults.Enabled = true;
			});
			ToolBar_CloseTime.SetItems(new UIBarButtonItem[] { doneButtonClose }, true);
			UITextAttributes uitact = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonClose.SetTitleTextAttributes(uitact, UIControlState.Normal);

			TB_CloseTime.InputView = DP_CloseTime;
			TB_CloseTime.InputAccessoryView = ToolBar_CloseTime;
			C_HMS closeTime = new C_HMS(calDefaults.CloseTime);
			TB_CloseTime.Text = closeTime.ToString("hh:mm p");

            // number of efilers
            UIPickerView PV_EFilers = new UIPickerView()
            {
                Model = new EFilerPickerViewModel(),
            };
            UIToolbar ToolBar_EFiler = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_EFiler.SizeToFit();

			UIBarButtonItem doneButtonEFiler = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
                int num = (int)PV_EFilers.SelectedRowInComponent(0);
                TB_EFilers.Text = num.ToString();
				TB_EFilers.ResignFirstResponder();
				Dirty = true;
				B_SaveDefaults.Enabled = true;
			});
			ToolBar_EFiler.SetItems(new UIBarButtonItem[] { doneButtonEFiler }, true);
			UITextAttributes uitaef = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonEFiler.SetTitleTextAttributes(uitaef, UIControlState.Normal);

            PV_EFilers.Select(calDefaults.NumEFilers, 0, true);
            PV_EFilers.ShowSelectionIndicator = true;
            TB_EFilers.InputView = PV_EFilers;
			TB_EFilers.InputAccessoryView = ToolBar_EFiler;
            TB_EFilers.Text = calDefaults.NumEFilers.ToString();
		}

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_SaveDefaults.Enabled = en && Dirty;
            TB_EFilers.Enabled = en;
            TB_OpenTime.Enabled = en;
            TB_CloseTime.Enabled = en;
            SW_IsOpen.Enabled = en;
        }

        private async Task<bool> SaveChanges()
        {
			try
			{
				C_HMS openTimex = new C_HMS(TB_OpenTime.Text);
                C_HMS closeTimex = new C_HMS(TB_CloseTime.Text);

				int numEFilers = Convert.ToInt32(TB_EFilers.Text);
				if (!SW_IsOpen.On)
					closeTimex = openTimex;

                EnableUI(false);
                AI_Busy.StartAnimating();

				bool success = await Global.SelectedSite.UpdateDefaultCalendar(Global.SelectedDayOfWeek, openTimex, closeTimex, numEFilers, Global.LoggedInUser.Token);

                EnableUI(true);
                AI_Busy.StopAnimating();

                C_SiteCalendarEntry ce = Global.SelectedSite.SiteCalendar[Global.SelectedDayOfWeek];
                ce.OpenTime = openTimex.ToString("hh:mm");
                ce.CloseTime = closeTimex.ToString("hh:mm");
                ce.NumEFilers = numEFilers;

                if (!success)
                {
                    Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this, 
                                                                             "Error", 
                                                                             "Failed to update the Site calendar", 
                                                                             Tools.E_MessageBoxButtons.Ok);
                }
                else
                {
                    Dirty = false;
                    B_SaveDefaults.Enabled = false;
				}
			}
			catch (Exception e1)
			{
				Console.WriteLine(e1.Message);
			}

            // we only have a return value since an async MUST return a value...sigh
            return true;
		}

		public class EFilerPickerViewModel : UIPickerViewModel
        {
            readonly List<string> Choices;

            public EFilerPickerViewModel()
            {
                Choices = new List<string>();
                for (int ix = 0; ix != 30; ix++)
                    Choices.Add(ix.ToString());
            }

            public override nint GetComponentCount(UIPickerView pickerView)
            {
                return 1;
            }

            public override nint GetRowsInComponent(UIPickerView pickerView, nint component)
            {
                return Choices.Count;
            }

            public override string GetTitle(UIPickerView pickerView, nint row, nint component)
            {
                return Choices[(int)row];
            }
		}

        private void SetEnableOnControls(bool enable)
        {
			TB_OpenTime.Enabled = enable;
			TB_CloseTime.Enabled = enable;
            TB_EFilers.Enabled = enable;
		}
    }
}