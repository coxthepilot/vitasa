using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.Graphics;
using Android.Content.Res;

using System;
using System.Collections.Generic;

namespace zsquared
{
	/* To use the helper with a GridView, do the following
	 * 
     * Install a GridView in the page with
     <GridView
		android:minWidth="25px"
        android:minHeight="25px"
        android:layout_width="match_parent"
        android:layout_height="650px"
        android:numColumns="7"
        android:stretchMode="columnWidth"
        android:gravity="center"
        android:paddingRight="20dp"
        android:paddingLeft="20dp"
        android:clipToPadding="true"
        android:fitsSystemWindows="true"
        android:id="@+id/GV_Calendar" />
    
    Use the following in the OnCreate function
    

        // build the array of values for each date in the month
        C_DateDetails[] details = BuildDateStateArray(Global.SelectedDate);
        // build the array of values for each day of the week
        C_DateDetails[] dayDetails = BuildDayStateArray(OurSite);
        
        // create the helper; nothing is displayed at this point
        GVHelper = new C_GVHelper(this, GV_Calendar);

        // let the grid know the images to use for the various states
        GVHelper.SetResourceID(C_GVHelper.ID_Background, Resource.Drawable.background);
        GVHelper.SetResourceID(C_GVHelper.ID_OpenWithNeeds, Resource.Drawable.openwithneeds);
        GVHelper.SetResourceID(C_GVHelper.ID_OpenWithNeedsBoxed, Resource.Drawable.openwithneedsboxed);
        GVHelper.SetResourceID(C_GVHelper.ID_OpenNoNeeds, Resource.Drawable.opennoneeds);
        GVHelper.SetResourceID(C_GVHelper.ID_OpenNoNeedsBoxed, Resource.Drawable.opennoneedsboxed);
        GVHelper.SetResourceID(C_GVHelper.ID_Closed, Resource.Drawable.closed);
        GVHelper.SetResourceID(C_GVHelper.ID_ClosedBoxed, Resource.Drawable.closedboxed);
        GVHelper.SetResourceID(C_GVHelper.ID_GridCell, Resource.Layout.GridCell);
        GVHelper.SetResourceID(C_GVHelper.ID_GridCellText, Resource.Id.L_Cell);

        // finally, provided the day and date details and the handlers for cell clicks
        GVHelper.SetNewDateDetails(details, dayDetails);
        GVHelper.DateTouched += GVHelper_DateTouched;
        GVHelper.DayOfWeekTouched += GVHelper_DayOfWeekTouched;
    */

	// ---------- GV helper class ---------

	public enum E_DateType
	{
		// Date         DayOfWeek   SiteState       Text        -  Text             Background               Box
		Header,         // n/a      f/name of day   n/a         -  Name of day      open/closed/background   as needed
		PastDate,       // f/day    n/a             n/a         -  Number of day    background color         none
		DayOfMonth,     // f/day    n/a             f/color     -  Number of day    open/closed              as needed
		NotADate        // n/a      n/a             n/a         -  Nothing          background color         none
	}

	public enum E_SiteState
	{
		Closed,                 // site is closed
		OpenWithNeeds,          // site is open and has needs
		OpenNoNeeds,            // site is open but has no needs
        Background,             // just put the plain background in place
        Normal                  // just a regular day of the month
	}

	public class C_DateDetails
	{
        public E_DateType DateType;
        public C_YMD Date;
		public int DayOfWeek;

        public int BackgroundResourceId = -1;
        public Color BackgroundColor;           // us this if BackgroundResourceId == -1
        public ColorStateList TextColors;

		public E_SiteState SiteState;

		public bool Boxed;
	}

	public class C_GVHelper
	{
		public const string ID_Background = "background";
		public const string ID_GridCell = "gridcell";
		public const string ID_GridCellText = "gridcelltext";
		public const string ID_OpenNoNeeds = "opennoneeds";
		public const string ID_OpenNoNeedsBoxed = "opennoneedsboxed";
		public const string ID_OpenWithNeeds = "openwithneeds";
		public const string ID_OpenWithNeedsBoxed = "openwithneedsboxed";
		public const string ID_Closed = "closed";
		public const string ID_ClosedBoxed = "closedboxed";

		public event EventHandler<C_DateTouchedEventArgs> DateTouched;

		public event EventHandler<C_DayOfWeekTouchedEventArgs> DayOfWeekTouched;

		readonly GridView GV;
		List<C_DateDetails> DateDetails;
        readonly Activity _activity;
        Dictionary<string, int> ResourceIds;

        public C_GVHelper(Activity a, GridView gv)
		{
			GV = gv;
			_activity = a;
            ResourceIds = new Dictionary<string, int>();
		}

        public void SetResourceID(string s_ID, int i_id)
        {
            if (!ResourceIds.ContainsKey(s_ID))
                ResourceIds.Add(s_ID, i_id);
            else
                ResourceIds[s_ID] = i_id;
        }

		public void SetNewDateDetails(C_DateDetails[] dateDetails, C_DateDetails[] dayOfWeekDetails)
		{
            if ((ResourceIds.Count != 9)
                || (!ResourceIds.ContainsKey(ID_Background))
                || (!ResourceIds.ContainsKey(ID_GridCell))
                || (!ResourceIds.ContainsKey(ID_GridCellText))
                || (!ResourceIds.ContainsKey(ID_OpenNoNeeds))
                || (!ResourceIds.ContainsKey(ID_OpenNoNeedsBoxed))
                || (!ResourceIds.ContainsKey(ID_OpenWithNeeds))
                || (!ResourceIds.ContainsKey(ID_OpenWithNeedsBoxed))
                || (!ResourceIds.ContainsKey(ID_Closed))
                || (!ResourceIds.ContainsKey(ID_ClosedBoxed)))
                throw new ApplicationException("must have all resource IDs to get started");

			DateDetails = BuildDetails(dateDetails, dayOfWeekDetails);

			GV.ItemClick += GV_ItemClick;

            GV.Adapter = new C_GridViewCalendar(_activity, DateDetails, ResourceIds);
		}

