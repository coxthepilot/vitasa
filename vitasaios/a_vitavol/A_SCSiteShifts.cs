
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;

using zsquared;


using Android.Gms.Location;
using Android.Gms.Common;
using Android.Gms.Common.Apis;
using Android.Util;
using Android.Locations;

namespace a_vitavol
{
    [Activity(Label = "VITA: Select a Shift")]
    public class A_SCSiteShifts : Activity
    {
		C_Global Global;
		C_VitaUser LoggedInUser;
		C_YMD SelectedDate;
        C_VitaSite SelectedSite;
        C_CalendarEntry SelectedCalendarEntry;

		TextView L_Date;
		TextView L_Site;
		ListView LV_Shifts;

		ProgressDialog AI_Busy;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			SelectedDate = Global.SelectedDate;
			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
			SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(SelectedDate);
#if DEBUG
			if ((SelectedDate == null)
				|| (LoggedInUser == null)
				|| (SelectedSite == null)
				|| (SelectedCalendarEntry == null)
			   )
				throw new ApplicationException("missing values");
#endif
            SetContentView(Resource.Layout.SCSiteShifts);

            L_Date = FindViewById<TextView>(Resource.Id.L_SCSiteShifts_Date);
            L_Site = FindViewById<TextView>(Resource.Id.L_SCSiteShifts_Site);
            LV_Shifts = FindViewById<ListView>(Resource.Id.LV_SCSiteShifts_Shifts);

            L_Date.Text = SelectedDate.ToString("mmm dd, yyyy");
            L_Site.Text = SelectedSite.Name;

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			LV_Shifts.ItemClick += (sender, e) =>
			{
				Global.SelectedShift = SelectedCalendarEntry.WorkShifts[e.Position];

                Global.ViewCameFrom = E_ViewCameFrom.List;

                StartActivity(new Intent(this, typeof(A_SCSiteVol)));
			};

			EnableUI(false);
			AI_Busy.Show();

			Task.Run(async () =>
			{
				if (!SelectedCalendarEntry.HaveShifts)
				{
					List<C_WorkShift> shifts = await Global.FetchAllShiftsForCalendarEntry(LoggedInUser.Token, SelectedSite.Slug, SelectedCalendarEntry);
				}

				RunOnUiThread(() =>
                {
					EnableUI(true);
					AI_Busy.Cancel();

                    LV_Shifts.Adapter = new ShiftsAdapter(this, SelectedCalendarEntry.WorkShifts, Global, LoggedInUser);
				});
			});
		}

		public override void OnBackPressed()
		{
            StartActivity(new Intent(this, typeof(A_SCSiteVolCalendar)));
		}

		private void EnableUI(bool en)
        {
            LV_Shifts.Enabled = en;
        }

        public class ShiftsAdapter : BaseAdapter<C_WorkShift>
		{
            readonly List<C_WorkShift> Shifts;
			readonly Activity context;
            readonly C_Global Global;
            readonly C_VitaUser User;

            public ShiftsAdapter(Activity context, List<C_WorkShift> shifts, C_Global global, C_VitaUser user)
			{
				this.context = context;
				this.Shifts = shifts;
                this.Global = global;
                this.User = user;
			}

			public override long GetItemId(int position)
			{
				return position;
			}

            public override C_WorkShift this[int position]
			{
				get { return Shifts[position]; }
			}

			public override int Count
			{
				get { return Shifts.Count; }
			}

			public override View GetView(int position, View convertView, ViewGroup parent)
			{
				View view = convertView;
				if (view == null) // no view to re-use, create new
					view = context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

				C_WorkShift shift = Shifts[position];

				int numBasic = 0;
				int numAdv = 0;
				foreach (C_WorkShiftSignUp wssu in shift.SignUps)
				{
					if (wssu.User.Certification == E_Certification.Basic)
						numBasic++;
					else if (wssu.User.Certification == E_Certification.Advanced)
						numAdv++;
				}

				view.FindViewById<TextView>(Resource.Id.Text1).Text = shift.OpenTime.ToString("hh:mm p") + " - " + shift.CloseTime.ToString("hh:mm p");
				view.FindViewById<TextView>(Resource.Id.Text2).Text = "eFilers: " + numBasic.ToString() + " of " + shift.NumBasicEFilers.ToString() + " Basic; "
					+ numAdv.ToString() + " of " + shift.NumAdvEFilers.ToString() + " Advanced";

				return view;
			}
		}
	}
}
