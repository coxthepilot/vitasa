using System;
using System.Collections.Generic;
using UIKit;
using Xamarin.Forms;

namespace zsquared
{
	public class C_ItemPicker
	{
		readonly UITextField TB_;

		public event ItemPickerEventHandler TimePickerDone;

        readonly UIPickerView PV_;
        List<string> Items;
        public string Selection;

		public C_ItemPicker(UITextField tb, List<string> items)
		{
			TB_ = tb;
            Items = items;

            PV_ = new UIPickerView()
            {
                ShowSelectionIndicator = true
            };

            C_PickerDataModel pdmodel = new C_PickerDataModel(Items);
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
                string sel = Items[xsel];
                TB_.Text = sel;
				TimePickerDone?.Invoke(this, new C_ItemPickerSelect(sel));
				TB_.ResignFirstResponder();
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

		public string Value
		{
			get { return Selection; }
		}

		public void SetValue(string sel)
		{
            Selection = sel;
            TB_.Text = sel;
		}

        public class C_PickerDataModel : UIPickerViewModel
        {
            public List<string> Items;

            public C_PickerDataModel(List<string> items)
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
                return Items[(int)row];
            }
        }
	}

	public class C_ItemPickerSelect : EventArgs
	{
        public string Selection;

		public C_ItemPickerSelect(string sel)
		{
            Selection = sel;
		}
	}

	public delegate void ItemPickerEventHandler(object sender, C_ItemPickerSelect e);
}
