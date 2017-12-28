using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Shift Details")]
    public class A_SCShiftDetails : Activity
    {
		C_Global Global;

		C_VitaUser LoggedInUser;
		C_VitaSite SelectedSite;
		C_YMD SelectedDate;
		C_CalendarEntry SelectedCalendarEntry;
		C_WorkShift SelectedShift;

		ProgressDialog AI_Busy;

        TextView L_Date;
        TextView L_Site;

        EditText TB_OpenTime;
		EditText TB_CloseTime;
		EditText TB_BasicEFilers;
		EditText TB_AdvEFilers;

		C_SignUp OurWorkItem;

		const float EPSILON = 0.001f;

		protected override void OnCreate(Bundle savedInstanceState)
        {
			base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			if (Global.SelectedDate == null)
				Global.SelectedDate = C_YMD.Now;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
			SelectedDate = Global.SelectedDate;
			SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(SelectedDate);
			SelectedShift = Global.SelectedShift;
#if DEBUG
			if ((LoggedInUser == null)
				|| (SelectedSite == null)
				|| (SelectedDate == null)
				|| (SelectedCalendarEntry == null)
				|| (SelectedShift == null)
			   )
				throw new ApplicationException("missing values");
#endif
			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.SCShiftDetails);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            L_Site = FindViewById<TextView>(Resource.Id.L_Site);

            TB_OpenTime = FindViewById<EditText>(Resource.Id.TB_OpenTime);
            TB_CloseTime = FindViewById<EditText>(Resource.Id.TB_CloseTime);
            TB_BasicEFilers = FindViewById<EditText>(Resource.Id.TB_eFilersBasic);
            TB_AdvEFilers = FindViewById<EditText>(Resource.Id.TB_eFilersAdv);

			L_Date.Text = SelectedDate.ToString("mmm dd, yyyy");
			L_Site.Text = SelectedSite.Name;

            TB_OpenTime.Text = SelectedShift.OpenTime.ToString("hh:mm p");
            TB_CloseTime.Text = SelectedShift.CloseTime.ToString("hh:mm p");
            TB_BasicEFilers.Text = SelectedShift.NumBasicEFilers.ToString();
            TB_AdvEFilers.Text = SelectedShift.NumAdvEFilers.ToString();

   //         TB_OpenTime.FocusChange += (sender, e) =>
   //         {
   //             if (e.HasFocus)
   //             {
   //                 TimePickerFragment frag = TimePickerFragment.NewInstance(
   //                 delegate (DateTime time)
   //                 {
   //                     TB_OpenTime.Text = time.ToShortTimeString();
   //                 });
   //                 frag.CurrentTime = SelectedShift.OpenTime;
   //                 frag.Show(FragmentManager, TimePickerFragment.TAG);
   //             }
   //         };

			//TB_CloseTime.FocusChange += (sender, e) =>
			//{
			//	if (e.HasFocus)
			//	{
			//		TimePickerFragment frag = TimePickerFragment.NewInstance(
			//		delegate (DateTime time)
			//		{
   //                     TB_CloseTime.Text = time.ToShortTimeString();
			//		});
   //                 frag.CurrentTime = SelectedShift.CloseTime;
			//		frag.Show(FragmentManager, TimePickerFragment.TAG);
			//	}
			//};
		}

		public override void OnBackPressed()
		{
            C_HMS open = null;
            C_HMS close = null;
            try { open = new C_HMS(TB_OpenTime.Text); }
            catch {}
            try { close = new C_HMS(TB_CloseTime.Text); }
			catch { }

			int nbasic = -1;
			int nadv = -1;
			try { nbasic = Convert.ToInt32(TB_BasicEFilers.Text); }
			catch { }
			try { nadv = Convert.ToInt32(TB_AdvEFilers.Text); }
			catch { }

			SelectedShift.Dirty |= (
				   ((open != null) && (open != SelectedShift.OpenTime))
				|| ((close != null) && (close != SelectedShift.CloseTime))
				|| ((nbasic != -1) && (nbasic != SelectedShift.NumBasicEFilers))
				|| ((nadv != -1) && (nadv != SelectedShift.NumAdvEFilers))
			);

			if (open != null)
				SelectedShift.OpenTime = open;
			if (close != null)
				SelectedShift.CloseTime = close;
			if (nbasic != -1)
				SelectedShift.NumBasicEFilers = nbasic;
			if (nadv != -1)
				SelectedShift.NumAdvEFilers = nadv;
			
            StartActivity(new Intent(this, typeof(A_SCSiteCalShifts)));
		}

		public class TimePickerFragment : DialogFragment, TimePickerDialog.IOnTimeSetListener
		{
			public static readonly string TAG = "ShiftTimePickerFragment";
            Action<DateTime> timeSelectedHandler = delegate { };
            public C_HMS CurrentTime
            {
                set 
                {
                    DateTime now = DateTime.Now;
                    CurrentDateTime = new DateTime(now.Year, now.Month, now.Day, value.Hour, value.Minutes, value.Seconds);
                }
            }
            DateTime CurrentDateTime = DateTime.MinValue;

			public static TimePickerFragment NewInstance(Action<DateTime> onTimeSelected)
			{
				TimePickerFragment frag = new TimePickerFragment();
				frag.timeSelectedHandler = onTimeSelected;
				return frag;
			}

			public override Dialog OnCreateDialog(Bundle savedInstanceState)
			{
				TimePickerDialog dialog = new TimePickerDialog(Activity, this, CurrentDateTime.Hour, CurrentDateTime.Minute, false);
				return dialog;
			}

			public void OnTimeSet(TimePicker view, int hourOfDay, int minute)
			{
				DateTime selectedTime = new DateTime(CurrentDateTime.Year, CurrentDateTime.Month, CurrentDateTime.Day, hourOfDay, minute, 0);
				timeSelectedHandler(selectedTime);
			}
		}
	}
}
