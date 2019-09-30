using System;
using System.Collections.Generic;
using UIKit;
using Xamarin.Forms;

namespace zsquared
{
    public class C_UserPicker
    {
        readonly UITextField TB_;

        public event UserPickerEventHandler UserPickerDone;

        readonly UIPickerView PV_;
        List<C_VitaUser> Users;
        public string Selection;

        public C_UserPicker(UITextField tb, List<C_VitaUser> users)
        {
            TB_ = tb;
            Users = users;

            PV_ = new UIPickerView()
            {
                ShowSelectionIndicator = true
            };

            C_PickerDataModel pdmodel = new C_PickerDataModel(Users);
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
                C_VitaUser user = Users[xsel];
                TB_.Text = user.Name;
                UserPickerDone?.Invoke(this, new C_UserPickerSelect(user));
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
            public List<C_VitaUser> Items;

            public C_PickerDataModel(List<C_VitaUser> items)
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
                return Items[(int)row].Name;
            }
        }
    }

    public class C_UserPickerSelect : EventArgs
    {
        public C_VitaUser Selection;

        public C_UserPickerSelect(C_VitaUser sel)
        {
            Selection = sel;
        }
    }

    public delegate void UserPickerEventHandler(object sender, C_UserPickerSelect e);
}