		void GV_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
		{
			C_DateDetails dd = DateDetails[e.Position];

			if (dd.DateType == E_DateType.DayOfMonth)
				DateTouched?.Invoke(this, new C_DateTouchedEventArgs(dd.Date));
			else if (dd.DateType == E_DateType.Header)
				DayOfWeekTouched?.Invoke(this, new C_DayOfWeekTouchedEventArgs(dd.DayOfWeek));
		}

		private List<C_DateDetails> BuildDetails(C_DateDetails[] dateDetails, C_DateDetails[] dayOfWeekDetails)
		{
			List<C_DateDetails> res = new List<C_DateDetails>();

			// create the header row if we are provided with day of week details
			if (dayOfWeekDetails != null)
			{
				for (int iz = 0; iz != 7; iz++)
					res.Add(dayOfWeekDetails[iz]);
			}

			// create the filler up to the first day of the month
			int firstDayOfWeek = dateDetails[0].DayOfWeek;
			int ix = 0;
			while (ix != firstDayOfWeek)
			{
				C_DateDetails dd = new C_DateDetails()
				{
					DateType = E_DateType.NotADate
				};
				res.Add(dd);

				ix++;
			}

			// populate the entries for the days of the month
			for (int iy = 0; iy != dateDetails.Length; iy++)
				res.Add(dateDetails[iy]);

			return res;
		}
	}

	public class C_DateTouchedEventArgs : EventArgs
	{
		public C_YMD Date;

		public C_DateTouchedEventArgs(C_YMD ymd)
		{
			Date = ymd;
		}
	}

	public class C_DayOfWeekTouchedEventArgs : EventArgs
	{
		public int DayOfWeek;

		public C_DayOfWeekTouchedEventArgs(int dow)
		{
			DayOfWeek = dow;
		}
	}

	public class C_GridViewCalendar : BaseAdapter<C_DateDetails>
	{
        readonly List<C_DateDetails> DateDetails;
        readonly Activity _activity;
        readonly Dictionary<string, int> ResourceIds;

        public C_GridViewCalendar(Activity a, List<C_DateDetails> dateDetails, Dictionary<string, int> resouceIds)
		{
			DateDetails = dateDetails;
			_activity = a;
            ResourceIds = resouceIds;
		}

		public override long GetItemId(int position)
		{
			return position;
		}

		public override int Count
		{
			get
			{
                return DateDetails.Count;
			}
		}

		public override C_DateDetails this[int position]
		{
			get
			{
				return DateDetails[position];
			}
		}

		public override View GetView(int position, View convertView, ViewGroup parent)
		{
			C_DateDetails item = DateDetails[position];

			if (convertView == null)
                convertView = _activity.LayoutInflater.Inflate(ResourceIds[C_GVHelper.ID_GridCell], null);

            TextView L_Cell = convertView.FindViewById<TextView>(ResourceIds[C_GVHelper.ID_GridCellText]);
			L_Cell.SetHeight(50);

			switch (item.DateType)
			{
                case E_DateType.Header:
					L_Cell.Text = C_YMD.DayOfWeekNamesAbrev[item.DayOfWeek];
                    int id = -1;
                    if ((item.SiteState == E_SiteState.OpenNoNeeds) || (item.SiteState == E_SiteState.OpenWithNeeds))
                        id = ResourceIds[C_GVHelper.ID_OpenWithNeeds];
                    else if (item.SiteState == E_SiteState.Closed)
                        id = ResourceIds[C_GVHelper.ID_Closed];
                    else
                        id = ResourceIds[C_GVHelper.ID_Background];
                    L_Cell.SetBackgroundResource(id);
					break;
				case E_DateType.NotADate:
					L_Cell.Text = "";
                    L_Cell.SetBackgroundResource(ResourceIds[C_GVHelper.ID_Background]);
                    break;
                case E_DateType.PastDate:
                    L_Cell.Text = item.Date.Day.ToString();
                    L_Cell.SetBackgroundResource(ResourceIds[C_GVHelper.ID_Background]);
                    break;
                case E_DateType.DayOfMonth:
                    L_Cell.Text = item.Date.Day.ToString();
                    int idx = -1;
					switch (item.SiteState)
					{
						case E_SiteState.Closed:
                            idx = item.Boxed ? ResourceIds[C_GVHelper.ID_ClosedBoxed] : ResourceIds[C_GVHelper.ID_Closed];
							break;
						case E_SiteState.OpenNoNeeds:
                            idx = item.Boxed ? ResourceIds[C_GVHelper.ID_OpenNoNeedsBoxed] : ResourceIds[C_GVHelper.ID_OpenNoNeeds];
							break;
						case E_SiteState.OpenWithNeeds:
                            idx = item.Boxed ? ResourceIds[C_GVHelper.ID_OpenWithNeedsBoxed] : ResourceIds[C_GVHelper.ID_OpenWithNeeds];
							break;
                        case E_SiteState.Background:
                            idx = ResourceIds[C_GVHelper.ID_Background];
                            break;
					}
					L_Cell.SetBackgroundResource(idx);
					break;
			}

			return convertView;
		}
	}
}
