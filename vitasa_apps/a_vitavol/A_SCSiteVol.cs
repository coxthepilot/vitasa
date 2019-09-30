
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
//		C_Global Global;

//		C_VitaUser LoggedInUser;
//        C_VitaSite SelectedSite;
//		C_YMD SelectedDate;
//		C_WorkShift SelectedShift;

//		ProgressDialog AI_Busy;

//		Button B_ApproveHours;

//		TextView L_SiteName;
//        TextView L_SiteBasicVol;
//		TextView L_SiteAdvVol;
//		TextView L_Date;

//        ListView LV_Volunteers;

//        C_YMD Now;

//        protected override void OnCreate(Bundle savedInstanceState)
//        {
//            base.OnCreate(savedInstanceState);

//            MyAppDelegate g = (MyAppDelegate)Application;
//            if (g.Global == null)
//                g.Global = new C_Global();
//            Global = g.Global;

//            Now = C_YMD.Now;

//			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
//			SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
//			SelectedDate = Global.SelectedDate;
//			SelectedShift = Global.SelectedShift;
//#if DEBUG
//			if ((SelectedSite == null)
//				|| (SelectedDate == null)
//				|| (LoggedInUser == null)
//				|| (SelectedShift == null))
//				throw new ApplicationException("missing values");
//#endif

  //          // Set our view from the "main" layout resource
  //          SetContentView(Resource.Layout.SCSiteVol);

  //          B_ApproveHours = FindViewById<Button>(Resource.Id.B_SCSiteVol_ApproveHours);

  //          L_SiteName = FindViewById<TextView>(Resource.Id.L_SCSiteVol_SiteName);
  //          L_SiteBasicVol = FindViewById<TextView>(Resource.Id.L_SCSiteVol_BasicVolunteers);
  //          L_SiteAdvVol = FindViewById<TextView>(Resource.Id.L_SCSiteVol_AdvVolunteers);
		//	L_Date = FindViewById<TextView>(Resource.Id.L_SCSiteVol_Date);

  //          LV_Volunteers = FindViewById<ListView>(Resource.Id.LV_SCSiteVol_List);

  //          AI_Busy = new ProgressDialog(this);
  //          AI_Busy.SetMessage("Please wait...");
  //          AI_Busy.SetCancelable(false);
  //          AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

  //          B_ApproveHours.Click += (sender, e) => 
  //          {
  //              C_MessageBox mbox = new C_MessageBox(this,
		//			 "Approve Items?",
		//			 "Approve signups on this date?",
		//			 E_MessageBoxButtons.YesNo);
  //              mbox.Dismissed += async (sender1, args1) => 
  //              {
  //                  if (args1.Result != E_MessageBoxResults.Yes)
		//				return;

  //                  AI_Busy.Show();
		//			EnableUI(false);

		//			bool success = await SaveChangedItems();

  //                  AI_Busy.Cancel();
		//			EnableUI(true);

		//			if (!success)
		//			{
  //                      C_MessageBox mbox1 = new C_MessageBox(this,
		//							"Error",
		//							"Unble to save the work item",
		//							 E_MessageBoxButtons.Ok);
  //                      mbox1.Show();
		//				return;
		//			}

		//			StartActivity(new Intent(this, typeof(A_SCSiteVolCalendar)));
		//		};
  //              mbox.Show();
		//	};

  //          LV_Volunteers.ItemClick += (sender, e) => 
  //          {
  //              Global.VolunteerWorkShiftSignUp = Global.WorkShiftSignUpsOnDate[e.Position];

		//		StartActivity(new Intent(this, typeof(A_SCVolHours)));
		//	};

		//	AI_Busy.Show();
		//	EnableUI(false);

  //          L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");

		//	Task.Run(async () =>
		//	{
		//		// get the list of signups for this shift
		//		Global.WorkShiftSignUpsOnDate = SelectedShift.SignUps;

		//		// compute the number needed vs have
		//		int numBasicHave = 0;
		//		int numAdvHave = 0;

		//		int numBasicNeeded = SelectedShift.NumBasicEFilers;
		//		int numAdvNeeded = SelectedShift.NumAdvEFilers;

		//		foreach (C_WorkShiftSignUp wi in Global.WorkShiftSignUpsOnDate)
		//		{
		//			if (wi.User.Certification == E_Certification.Basic)
		//				numBasicHave++;
		//			else if (wi.User.Certification == E_Certification.Advanced)
		//				numAdvHave++;
		//		}

		//		// get the actual signup for each one so we can modify the number of hours worked
		//		foreach (C_WorkShiftSignUp wssu in Global.WorkShiftSignUpsOnDate)
		//		{
		//			if (wssu.TheSignUp == null)
		//			{
  //                      C_IOResult ior = await Global.FetchSignUpBySignUpId(LoggedInUser.Token, wssu.SignUpId);

  //                      wssu.TheSignUp = ior.SignUp;
		//			}
		//		}

  //              RunOnUiThread(() =>
  //              {
  //                  AI_Busy.Cancel();
  //                  EnableUI(true);

  //                  LV_Volunteers.Adapter = new ShiftAdapter(this, Global.WorkShiftSignUpsOnDate, Global);

  //                  L_SiteName.Text = SelectedSite.Name;
  //                  L_SiteBasicVol.Text = "Basic Volunteers: " + numBasicHave.ToString() + " of " + numBasicNeeded.ToString();
  //                  L_SiteAdvVol.Text = "Advanced Volunteers: " + numAdvHave.ToString() + " of " + numAdvNeeded.ToString();

  //                  B_ApproveHours.Enabled = (Global.WorkShiftSignUpsOnDate.Count != 0) && (SelectedDate <= Now);

  //                  EnableUI(true);
  //              });
		//	});
		//}

		//private void EnableUI(bool en)
		//{
  //          B_ApproveHours.Enabled = en && (Global.WorkShiftSignUpsOnDate.Count != 0) && (SelectedDate <= Now);
		//}

		//public override void OnBackPressed()
		//{
		//	// see if any of the items were changed and not saved
		//	var ou1 = Global.WorkShiftSignUpsOnDate.Where(wssu => wssu.TheSignUp.Dirty);
		//	if (!ou1.Any())
		//	{
  //              StartActivity(new Intent(this, typeof(A_SCSiteShifts)));
		//		return;
		//	}

		//	C_MessageBox mbox = new C_MessageBox(this,
  //          	 "Items Changed?",
  //          	 "Approve signups on this date?",
  //               E_MessageBoxButtons.YesNoCancel);
		//	mbox.Dismissed += async (sender1, args1) =>
		//	{
  //              if (args1.Result == E_MessageBoxResults.Cancel)
		//			return;
  //              else if (args1.Result == E_MessageBoxResults.No)
  //              {
		//			StartActivity(new Intent(this, typeof(A_SCSiteShifts)));
  //                  return;
		//		}

		//		AI_Busy.Show();
		//		EnableUI(false);

		//		bool success = await SaveChangedItems();

		//		AI_Busy.Cancel();
		//		EnableUI(true);

		//		if (!success)
		//		{
		//			C_MessageBox mbox1 = new C_MessageBox(this,
		//						"Error",
		//						"Unble to save the work item",
		//						 E_MessageBoxButtons.Ok);
		//			mbox1.Show();
		//			return;
		//		}

		//		StartActivity(new Intent(this, typeof(A_SCSiteShifts)));
		//	};
		//	mbox.Show();
		//}

		//private async Task<bool> SaveChangedItems()
		//{
		//	bool res = true;
		//	try
		//	{
		//		foreach (C_WorkShiftSignUp wi in Global.WorkShiftSignUpsOnDate)
		//		{
  //                  wi.TheSignUp.Approved = true;
  //                  C_IOResult ior = await Global.UpdateSignUp(wi.TheSignUp, LoggedInUser.Token);
  //                  res &= ior.Success;
		//			wi.TheSignUp.Dirty = false;
		//		}
		//	}
		//	catch { }

		//	return res;
		//}

  //      public class ShiftAdapter : BaseAdapter<C_WorkShiftSignUp>
		//{
  //          readonly List<C_WorkShiftSignUp> SignUps;
  //          readonly Activity Context;
		//	readonly C_Global Global;

  //          public ShiftAdapter(Activity context, List<C_WorkShiftSignUp> signUps, C_Global global)
		//	{
		//		Context = context;
		//		SignUps = signUps;
  //              Global = global;
		//	}

		//	public override long GetItemId(int position)
		//	{
		//		return position;
		//	}

  //          public override C_WorkShiftSignUp this[int position]
		//	{
		//		get { return SignUps[position]; }
		//	}

		//	public override int Count
		//	{
		//		get { return SignUps.Count; }
		//	}

		//	public override View GetView(int position, View convertView, ViewGroup parent)
		//	{
		//		View view = convertView;
		//		if (view == null) // no view to re-use, create new
		//			view = Context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

  //              C_WorkShiftSignUp signup = SignUps[position];

		//		view.FindViewById<TextView>(Resource.Id.Text1).Text = signup.User.UserName;
  //              view.FindViewById<TextView>(Resource.Id.Text2).Text = "[" + signup.User.Phone + "] " + signup.User.Certification.ToString() + " - " + signup.TheSignUp.Hours.ToString() + " hours";

		//		return view;
		//	}
		//}
	}
}
