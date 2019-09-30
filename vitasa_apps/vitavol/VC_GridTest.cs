using Foundation;
using System;
using UIKit;
using Xamarin.Forms;
using CoreGraphics;
using System.Drawing;
using System.Threading.Tasks;
using System.Collections.Generic;


using zsquared;

namespace vitavol
{
    public partial class VC_GridTest : UIViewController
    {
		static NSString gridCellId = new NSString("GridCell");
        C_Global Global;

        public VC_GridTest (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			CV_Grid.RegisterClassForCell(typeof(C_GridCell), gridCellId);

			// use the date from our previous visit if it exists
			if (Global.CalendarDate == null)
				Global.CalendarDate = C_YMD.Now;

            CGRect screenSize = new CGRect(0, 0, 0, 0);

			try
            {
                screenSize = UIScreen.MainScreen.Bounds;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            C_CVDelegate del = new C_CVDelegate(screenSize.Size);
            del.CellTouched += (sender, e) => 
            {
                CellTouchedEventArgs ea = (CellTouchedEventArgs)e;
                L_CellTouched.Text = ea.IndexPath.Row.ToString();
            };
			CV_Grid.DataSource = new C_CVSource();
            CV_Grid.Delegate = del;
            CV_Grid.BackgroundColor = UIColor.White;
        }

        public class C_CVSource : UICollectionViewDataSource
        {
			public override nint GetItemsCount(UICollectionView collectionView, nint section)
            {
                return 7 * 6;
            }

            public override UICollectionViewCell GetCell(UICollectionView collectionView, NSIndexPath indexPath)
            {
                C_GridCell cell = (C_GridCell)collectionView.DequeueReusableCell(gridCellId, indexPath);
                //---- if there are no cells to reuse, create a new one
                if (cell == null)
                    throw new ApplicationException("hope it never gets here");

                cell.Text = indexPath.Row.ToString();
                Console.WriteLine("row: " + indexPath.Row.ToString());

				return cell;
			}
        }

		public class CellTouchedEventArgs : EventArgs
		{
            public NSIndexPath IndexPath;

            public CellTouchedEventArgs(NSIndexPath indexPath)
            {
                IndexPath = indexPath;
            }
		}

		class C_CVDelegate : UICollectionViewDelegateFlowLayout
		{
			public event EventHandler<CellTouchedEventArgs> CellTouched;

			CGSize hostSize;
            public C_CVDelegate(CGSize size)
            {
                hostSize = size;
            }

            public override CGSize GetSizeForItem(UICollectionView collectionView, UICollectionViewLayout layout, NSIndexPath indexPath)
            {
                // 60 is 6 intervals of 10 each
                // 20 is the gap to the edges of the screen to our control
                // no clue why the additional 40 is necessary; but seems to work on 5s to 7 Plus
                float xs = (float)(hostSize.Width - 60 - 20 - 40) / 7;

				return new SizeF(xs, xs);
			}

            public override bool ShouldSelectItem(UICollectionView collectionView, NSIndexPath indexPath)
            {
                return true;
            }

            public override void ItemUnhighlighted(UICollectionView collectionView, NSIndexPath indexPath)
            {
                CellTouched?.Invoke(this, new CellTouchedEventArgs(indexPath));
			}
		}

		public class C_GridCell : UICollectionViewCell
		{
            readonly UILabel label;

            [Export("initWithFrame:")]
			public C_GridCell(CGRect frame) : base(frame)
			{
                BackgroundView = new UIView { BackgroundColor = UIColor.LightGray };

				SelectedBackgroundView = new UIView { BackgroundColor = UIColor.Green };

                ContentView.Layer.BorderColor = UIColor.Black.CGColor;
				ContentView.Layer.BorderWidth = 3.0f;
                ContentView.BackgroundColor = UIColor.LightGray;

                label = new UILabel()
                {
                    Center = ContentView.Center,
                    TextColor = UIColor.White,
                    Frame = new CGRect(Center.X / 2.0f, Center.Y / 2.0f, 30, 20)

					//Frame = new CGRect(10, 10, 30, 20)
				};
                ContentView.AddSubview(label);
			}
            public string Text
            {
                set { label.Text = value; }
            }
		}

    }

}