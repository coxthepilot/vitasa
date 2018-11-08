using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;
using Foundation;

namespace zsquared
{
    public class C_TableSource<T> : UITableViewSource
    {
        public delegate string ReturnStringEventHandler(object sender, TableSourceEventArgs<T> args);
        public delegate bool ReturnBoolEventHandler(object sender, TableSourceEventArgs<T> args);
        public delegate void TableEventHandler(object sender, TableSourceEventArgs<T> args);

        readonly UIViewController ourVC;
        public List<T> List;
        readonly UITableView TableView;

        readonly string CellIdentifier;

        public event ReturnStringEventHandler GetTextLabel;
        public event ReturnStringEventHandler GetDetailTextLabel;
        public event TableEventHandler Selected;
        public event TableEventHandler Delete;
        public event ReturnBoolEventHandler DeleteAllowed;
        public event ReturnBoolEventHandler IncludeSwitch;
        public event TableEventHandler SwitchValueChanged;

        //public bool ShowIndex = false;

        public class TableSourceEventArgs<U> : EventArgs
        {
            public U Item;
            public bool SwitchState;
            public int row;

            public TableSourceEventArgs(U ux, int r)
            {
                Item = ux;
                row = r;
            }
        }

        public C_TableSource(UIViewController vc, UITableView tv, List<T> list, string cellIdentifier = "TableCell")
        {
            ourVC = vc;
            List = list;
            CellIdentifier = cellIdentifier;
            TableView = tv;
        }

        public override nint RowsInSection(UITableView tableview, nint section)
        {
            int count = List.Count;
            return count;
        }

        public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
        {
            UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
            //---- if there are no cells to reuse, create a new one ---
            //if (cell == null)
                //cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);
            if (cell == null)
                cell = new CustomCell(CellIdentifier);

            T ce = List[indexPath.Row];

            if (GetTextLabel != null)
                cell.TextLabel.Text = GetTextLabel(this, new TableSourceEventArgs<T>(ce, indexPath.Row));

            if (GetDetailTextLabel != null)
                cell.DetailTextLabel.Text = GetDetailTextLabel(this, new TableSourceEventArgs<T>(ce, indexPath.Row));

            cell.BackgroundColor = C_Common.StandardButton;
            cell.TextLabel.TextColor = UIColor.White;
            cell.DetailTextLabel.TextColor = UIColor.White;

            //cell.BackgroundView.BackgroundColor = C_Common.StandardButton;
            //cell.SelectedBackgroundView.BackgroundColor = C_Common.StandardButtonLight;
            //cell.SelectionStyle = UITableViewCellSelectionStyle.

            if (IncludeSwitch != null)
            {
                bool switchState = IncludeSwitch(this, new TableSourceEventArgs<T>(ce, indexPath.Row));
                UISwitch s = new UISwitch
                {
                    On = switchState,
                    OnTintColor = C_Common.SwitchOn
                };
                s.ValueChanged += (sender, e) =>
                {
                    TableSourceEventArgs<T> tsea = new TableSourceEventArgs<T>(ce, indexPath.Row)
                    {
                        SwitchState = s.On
                    };
                    SwitchValueChanged?.Invoke(this, tsea);
                };
                cell.AccessoryView = s;
            }

            return cell;
        }

        public override void RowDeselected(UITableView tableView, NSIndexPath indexPath)
        {
            //UITableViewCell cell = TableView.CellAt(indexPath);
            //cell.BackgroundColor = C_Common.StandardButton;
        }

        public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
        {
            T ce = List[indexPath.Row];

            //UITableViewCell cell = TableView.CellAt(indexPath);
            //cell.BackgroundView.BackgroundColor = C_Common.StandardButtonLight;
            //cell.SelectedBackgroundView.BackgroundColor = C_Common.StandardButton;

            Selected?.Invoke(this, new TableSourceEventArgs<T>(ce, indexPath.Row));
        }

        public override bool CanEditRow(UITableView tableView, NSIndexPath indexPath)
        {
            // allow row delete if the delete handler has been provided and approved
            bool okToDelete = true;
            if (DeleteAllowed != null)
                okToDelete = DeleteAllowed.Invoke(this, new TableSourceEventArgs<T>(List[indexPath.Row], indexPath.Row));
            return (Delete != null) && okToDelete;
        }

        public override void CommitEditingStyle(UITableView tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath indexPath)
        {
            if (editingStyle == UITableViewCellEditingStyle.Delete)
            {
                // get the one we are removing before it is taken off the list
                T ce = List[indexPath.Row];
                // remove from data source
                List.RemoveAt(indexPath.Row);
                // remove from the display
                tableView.DeleteRows(new NSIndexPath[] { indexPath }, UITableViewRowAnimation.Fade);
                // lastly, call our event
                Delete?.Invoke(this, new TableSourceEventArgs<T>(ce, indexPath.Row));
            }
        }

        //public override string[] SectionIndexTitles(UITableView tableView)
        //{
        //    if (!ShowIndex || (GetTextLabel == null))
        //        return null;

        //    List<string> index = new List<string>();
        //    foreach(T t in List)
        //    {
        //        string l = GetTextLabel(this, new TableSourceEventArgs<T>(t));
        //        if (l.Length > 0)
        //        {
        //            string fl = l.Substring(0, 1).ToLower();
        //            if (!index.Contains(fl))
        //                index.Add(fl);
        //        }
        //    }
        //    index.Sort();

        //    return index.ToArray();
        //}

        //// doesn't work; need to implement sections...sigh
        //public override nint SectionFor(UITableView tableView, string title, nint atIndex)
        //{
        //    if (!ShowIndex || (GetTextLabel == null))
        //        return 0;

        //    string flit = title.Substring(0, 1).ToLower();

        //    int ix = -1;
        //    for (int x = 0; x != List.Count; x++)
        //    {
        //        T t = List[x];
        //        string l = GetTextLabel(this, new TableSourceEventArgs<T>(t));
        //        string flil = l.Substring(0, 1).ToLower();
        //        if (flil == flit)
        //        {
        //            ix = x;
        //            break;
        //        }
        //    }

        //    return ix;
        //}

        public class CustomCell : UITableViewCell
        {
            public CustomCell(string cellid) : base (UITableViewCellStyle.Subtitle, cellid)
            {
            }

            public override void SetSelected(bool selected, bool animated)
            {
                if (selected)
                    BackgroundColor = C_Common.StandardButtonLight;
                else
                    BackgroundColor = C_Common.StandardButton;
            }
        }
    }
}
