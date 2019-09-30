using System;
using System.Collections.Generic;
using UIKit;
using Xamarin.Forms;

namespace zsquared
{
	public class C_ItemPicker<T>
	{

        public class C_ItemPickerSelect<T1> : EventArgs
        {
            public T1 Selection;

            public C_ItemPickerSelect(T1 sel)
            {
                Selection = sel;
            }
        }

        public delegate void ItemPickerEventHandler(object sender, C_ItemPickerSelect<T> e);

        readonly UITextField TB_;

		public event ItemPickerEventHandler PickerDone;

        readonly UIPickerView PV_;
        List<T> Items;
        public T Selection;

		public C_ItemPicker(UITextField tb, List<T> items)
		{
			TB_ = tb;
            Items = items;

            PV_ = new UIPickerView()
            {
                ShowSelectionIndicator = true
            };

            C_PickerDataModel<T> pdmodel = new C_PickerDataModel<T>(Items);
            PV_.Model = pdmodel;

            UIToolbar ToolBar_ = new UIToolbar()
			{
				BarStyle = UIBarStyle.Black,
				Translucent = true
			};
			ToolBar_.SizeToFit();

			UIBarButtonItem doneButtonOpen = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
                int xsel = (int)PV_.SelectedRowInComponent(0);
                if (xsel < Items.Count)
                {
                    T sel = Items[xsel];
                    Selection = sel;
                    TB_.Text = sel.ToString();
                    PickerDone?.Invoke(this, new C_ItemPickerSelect<T>(sel));
                    TB_.ResignFirstResponder();
                }
			});
			ToolBar_.SetItems(new UIBarButtonItem[] { doneButtonOpen }, true);
			UITextAttributes uitaot = new UITextAttributes()
			{
				TextColor = UIColor.White
			};
			doneButtonOpen.SetTitleTextAttributes(uitaot, UIControlState.Normal);

			TB_.InputView = PV_;
			TB_.InputAccessoryView = ToolBar_;
		}

        public void SetSelection(T v)
        {
            int selix = -1;
            for (int ix = 0; ix != Items.Count; ix++)
            {
                if (Items[ix].ToString() == v.ToString())
                {
                    selix = ix;
                    break;
                }
            }

            if (selix != -1)
            {
                Selection = v;
                PV_.Select(selix, 0, true);
                TB_.Text = v.ToString();
            }
        }

		//public string Value
		//{
		//	get { return Selection; }
		//}

		//public void SetValue(string sel)
		//{
  //          Selection = sel;
  //          TB_.Text = sel;
		//}

        public class C_PickerDataModel<T1> : UIPickerViewModel
        {
            public List<T1> Items;

            public C_PickerDataModel(List<T1> items)
            {
                Items = items;
            }

            public override nint GetRowsInComponent(UIPickerView pickerView, nint component)
            {
                return Items.Count;
            }

            public override nint GetComponentCount(UIPickerView pickerView)
            {
                return 1;
            }

            public override string GetTitle(UIPickerView pickerView, nint row, nint component)
            {
                return Items[(int)row].ToString();
            }
        }
	}

}
