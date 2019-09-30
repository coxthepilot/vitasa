using System;
using UIKit;
using System.Collections.Generic;

namespace zsquared
{
	public class C_PickerModel : UIPickerViewModel
	{
		public event EventHandler<PickerChangedEventArgs> PickerChanged;

        /// <summary>
        /// The list of items in the picker
        /// </summary>
        readonly List<string> PickList;

        public C_PickerModel(List<string> pickList)
		{
			PickList = pickList;
		}

		public override nint GetRowsInComponent(UIPickerView pickerView, nint component)
		{
			return PickList.Count;
		}

		public override nint GetComponentCount(UIPickerView pickerView)
		{
			return 1;
		}

		public override string GetTitle(UIPickerView pickerView, nint row, nint component)
		{
			return PickList[(int)row];
		}

		public override void Selected(UIPickerView pickerView, nint row, nint component)
		{
			PickerChanged?.Invoke(this, new PickerChangedEventArgs { SelectedValue = PickList[(int)row] });
		}
	}

	public class PickerChangedEventArgs : EventArgs
	{
		public object SelectedValue { get; set; }
	}
}
