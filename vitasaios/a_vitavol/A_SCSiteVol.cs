
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

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Site Volunteers")]
    public class A_SCSiteVol : Activity
    {
		C_Global Global;

		C_VitaUser LoggedInUser;
		C_VitaSite OurSite;

		ProgressDialog AI_Busy;

		Button B_ApproveHours;

		TextView L_SiteName;
		TextView L_SiteVol;
        TextView L_Date;

        ListView LV_List;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            if (Global.SelectedDate == null)
                Global.SelectedDate = C_YMD.Now;

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCSiteVol);

            B_ApproveHours = FindViewById<Button>(Resource.Id.B_SCSiteVol_ApproveHours);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SCSiteVol_SiteName);
            L_SiteVol = FindViewById<TextView>(Resource.Id.L_SCSiteVol_Volunteers);
            L_Date = FindViewById<TextView>(Resource.Id.L_SCSiteVol_Date);

			LV_List = FindViewById<ListView>(Resource.Id.LV_SCSiteVol_List);

            AI_Busy = new ProgressDialog(this);
            AI_Busy.SetMessage("Please wait...");
            AI_Busy.SetCancelable(false);
            AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            B_ApproveHours.Click += (sender, e) => 
            {
                C_MessageBox mbox = new C_MessageBox(this,
					 "Approve Items?",
					 "Approve signups on this date?",
					 E_MessageBoxButtons.YesNo);
                mbox.Dismissed += async (sender1, args1) => 
                {
                    if (args1.Result != E_MessageBoxResults.Yes)
						return;

                    AI_Busy.Show();
					EnableUI(false);

					bool success = await SaveChangedItems();

                    AI_Busy.Cancel();
					EnableUI(true);

					if (!success)
					{
                        C_MessageBox mbox1 = new C_MessageBox(this,
									"Error",
									"Unble to save the work item",
									 E_MessageBoxButtons.Ok);
                        mbox1.Show();
						return;
					}

					StartActivity(new Intent(this, typeof(A_SCSiteVolCalendar)));
				};
                mbox.Show();
			};

            LV_List.ItemClick += (sender, e) => 
            {
                Global.VolunteerWorkItem = Global.WorkItemsOnSiteOnDate[e.Position];

                StartActivity(new Intent(this, typeof(A_SCVolHours)));
			};

			AI_Busy.Show();
			EnableUI(false);

            L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");

			Task.Run(async () =>
			{
				LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
				OurSite = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

                bool success = await RebuildWorkItemsOnDateChange();

                if (success)
                {
                    // find out how many are required
                    int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
                    int requiredVolunteers = OurSite.SiteCalendar[dayOfWeek].NumEFilers;
                    C_CalendarEntry SiteCalendarEntry = OurSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
                    if (SiteCalendarEntry != null)
                        requiredVolunteers = SiteCalendarEntry.NumEFilers;

                    RunOnUiThread(() =>
                    {
                        AI_Busy.Cancel();
                        EnableUI(true);

                        LV_List.Adapter = new SignUpAdapter(this, Global.WorkItemsOnSiteOnDate, Global);

                        L_SiteName.Text = OurSite.Name;
                        L_SiteVol.Text = "Volunteers: " + Global.WorkItemsOnSiteOnDate.Count.ToString() + " of " + requiredVolunteers.ToString();

                        B_ApproveHours.Enabled = (Global.WorkItemsOnSiteOnDate.Count != 0) && (Global.SelectedDate <= C_YMD.Now);

                        EnableUI(true);
                    });
                }
			});
		}

		private void EnableUI(bool en)
		{
            B_ApproveHours.Enabled = en && (Global.WorkItemsOnSiteOnDate.Count != 0) && (Global.SelectedDate <= C_YMD.Now);
		}

		public override void OnBackPressed()
		{
            StartActivity(new Intent(this, typeof(A_SCSiteVolCalendar)));
		}

		private async Task<bool> SaveChangedItems()
		{
			bool res = true;
			try
			{
				foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
				{
					wi.Approved = true;
					bool success = await wi.UpdateIntent(Global);
					res &= success;
					wi.Dirty = false;
				}
			}
			catch { }

			return res;
		}

		private async Task<bool> RebuildWorkItemsOnDateChange()
		{
			// find out how many Volunteers signed up to work on this date
			Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDate(Global.SelectedDate, OurSite.Slug);

			// build a dictionary of user id to user name
			Dictionary<int, string> UserIdToUser = new Dictionary<int, string>();
			foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
			{
                bool success = await Global.EnsureUserInCache(wi.UserId, LoggedInUser.Token);
			}

			return true;
		}

		public class SignUpAdapter : BaseAdapter<C_WorkItem>
		{
            readonly List<C_WorkItem> Items;
            readonly Activity Context;
			readonly C_Global Global;

			public SignUpAdapter(Activity context, List<C_WorkItem> items, C_Global global) : base()
			{
				Context = context;
				Items = items;
                Global = global;
			}

			public override long GetItemId(int position)
			{
				return position;
			}

			public override C_WorkItem this[int position]
			{
				get { return Items[position]; }
			}

			public override int Count
			{
				get { return Items.Count; }
			}

			public override View GetView(int position, View convertView, ViewGroup parent)
			{
				View view = convertView;
				if (view == null) // no view to re-use, create new
					view = Context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

				C_WorkItem wi = Items[position];

                C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);

				view.FindViewById<TextView>(Resource.Id.Text1).Text = user.Name;
                view.FindViewById<TextView>(Resource.Id.Text2).Text = "[" + user.Phone + "] " + user.Certification.ToString() + "  " + wi.Hours.ToString() + " hours";

				return view;
			}
		}

		public class DatePickerFragment : DialogFragment,
								  DatePickerDialog.IOnDateSetListener
		{
			// TAG can be any string of your choice.
			public static readonly string TAG = "X:" + typeof(DatePickerFragment).Name.ToUpper();

            public DateTime TimeToStart;

			// Initialize this value to prevent NullReferenceExceptions.
			Action<DateTime> _dateSelectedHandler = delegate { };

			public static DatePickerFragment NewInstance(Action<DateTime> onDateSelected)
			{
                DatePickerFragment frag = new DatePickerFragment()
                {
                    _dateSelectedHandler = onDateSelected
                };
                return frag;
			}

			public override Dialog OnCreateDialog(Bundle savedInstanceState)
			{
				//DateTime currently = DateTime.Now;
				DatePickerDialog dialog = new DatePickerDialog(Activity,
															   this,
															   TimeToStart.Year,
															   TimeToStart.Month -1,
															   TimeToStart.Day);
				return dialog;
			}

			public void OnDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth)
			{
				// Note: monthOfYear is a value between 0 and 11, not 1 and 12!
				DateTime selectedDate = new DateTime(year, monthOfYear + 1, dayOfMonth);
				//Log.Debug(TAG, selectedDate.ToLongDateString());
				_dateSelectedHandler(selectedDate);
			}
		}
	}
}
