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

            if ((Global.SelectedSite == null)
                || (Global.SelectedDate == null)
                || (Global.LoggedInUser == null))
                throw new ApplicationException("required parameters not present");

            NewEntry = false;
            // see if an exception already exists
            OurCalendarEntry = Global.SelectedSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
			int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
			OurDefaultCalendarEntry = Global.SelectedSite.SiteCalendar[dayOfWeek];
			if (OurCalendarEntry == null)
            {
                // no entry found, create a new one
                OurCalendarEntry = new C_CalendarEntry()
                {
                    SiteID = Global.SelectedSite.id,
                    Date = Global.SelectedDate,
                    OpenTime = new C_HMS(OurDefaultCalendarEntry.OpenTime),
                    CloseTime = new C_HMS(OurDefaultCalendarEntry.CloseTime),
                    IsClosed = OurDefaultCalendarEntry.OpenTime == OurDefaultCalendarEntry.CloseTime,
                    NumEFilers = OurDefaultCalendarEntry.NumEFilers
                };
                B_SaveCalendarException.SetTitle("Save New Calendar Exception", UIControlState.Normal);
                NewEntry = true;
            }

            L_SiteName.Text = Global.SelectedSite.Name;
            L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");

            SetDisplayValues();

			B_Back.TouchUpInside += async (sender, e) =>
			{
                if (Dirty)
                {
                    Tools.E_MessageBoxResults mbres = await Tools.MessageBox(
                        this,
                        "Save Changes?",
                        "Changes have been made. Save them?",
                        Tools.E_MessageBoxButtons.YesNo);
                    if (mbres == Tools.E_MessageBoxResults.Yes)
                    {
                        if (NewEntry)
                        {
							// create new entry
							OurCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
							OurCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
							OurCalendarEntry.NumEFilers = Convert.ToInt32(TB_NumEFilers.Text);
							bool success = await Global.SelectedSite.CreateCalendarException(Global.LoggedInUser.Token, OurCalendarEntry);
                            if (!success)
                            {
                                await Tools.MessageBox(this, "Error", "Unable to create the calendar entry.", Tools.E_MessageBoxButtons.Ok);
                                return;
                            }
                        }
                        else
                        {
							// update the entry
							OurCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
							OurCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
							OurCalendarEntry.NumEFilers = Convert.ToInt32(TB_NumEFilers.Text);
							bool success = await Global.SelectedSite.UpdateCalendarException(Global.LoggedInUser.Token, OurCalendarEntry);
							if (!success)
							{
								await Tools.MessageBox(this, "Error", "Unable to update the calendar entry.", Tools.E_MessageBoxButtons.Ok);
								return;
							}
						}
                    }
                }

				PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
			};

			B_RestoreDefaults.TouchUpInside += async (sender, e) =>
			{
                if (!NewEntry)
                {
					// delete this calendar exception
					bool success = await Global.SelectedSite.RemoveCalendarException(Global.LoggedInUser.Token, OurCalendarEntry);
					if (!success)
					{
						await Tools.MessageBox(this, "Error", "Unable to update the calendar entry.", Tools.E_MessageBoxButtons.Ok);
						return;
					}
				}

				PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
			};

			B_SaveCalendarException.TouchUpInside += async (sender, e) =>
			{
                if (NewEntry)
                {
                    // create new calendar entry
                    OurCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
                    OurCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
                    OurCalendarEntry.NumEFilers = Convert.ToInt32(TB_NumEFilers.Text);
					bool success = await Global.SelectedSite.CreateCalendarException(Global.LoggedInUser.Token, OurCalendarEntry);
					if (!success)
					{
						await Tools.MessageBox(this, "Error", "Unable to create the calendar entry.", Tools.E_MessageBoxButtons.Ok);
						return;
					}

					Dirty = false;
                }
                else
                {
					// update the entry
					OurCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
					OurCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
					OurCalendarEntry.NumEFilers = Convert.ToInt32(TB_NumEFilers.Text);
					bool success = await Global.SelectedSite.UpdateCalendarException(Global.LoggedInUser.Token, OurCalendarEntry);
					if (!success)
					{
						await Tools.MessageBox(this, "Error", "Unable to update the calendar entry.", Tools.E_MessageBoxButtons.Ok);
						return;
					}

					Dirty = false;
                }

				PerformSegue("Segue_SCSiteOnDateToSCSiteCalendar", this);
			};

            // open time
            // Setup the textfield for the date to use a date picker in an action sheet/toolbar
            UIDatePicker DP_OpenTime = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Time,
                Date = Tools.BuildNSDateFromTime(OurCalendarEntry.OpenTime.ToString("hh:mm"))
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
            DateTime dty1 = Tools.NSDateToDateTime(Tools.BuildNSDateFromTime(OurCalendarEntry.OpenTime.ToString("hh:mm")));
			C_HMS openTime = new C_HMS(dty1);
			TB_OpenTime.Text = openTime.ToString("hh:mm p");

            // close time
            UIDatePicker DP_CloseTime = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Time,
                Date = Tools.BuildNSDateFromTime(OurCalendarEntry.CloseTime.ToString("hh:mm"))
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

            DateTime dtx2 = Tools.NSDateToDateTime(Tools.BuildNSDateFromTime(OurCalendarEntry.CloseTime.ToString("hh:mm")));
			C_HMS closeTime = new C_HMS(dtx2);
			TB_CloseTime.Text = closeTime.ToString("hh:mm p");

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

			TB_NumEFilers.InputView = PV_EFilers;
			TB_NumEFilers.InputAccessoryView = ToolBar_EFiler;
            TB_NumEFilers.Text = OurCalendarEntry.NumEFilers.ToString();
		}

        private void SetDisplayValues()
        {
			TB_OpenTime.Text = OurCalendarEntry.OpenTime.ToString("hh:mm p");
			TB_CloseTime.Text = OurCalendarEntry.CloseTime.ToString("hh:mm p");
			L_DefaultOpenTime.Text = "(" + OurDefaultCalendarEntry.OpenTime + ")";
			L_DefaultCloseTime.Text = "(" + OurDefaultCalendarEntry.CloseTime + ")";
			TB_NumEFilers.Text = OurCalendarEntry.NumEFilers.ToString();
			L_DefaultEFilers.Text = "(" + OurDefaultCalendarEntry.NumEFilers + ")";
            SW_IsOpen.On = OurCalendarEntry.OpenTime != OurCalendarEntry.CloseTime;
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