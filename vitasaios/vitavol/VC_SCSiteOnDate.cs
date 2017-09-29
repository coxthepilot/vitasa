using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSiteOnDate : UIViewController
    {
        // Input:
        //    SelectedSite
        //    SelectedDate
        //    LoggedInUser

		C_Global Global;
        C_VitaSite OurSite;
        C_VitaUser LoggedInUser;
        C_CalendarEntry OurCalendarEntry;
        C_SiteCalendarEntry OurDefaultCalendarEntry;
        bool Dirty;             // the item has been modified
        bool NewEntry;          // we created a brand new entry

		public VC_SCSiteOnDate (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            NewEntry = false;
            // see if an exception already exists
            OurCalendarEntry = OurSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
			int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
			OurDefaultCalendarEntry = OurSite.SiteCalendar[dayOfWeek];
			if (OurCalendarEntry == null)
            {
                // no entry found, create a new one
                OurCalendarEntry = new C_CalendarEntry()
                {
                    SiteID = OurSite.id,
                    Date = Global.SelectedDate,
                    IsClosed = OurDefaultCalendarEntry.OpenTime == OurDefaultCalendarEntry.CloseTime,
                    NumEFilers = OurDefaultCalendarEntry.NumEFilers
                };
                try { OurCalendarEntry.OpenTime = new C_HMS(OurDefaultCalendarEntry.OpenTime); }
                catch { OurCalendarEntry.OpenTime = new C_HMS(0, 0, 0); }
                try { OurCalendarEntry.CloseTime = new C_HMS(OurDefaultCalendarEntry.CloseTime); }
                catch { OurCalendarEntry.CloseTime = new C_HMS(0, 0, 0); }

                B_SaveCalendarException.SetTitle("Save New Calendar Exception", UIControlState.Normal);
                NewEntry = true;
            }

            L_SiteName.Text = OurSite.Name;
            L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");

			SW_IsOpen.ValueChanged += (sender, e) =>
			{
				Dirty = true;
                B_SaveCalendarException.Enabled = true;
			};

			SetDisplayValues();

			B_Back.TouchUpInside += async (sender, e) =>
			{
                if (!Dirty)
                {
					PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
                    return;
				}

                C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(
                    this,
                    "Save Changes?",
                    "Changes have been made. Save them?",
                    C_MessageBox.E_MessageBoxButtons.YesNo);

                if (mbres != C_MessageBox.E_MessageBoxResults.Yes)
                {
					PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
                    return;
				}

                try { OurCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text); }
				catch { }
                try { OurCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text); }
                catch { }
                try { OurCalendarEntry.NumEFilers = Convert.ToInt32(TB_NumEFilers.Text); }
                catch {}

				EnableUI(false);
				AI_Busy.StartAnimating();

				bool success = false;
                try
                {
                    if (NewEntry)
                        // create new entry
                        success = await OurSite.CreateCalendarException(LoggedInUser.Token, OurCalendarEntry);
                    else
                        // update the entry
                        success = await OurSite.UpdateCalendarException(LoggedInUser.Token, OurCalendarEntry);
                }
                catch 
                {
                    success = false;
                }

                AI_Busy.StopAnimating();
                EnableUI(true);

                if (success)
					PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
                
                C_MessageBox.E_MessageBoxResults mbres1 = await C_MessageBox.MessageBox(this, 
                                                                         "Error", 
                                                                         "Unable to create the calendar entry.", 
                                                                         C_MessageBox.E_MessageBoxButtons.Ok);
			};

			B_RestoreDefaults.TouchUpInside += async (sender, e) =>
			{
                if (!NewEntry)
                {
                    // delete this calendar exception
                    AI_Busy.StartAnimating();
                    EnableUI(false);

                    bool success = false;
                    try
                    {
                        success = await OurSite.RemoveCalendarException(LoggedInUser.Token, OurCalendarEntry);
                    }
                    catch
                    {
                        success = false;
                    }

                    AI_Busy.StopAnimating();
                    EnableUI(true);

					if (!success)
					{
						await C_MessageBox.MessageBox(this, "Error", "Unable to update the calendar entry.", C_MessageBox.E_MessageBoxButtons.Ok);
						return;
					}
				}

				PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
			};

			B_SaveCalendarException.TouchUpInside += async (sender, e) =>
			{
				OurCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
				OurCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
				OurCalendarEntry.NumEFilers = Convert.ToInt32(TB_NumEFilers.Text);
                OurCalendarEntry.IsClosed = !SW_IsOpen.On;

				AI_Busy.StartAnimating();
				EnableUI(false);

				bool success = false;
                try
                {
                    if (NewEntry)
                        // create new calendar entry
                        success = await OurSite.CreateCalendarException(LoggedInUser.Token, OurCalendarEntry);
                    else
                        // update the entry
                        success = await OurSite.UpdateCalendarException(LoggedInUser.Token, OurCalendarEntry);
                }
                catch
                {
                    success = false;
                }

				AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, 
                                                                             "Error", 
                                                                             "Unable to update the calendar entry.", 
                                                                             C_MessageBox.E_MessageBoxButtons.Ok);
					return;
				}

				Dirty = false;

				PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
			};

            // open time
            // Setup the textfield for the date to use a date picker in an action sheet/toolbar
            UIDatePicker DP_OpenTime = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Time,
                Date = C_NSDateConversions.BuildNSDateFromTime(OurCalendarEntry.OpenTime.ToString("hh:mm"))
			};

			UIToolbar ToolBar_OpenTime = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_OpenTime.SizeToFit();

			UIBarButtonItem doneButtonOpen = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
                DateTime dt = C_NSDateConversions.NSDateToDateTime(DP_OpenTime.Date);
				C_HMS hms = new C_HMS(dt);
				TB_OpenTime.Text = hms.ToString("hh:mm p");
				TB_OpenTime.ResignFirstResponder();
				Dirty = true;
                B_SaveCalendarException.Enabled = true;
                B_RestoreDefaults.Enabled = true;
			});
			ToolBar_OpenTime.SetItems(new UIBarButtonItem[] { doneButtonOpen }, true);
			UITextAttributes uitaot = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonOpen.SetTitleTextAttributes(uitaot, UIControlState.Normal);

			TB_OpenTime.InputView = DP_OpenTime;
			TB_OpenTime.InputAccessoryView = ToolBar_OpenTime;
			TB_OpenTime.Text = OurCalendarEntry.OpenTime.ToString("hh:mm p");

            // close time
            UIDatePicker DP_CloseTime = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Time,
                Date = C_NSDateConversions.BuildNSDateFromTime(OurCalendarEntry.CloseTime.ToString("hh:mm"))
			};

			UIToolbar ToolBar_CloseTime = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_CloseTime.SizeToFit();

			UIBarButtonItem doneButtonClose = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
                DateTime dt = C_NSDateConversions.NSDateToDateTime(DP_CloseTime.Date);
				C_HMS hms = new C_HMS(dt);
				TB_CloseTime.Text = hms.ToString("hh:mm p");
				TB_CloseTime.ResignFirstResponder();
				Dirty = true;
                B_SaveCalendarException.Enabled = true;
				B_RestoreDefaults.Enabled = true;
			});
			ToolBar_CloseTime.SetItems(new UIBarButtonItem[] { doneButtonClose }, true);
			UITextAttributes uitact = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonClose.SetTitleTextAttributes(uitact, UIControlState.Normal);

			TB_CloseTime.InputView = DP_CloseTime;
			TB_CloseTime.InputAccessoryView = ToolBar_CloseTime;

			TB_CloseTime.Text = OurCalendarEntry.CloseTime.ToString("hh:mm p");

			// number of efilers
			UIPickerView PV_EFilers = new UIPickerView()
			{
				Model = new EFilerPickerViewModel()
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
                TB_NumEFilers.Text = num.ToString();
				TB_NumEFilers.ResignFirstResponder();
				Dirty = true;
                B_SaveCalendarException.Enabled = true;
				B_RestoreDefaults.Enabled = true;
			});
			ToolBar_EFiler.SetItems(new UIBarButtonItem[] { doneButtonEFiler }, true);
			UITextAttributes uitaef = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonEFiler.SetTitleTextAttributes(uitaef, UIControlState.Normal);

            PV_EFilers.Select(OurCalendarEntry.NumEFilers, 0, true);
			TB_NumEFilers.InputView = PV_EFilers;
			TB_NumEFilers.InputAccessoryView = ToolBar_EFiler;
            TB_NumEFilers.Text = OurCalendarEntry.NumEFilers.ToString();
            SW_IsOpen.On = !OurCalendarEntry.IsClosed;
		}

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_RestoreDefaults.Enabled = en && Dirty;
            B_SaveCalendarException.Enabled = en && Dirty;
            TB_OpenTime.Enabled = en && !SW_IsOpen.On;
            TB_CloseTime.Enabled = en && !SW_IsOpen.On;
            TB_NumEFilers.Enabled = en;
            SW_IsOpen.Enabled = en;
        }

        private void SetDisplayValues()
        {
			//C_HMS defOpenTime = null;
   //         try { defOpenTime = new C_HMS(OurDefaultCalendarEntry.OpenTime); }
   //         catch {}
   //         string defOpenTimeS = defOpenTime == null ? OurDefaultCalendarEntry.OpenTime : defOpenTime.ToString("hh:mm p");

			//C_HMS defCloseTime = null;
   //         try { defCloseTime = new C_HMS(OurDefaultCalendarEntry.CloseTime); }
			//catch { }
            //string defCloseTimeS = defCloseTime == null ? OurDefaultCalendarEntry.CloseTime : defCloseTime.ToString("hh:mm p");

			TB_OpenTime.Text = OurCalendarEntry.OpenTime.ToString("hh:mm p");
			TB_CloseTime.Text = OurCalendarEntry.CloseTime.ToString("hh:mm p");
			TB_NumEFilers.Text = OurCalendarEntry.NumEFilers.ToString();
            SW_IsOpen.On = OurCalendarEntry.OpenTime != OurCalendarEntry.CloseTime;

            L_DefaultOpenTime.Text = "(" + OurDefaultCalendarEntry.OpenTime.ToString("hh:mm p") + ")";
            L_DefaultCloseTime.Text = "(" + OurDefaultCalendarEntry.CloseTime.ToString("hh:mm p") + ")";
			L_DefaultEFilers.Text = "(" + OurDefaultCalendarEntry.NumEFilers + ")";
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
    }
}