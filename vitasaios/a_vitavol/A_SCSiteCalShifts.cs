
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
    public class A_SCSiteCalShifts : Activity
    {
		C_Global Global;

		C_VitaUser LoggedInUser;
		C_VitaSite SelectedSite;
		C_YMD SelectedDate;
		C_CalendarEntry SelectedCalendarEntry;

		// a flag to tell if the user made changes
		bool Dirty;

		TextView L_Date;
		TextView L_Site;
		ListView LV_Shifts;
        Button B_SaveChanges;
        CheckBox CB_SiteIsOpen;

		ProgressDialog AI_Busy;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
			SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
			SelectedDate = Global.SelectedDate;
			SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(SelectedDate);
#if DEBUG
			if ((LoggedInUser == null)
				|| (SelectedSite == null)
				|| (SelectedDate == null)
				|| (SelectedCalendarEntry == null)
			   )
				throw new ApplicationException("missing value(s)");
#endif
			SetContentView(Resource.Layout.SCSiteCalShifts);

            L_Date = FindViewById<TextView>(Resource.Id.L_SCSiteShifts_Date);
            L_Site = FindViewById<TextView>(Resource.Id.L_SCSiteShifts_Site);
            LV_Shifts = FindViewById<ListView>(Resource.Id.LV_SCSiteShifts_Shifts);
            B_SaveChanges = FindViewById<Button>(Resource.Id.B_SCSiteCalShifts_SaveChanges);
            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SCSiteCalShifts_SiteIsOpen);

			L_Date.Text = SelectedDate.ToString("mmm dd,yyyy");
            L_Site.Text = SelectedSite.Name;
            B_SaveChanges.Enabled = CalendarOrShiftsAreDirty(SelectedCalendarEntry);
            CB_SiteIsOpen.Checked = SelectedCalendarEntry.SiteIsOpen;

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			LV_Shifts.ItemClick += (sender, e) =>
			{
				Global.SelectedShift = SelectedCalendarEntry.WorkShifts[e.Position];

                Global.ViewCameFrom = E_ViewCameFrom.List;

                StartActivity(new Intent(this, typeof(A_SCShiftDetails)));
			};

            CB_SiteIsOpen.CheckedChange += (sender, e) => 
            {
				SelectedCalendarEntry.Dirty = true;
				B_SaveChanges.Enabled = true;
			};

            B_SaveChanges.Click += (sender, e) =>
			{
                AI_Busy.Show();

                Task.Run(async () => 
                {
                    C_IOResult ior = await UpdateCalendarAndShifts();

                    RunOnUiThread(() => 
                    {
                        AI_Busy.Cancel();

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update site calendar [" + ior.ErrorMessage + "]", E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }

                        StartActivity(new Intent(this, typeof(A_SCCalendar)));
                    });
                });
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
            if (CalendarOrShiftsAreDirty(SelectedCalendarEntry))
            {
				C_MessageBox mbox = new C_MessageBox(this,
                	 "Items have changed",
                	 "Save the changes?",
                	 E_MessageBoxButtons.YesNoCancel);
				mbox.Dismissed += (sender1, args1) =>
				{
                    if (args1.Result == E_MessageBoxResults.Cancel)
						return;
                    else if (args1.Result == E_MessageBoxResults.No)
                    {
                        StartActivity(new Intent(this, typeof(A_SCCalendar)));
                        return;
                    }

					AI_Busy.Show();
					EnableUI(false);

                    Task.Run(async () => 
                    {
                        C_IOResult ior = await UpdateCalendarAndShifts();

                        RunOnUiThread(() => 
                        {
                            AI_Busy.Cancel();
                            EnableUI(true);

                            if (!ior.Success)
                            {
                                C_MessageBox mbox1 = new C_MessageBox(this,
                                            "Error",
                                            "Unble to save the changes [" + ior.ErrorMessage + "]",
                                             E_MessageBoxButtons.Ok);
                                mbox1.Show();
                                return;
                            }

                            StartActivity(new Intent(this, typeof(A_SCCalendar)));
                        });
                    });
				};
				mbox.Show();
                return;
			}

            StartActivity(new Intent(this, typeof(A_SCCalendar)));
		}

		private void EnableUI(bool en)
        {
            LV_Shifts.Enabled = en;
        }

        private async Task<C_IOResult> UpdateCalendarAndShifts()
		{
            C_IOResult ior = new C_IOResult
            {
                Success = true,
                ResultCode = E_IOResultCode.NoError
            };

            try
			{
                SelectedCalendarEntry.SiteIsOpen = CB_SiteIsOpen.Checked;
                // update the entry
                if (SelectedCalendarEntry.Dirty)
                    ior = await Global.UpdateCalendarEntry(SelectedSite, LoggedInUser.Token, SelectedCalendarEntry);

                if (ior.Success)
				{
					// now update all of the shifts
					foreach (C_WorkShift ws in SelectedCalendarEntry.WorkShifts)
					{
						if (ws.Dirty)
						{
                            ior = await Global.UpdateShift(LoggedInUser.Token, SelectedSite.Slug, ws, SelectedCalendarEntry);
							if (!ior.Success)
								break;
						}
					}
				}

				// if we have already pre-fetched the site schedule for the site, we need to adjust
				// the choice for now is to simple remove from the cache and force a re-fetch
				Global.RemoveSiteFromSiteCache(SelectedSite.Slug);
			}
			catch (Exception e)
			{
#if DEBUG
                Console.WriteLine(e.Message);
#endif
			}

			return ior;
		}

		private bool CalendarOrShiftsAreDirty(C_CalendarEntry calEntry)
		{
			bool res = calEntry.Dirty;

			foreach (C_WorkShift ws in calEntry.WorkShifts)
				res |= ws.Dirty;

			return res;
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
