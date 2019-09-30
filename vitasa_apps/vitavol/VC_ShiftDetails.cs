using Foundation;
using System;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_ShiftDetails : UIViewController
    {
        C_Global Global;

        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;
        C_YMD SelectedDate;
        C_CalendarEntry SelectedCalendarEntry;
        C_WorkShift SelectedShift;

        C_TimePicker OpenTime;
        C_TimePicker CloseTime;

        public VC_ShiftDetails(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

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
            L_SiteName.Text = SelectedSite.Name;
            L_ShiftSettingsFor.Text = SelectedDate.ToString("mmm dd, yyyy");

            OpenTime = new C_TimePicker(TB_OpenTime);
            OpenTime.SetValue(SelectedShift.OpenTime);
			OpenTime.TimePickerDone += (sender, e) =>
			{
                SelectedCalendarEntry.Dirty = true;
			};
			CloseTime = new C_TimePicker(TB_CloseTime);
            CloseTime.SetValue(SelectedShift.CloseTime);
			CloseTime.TimePickerDone += (sender, e) =>
			{
				SelectedCalendarEntry.Dirty = true;
			};

            TB_NumBasic.Text = SelectedShift.NumBasicEFilers.ToString();
            TB_NumAdvanced.Text = SelectedShift.NumAdvEFilers.ToString();

            B_Back.TouchUpInside += (sender, e) => 
            {
                C_HMS open = OpenTime.Value;
                C_HMS close = CloseTime.Value;
                int nbasic = -1;
                int nadv = -1;

                try { nbasic = Convert.ToInt32(TB_NumBasic.Text); }
                catch {}
                try { nadv = Convert.ToInt32(TB_NumAdvanced.Text); }
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

                PerformSegue("Segue_ShiftDetailsToSCSiteOnDate", this);
			};
		}

		public override void ViewDidAppear(bool animated)
		{
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

	}
}