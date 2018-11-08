
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Json;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

//using Xamarin.Forms;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: My Signups")]
    public class A_MySignUps : ListActivity
    {
		//C_Global Global;
  //      C_VitaUser LoggedInUser;

  //      List<C_SignUp> OurWorkItemsForToday;
  //      List<string> Signups;

		//ProgressDialog AI_Busy;

		//protected override void OnCreate(Bundle savedInstanceState)
  //      {
  //          base.OnCreate(savedInstanceState);

		//	MyAppDelegate g = (MyAppDelegate)Application;
		//	if (g.Global == null)
		//		g.Global = new C_Global();
		//	Global = g.Global;

  //          LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

		//	AI_Busy = new ProgressDialog(this);
		//	AI_Busy.SetMessage("Please wait...");
		//	AI_Busy.SetCancelable(false);
		//	AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

  //          AI_Busy.Show();

		//	// make sure the site cache has the details on the sites listed in our workitems
		//	Task.Run(async () =>
		//	{
		//		// get all workintents for this user
  //              List<C_SignUp> OurSignUps = Global.GetSignUpsForUser(Global.LoggedInUserId);

		//		// make sure we only look at the current items (today and beyond)
		//		C_YMD today = C_YMD.Now;
		//		var ou = OurSignUps.Where(wi => wi.Date >= today);
		//		OurWorkItemsForToday = ou.ToList();
		//		// sort to make the list nicer
		//		OurWorkItemsForToday.Sort(C_SignUp.CompareByDateThenSiteAscending);

		//		bool succ1 = await Global.EnsureShiftsInCacheForSignUps(LoggedInUser.Token, OurSignUps);

		//		Signups = new List<string>();
		//		foreach (C_SignUp wi in OurWorkItemsForToday)
		//			Signups.Add(wi.SiteName);

		//		bool success = true;
		//		foreach (C_SignUp wi in OurWorkItemsForToday)
		//			success &= await Global.EnsureSiteInCache(wi.SiteSlug);

  //              RunOnUiThread(() =>
  //              {
  //                  AI_Busy.Cancel();

  //                  ListAdapter = new SignUpAdapter(this, OurWorkItemsForToday, Global);
		//		});
		//	});
		//}

		//protected override void OnListItemClick(ListView l, View v, int position, long id)
		//{
		//	string t = Signups[position];
  //          C_SignUp wi = OurWorkItemsForToday[position];
  //          Global.SelectedSiteSlug = wi.SiteSlug;
  //          Global.SelectedSiteName = wi.SiteName;
  //          Global.SelectedDate = wi.Date;
  //          Global.SelectedSignUp = wi;

		//	C_WorkShift ws = Global.GetWorkShiftById(wi.ShiftId);
		//	Global.SelectedShift = ws;

		//	StartActivity(new Intent(this, typeof(A_ViewSignUpExisting)));
		//}

		//public class SignUpAdapter : BaseAdapter<C_SignUp>
		//{
		//	readonly List<C_SignUp> items;
		//	readonly Activity context;
		//	readonly C_Global Global;

		//	public SignUpAdapter(Activity context, List<C_SignUp> items, C_Global global)
		//	{
		//		this.context = context;
		//		this.items = items;
		//		this.Global = global;
		//	}

		//	public override long GetItemId(int position)
		//	{
		//		return position;
		//	}

		//	public override C_SignUp this[int position]
		//	{
		//		get { return items[position]; }
		//	}

		//	public override int Count
		//	{
		//		get { return items.Count; }
		//	}

		//	public override View GetView(int position, View convertView, ViewGroup parent)
		//	{
		//		View view = convertView;
		//		if (view == null) // no view to re-use, create new
		//			view = context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

		//		C_SignUp wi = items[position];
		//		C_WorkShift ws = Global.GetWorkShiftById(wi.ShiftId);

  //              view.FindViewById<TextView>(Resource.Id.Text1).Text = wi.SiteName;
  //              view.FindViewById<TextView>(Resource.Id.Text2).Text = wi.Date.ToString("mmm dd, yyyy")
  //                  + " [" + ws.OpenTime.ToString("hh:mm p").Trim() + " - " + ws.CloseTime.ToString("hh:mm p") + "]";

		//		return view;
		//	}
		//}

		//public override void OnBackPressed()
  //      {
  //          Intent i = new Intent(this, typeof(A_VolunteerActivity));
  //          StartActivity(i);
		//}
	}
}
