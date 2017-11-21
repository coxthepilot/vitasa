using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using UIKit;
using System.Drawing;
using CoreGraphics;

using zsquared;

namespace vitavol
{
	public class C_CVHelper : UICollectionViewDelegateFlowLayout
	{
		public event EventHandler<C_DateTouchedEventArgs> DateTouched;

		public event EventHandler<C_DayOfWeekTouchedEventArgs> DayOfWeekTouched;

        static NSString gridCellId;

        CGRect ViewSize;
        C_DateState[] DateState;
		C_DayState[] DayState;
		int FirstDayInMonthOffset;
        C_CVSource cvsource;
        UIColor BackgroundColor;
        bool AllowPastDates;

        public C_CVHelper(UIColor bgcolor, UICollectionView collectionView, C_DateState[] dateState, C_DayState[] dayState, bool allowPastDates)
		{
			BackgroundColor = bgcolor;
			DateState = dateState;
            AllowPastDates = allowPastDates;
			try
            {
                FirstDayInMonthOffset = (int)dateState[0].Date.DayOfWeek;
                DayState = dayState;
                gridCellId = new NSString("GridCell");

                collectionView.RegisterClassForCell(typeof(C_GridCell), gridCellId);

                cvsource = new C_CVSource(DateState, DayState, allowPastDates)
                {
                    BackgroundColor = BackgroundColor
                };
                collectionView.DataSource = cvsource;
                collectionView.Delegate = this;
                collectionView.BackgroundColor = BackgroundColor;
                ViewSize = collectionView.Bounds;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
		}

        public void SetDayState(C_DateState[] dateState, C_DayState[] dayState)
        {
            try
            {
                DateState = dateState;
                DayState = dayState;
                FirstDayInMonthOffset = (int)dateState[0].Date.DayOfWeek;
                cvsource.SetDayState(dateState, dayState);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

		public override CGSize GetSizeForItem(UICollectionView collectionView, UICollectionViewLayout layout, NSIndexPath indexPath)
		{
			// 60 is 6 intervals of 10 each
			// 20 is the gap to the edges of the screen to our control
            // 10 is the margin at the edge of the control
            // works (6 columns) on iPhones: 7, 7+, 6, 6+, 5s
            float xs = (float)(ViewSize.Width - 60 - 20 - 15) / 7;

			return new SizeF(xs, xs);
		}

		public override bool ShouldSelectItem(UICollectionView collectionView, NSIndexPath indexPath)
		{
			return true;
		}

		public override void ItemHighlighted(UICollectionView collectionView, NSIndexPath indexPath)
		{
			// todo: change the background so the user knows he touched it
		}

		public override void ItemUnhighlighted(UICollectionView collectionView, NSIndexPath indexPath)
		{
            try
            {
                int ix = indexPath.Row;

                if ((ix >= 0) && (ix < 7))
                {
                    C_DayOfWeekTouchedEventArgs dte = new C_DayOfWeekTouchedEventArgs(ix);
                    DayOfWeekTouched?.Invoke(this, dte);
                }
                else
                {
                    int dayOfMonth = ix - 7 - FirstDayInMonthOffset;
                    if ((dayOfMonth >= 0) && (dayOfMonth < DateState.Length))
                    {
                        C_DateState dayState = DateState[dayOfMonth];
                        if (dayState.CanClick && ((dayState.Date >= C_YMD.Now) || AllowPastDates))
                            DateTouched?.Invoke(this, new C_DateTouchedEventArgs(dayState.Date));
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
		}

		public class C_CVSource : UICollectionViewDataSource
		{
            C_DateState[] DateState;
            C_DayState[] DayState;
            int FirstDayInMonthOffset;
            readonly string[] AbrevDayOfWeek = { "Su", "M", "Tu", "W", "Th", "F", "Sa" };
            public UIColor BackgroundColor;
            readonly bool AllowPastDates;

            public C_CVSource(C_DateState[] dateState, C_DayState[] dayState, bool allowPastDates)
			{
				DateState = dateState;
                DayState = dayState;
				FirstDayInMonthOffset = (int)dateState[0].Date.DayOfWeek;
                AllowPastDates = allowPastDates;
			}

            public void SetDayState(C_DateState[] dateState, C_DayState[] dayState)
            {
                DateState = dateState;
				DayState = dayState;
				FirstDayInMonthOffset = (int)dateState[0].Date.DayOfWeek;
			}

			public override nint GetItemsCount(UICollectionView collectionView, nint section)
			{
				// 7 days in a week, 7 rows: 1 for the header and 6 for weeks
				return 7 * 7;
			}

			public override UICollectionViewCell GetCell(UICollectionView collectionView, NSIndexPath indexPath)
			{
                C_GridCell cell = null;
                C_YMD now = C_YMD.Now;

				try
                {
                    cell = (C_GridCell)collectionView.DequeueReusableCell(gridCellId, indexPath);

                    int ix = indexPath.Row;

                    if (ix < 7)
                    {
                        // 0..6 get the name of the day of the week
                        cell.Label.Text = AbrevDayOfWeek[ix];

                        if (DayState == null)
                        {
                            cell.DayState = null;
                            cell.ContentView.BackgroundColor = BackgroundColor;
                            cell.ContentView.Layer.BorderColor = BackgroundColor.CGColor;
                            cell.Label.TextColor = UIColor.Black;
                        }
                        else
                        {
                            cell.DayState = DayState[ix];
                            cell.ContentView.BackgroundColor = DayState[ix].NormalColor;
                            cell.ContentView.Layer.BorderColor = DayState[ix].NormalColor.CGColor;
                            cell.Label.TextColor = UIColor.Black;
                        }
                    }
                    else
                    {
                        // 7..<end> get the day of the month number
                        int dayOfMonth = ix - 7 - FirstDayInMonthOffset;
                        bool validDay = (dayOfMonth >= 0) && (dayOfMonth < DateState.Length);
                        if (validDay)
                        {
                            C_DateState dateState = DateState[dayOfMonth];
                            cell.DateState = dateState;
                            cell.Label.Text = dateState.Date.Day.ToString();

                            UIColor normColor = dateState.NormalColor;
                            UIColor textColor = dateState.TextColor;
                            if (!AllowPastDates && (dateState.Date < now))
                            {
                                normColor = BackgroundColor;
                                textColor = UIColor.Black;
                            }

							cell.ContentView.BackgroundColor = normColor;
                            cell.ContentView.Layer.BorderColor = normColor.CGColor;
                            cell.Label.TextColor = textColor;

                            if ((dateState.ShowBox) && ((dateState.Date >= now) || AllowPastDates))  
                                cell.ContentView.Layer.BorderColor = dateState.BoxColor.CGColor;
                        }
                        else
                        {
                            // non-date; make this blank and disappear
                            cell.DateState = null;
                            cell.Label.Text = "";
                            cell.ContentView.BackgroundColor = BackgroundColor;
                            cell.ContentView.Layer.BorderColor = BackgroundColor.CGColor;
                        }
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }

				return cell;
			}
		}

		public class C_GridCell : UICollectionViewCell
		{
			public UILabel Label;
            public C_DateState DateState;
            public C_DayState DayState;

			[Export("initWithFrame:")]
			public C_GridCell(CGRect frame) : base(frame)
			{
                try
                {
                    BackgroundView = new UIView { BackgroundColor = UIColor.LightGray };

                    SelectedBackgroundView = new UIView { BackgroundColor = UIColor.Green };

                    ContentView.Layer.BorderColor = UIColor.Black.CGColor;
                    ContentView.Layer.BorderWidth = 3.0f;
                    ContentView.BackgroundColor = UIColor.LightGray;

					if (ContentView.Bounds.Width < 28f)
					{
						Label = new UILabel()
						{
							Center = ContentView.Center,
							TextColor = UIColor.White,
							Frame = new CGRect(5, 5, 30, 20),
							AdjustsFontSizeToFitWidth = true
						};
                        Label.Font = UIFont.FromName(Label.Font.Name, 9);
					}
                    else
                    {
						Label = new UILabel()
						{
							Center = ContentView.Center,
							TextColor = UIColor.White,
							Frame = new CGRect(5, 5, 30, 20),
							//AdjustsFontSizeToFitWidth = true
						};
					}

                    ContentView.AddSubview(Label);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
			}
		}
	}

	public class C_DateState
	{
        /// <summary>
        /// The normal color for the item when populated.
        /// </summary>
        public UIColor NormalColor;
        /// <summary>
        /// The color when highlighted (not implemented).
        /// </summary>
        public UIColor HighlightedColor;
        /// <summary>
        /// The color for the text in the box.
        /// </summary>
        public UIColor TextColor;
        /// <summary>
        /// The color of the surrounding box.
        /// </summary>
        public UIColor BoxColor;
        /// <summary>
        /// true if the box should be shown
        /// </summary>
        public bool ShowBox;
        /// <summary>
        /// true if a user touch on this button is considered an activiation
        /// </summary>
        public bool CanClick;

		public C_YMD Date;

		public C_DateState(C_YMD date)
		{
			Date = date;
            CanClick = true;
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

	public class C_DayState
	{
		public UIColor NormalColor;
		public UIColor HighlightedColor;
		public UIColor TextColor;
		public UIColor BoxColor;
		public bool ShowBox;

        public int DayOfWeek;

        public C_DayState(int dayOfWeek)
		{
            DayOfWeek = dayOfWeek;
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
}
