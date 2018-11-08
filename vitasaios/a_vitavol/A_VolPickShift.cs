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
    public class A_VolPickShift : Activity
    {
//		C_Global Global;
//		C_VitaUser LoggedInUser;
//		C_YMD SelectedDate;
//        C_VitaSite SelectedSite;
//        C_CalendarEntry SelectedCalendarEntry;

//		TextView L_Date;
//		TextView L_Site;
//		ListView LV_Shifts;

//		ProgressDialog AI_Busy;

//		protected override void OnCreate(Bundle savedInstanceState)
//        {
//            base.OnCreate(savedInstanceState);

//			MyAppDelegate g = (MyAppDelegate)Application;
//			if (g.Global == null)
//				g.Global = new C_Global();
//			Global = g.Global;

//			SelectedDate = Global.SelectedDate;
//			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
//            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
//			SelectedCalendarEntry = SelectedSite.GetCalendarEntryForDate(SelectedDate);
//#if DEBUG
//			if ((SelectedDate == null)
//				|| (LoggedInUser == null)
//				|| (SelectedSite == null)
//				|| (SelectedCalendarEntry == null)
//			   )
//				throw new ApplicationException("missing values");
//#endif
		//	SetContentView(Resource.Layout.VolPickShift);

  //          L_Date = FindViewById<TextView>(Resource.Id.L_VolPickShift_Date);
  //          L_Site = FindViewById<TextView>(Resource.Id.L_VolPickShift_Site);
  //          LV_Shifts = FindViewById<ListView>(Resource.Id.LV_VolPickShift_Shifts);

  //          L_Date.Text = SelectedDate.ToString("mmm dd,yyyy");
  //          L_Site.Text = SelectedSite.Name;

		//	AI_Busy = new ProgressDialog(this);
		//	AI_Busy.SetMessage("Please wait...");
		//	AI_Busy.SetCancelable(false);
		//	AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

		//	LV_Shifts.ItemClick += (sender, e) =>
		//	{
  //              C_WorkShift shift = SelectedCalendarEntry.WorkShifts[e.Position];

		//		C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, shift.SiteSlug);
		//		int numHave = 0;
		//		int numNeeded = 0;
		//		foreach (C_SiteScheduleShift sss in ss.Shifts)
		//		{
		//			if ((sss.OpenTime == shift.OpenTime) && (sss.CloseTime == shift.CloseTime))
		//			{
  //                      bool userIsAdvanced = LoggedInUser.Certification == E_Certification.Advanced;

  //                      numNeeded += sss.eFilersNeededBasic;
  //                      if (userIsAdvanced)
  //                          numNeeded += sss.eFilersNeededAdvanced;

  //                      numHave += sss.eFilersSignedUpBasic;
  //                      if (userIsAdvanced)
  //                          numHave += sss.eFilersSignedUpAdvanced;

  //    //                  numNeeded += LoggedInUser.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
		//				//numHave += LoggedInUser.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
		//			}
		//		}
		//		int numEF = numNeeded - numHave;
		//		if (numEF == 0)
		//			return;

		//		Global.SelectedSignUp = new C_SignUp(shift.SiteSlug, Global.SelectedDate, Global.LoggedInUserId, 0)
		//		{
		//			id = -1,
		//			SiteName = Global.GetSiteFromSlugNoFetch(shift.SiteSlug).Name,
		//			ShiftId = shift.id
		//		};
		//		Global.SelectedShift = shift;

		//		Global.ViewCameFrom = E_ViewCameFrom.List;

		//		StartActivity(new Intent(this, typeof(A_ViewSignUpNew)));
		//	};

		//	EnableUI(false);
		//	AI_Busy.Show();

		//	Task.Run(async () =>
		//	{
		//		if (!SelectedCalendarEntry.HaveShifts)
		//		{
		//			List<C_WorkShift> shifts = await Global.FetchAllShiftsForCalendarEntry(LoggedInUser.Token, SelectedSite.Slug, SelectedCalendarEntry);
		//		}

		//		RunOnUiThread(() =>
  //              {
		//			EnableUI(true);
		//			AI_Busy.Cancel();

  //                  LV_Shifts.Adapter = new ShiftsAdapter(this, SelectedCalendarEntry.WorkShifts, Global, LoggedInUser);
		//		});
		//	});
		//}

		public override void OnBackPressed()
		{
            StartActivity(new Intent(this, typeof(A_VolPickSite)));
		}

		//private void EnableUI(bool en)
  //      {
  //          LV_Shifts.Enabled = en;
  //      }

  //      public class ShiftsAdapter : BaseAdapter<C_WorkShift>
		//{
  //          readonly List<C_WorkShift> Shifts;
		//	readonly Activity context;
  //          readonly C_Global Global;
  //          readonly C_VitaUser User;

  //          public ShiftsAdapter(Activity context, List<C_WorkShift> shifts, C_Global global, C_VitaUser user)
		//	{
		//		this.context = context;
		//		this.Shifts = shifts;
  //              this.Global = global;
  //              this.User = user;
		//	}

		//	public override long GetItemId(int position)
		//	{
		//		return position;
		//	}

  //          public override C_WorkShift this[int position]
		//	{
		//		get { return Shifts[position]; }
		//	}

		//	public override int Count
		//	{
		//		get { return Shifts.Count; }
		//	}

		//	public override View GetView(int position, View convertView, ViewGroup parent)
		//	{
		//		View view = convertView;
		//		if (view == null) // no view to re-use, create new
		//			view = context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

  //              C_WorkShift shift = Shifts[position];

		//		// figure out if our user is already signed up for a shift on this date
		//		List<C_SignUp> wiList = Global.GetSignUpsByShiftId(shift.id);
		//		var ou = wiList.Where(wi => wi.UserId == Global.LoggedInUserId);
		//		bool ourUserIsSignedUp = ou.Any();

		//		C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, shift.SiteSlug);
		//		int numHave = 0;
		//		int numNeeded = 0;
		//		foreach (C_SiteScheduleShift sss in ss.Shifts)
		//		{
		//			if ((sss.OpenTime == shift.OpenTime) && (sss.CloseTime == shift.CloseTime))
		//			{
  //                      bool userIsAdvanced = User.Certification == E_Certification.Advanced;

  //                      numNeeded += sss.eFilersNeededBasic;
  //                      if (userIsAdvanced)
  //                          numNeeded += sss.eFilersNeededAdvanced;

  //                      numHave += sss.eFilersSignedUpBasic;
  //                      if (userIsAdvanced)
  //                          numHave += sss.eFilersSignedUpAdvanced;
                        
		//				//numNeeded += User.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
		//				//numHave += User.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
		//			}
		//		}
		//		int numEF = numNeeded - numHave;

  //              string t2 = ourUserIsSignedUp ? "Already signed up for this shift." : numEF.ToString() + " needed for this shift.";

		//		view.FindViewById<TextView>(Resource.Id.Text1).Text = shift.OpenTime.ToString("hh:mm p") + " - " + shift.CloseTime.ToString("hh:mm p");
  //              view.FindViewById<TextView>(Resource.Id.Text2).Text = t2;

		//		return view;
		//	}
		//}
	}
}
