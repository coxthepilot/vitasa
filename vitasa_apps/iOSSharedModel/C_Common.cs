using System;
using UIKit;

namespace zsquared
{
    public static class C_Common
    {
        public static UIColor Color_NoSiteOpen = UIColor.FromRGB(0x57, 0x57, 0x57);
        public static UIColor Color_OneAppt = UIColor.FromRGB(0xBB, 0xBA, 0x49);
        public static UIColor Color_TwoAppt = UIColor.FromRGB(0x2F, 0xA1, 0x80);
        public static UIColor Color_BadAppt = UIColor.FromRGB(0xA8, 0x00, 0x00);

        public static UIColor StandardBackground => UIColor.FromRGB(19, 67, 107); // #13436B

        public static UIColor StandardButton => UIColor.FromRGB(33, 96, 147);

        public static UIColor StandardButtonLight => UIColor.FromRGB(70, 123, 165);

        public static UIColor SwitchOn => UIColor.FromRGB(188, 196, 49);

        public static UIColor LogoutButton => UIColor.FromRGB(33, 122, 147); // #ff217a93 

        public static UIColor OpenDefault = SwitchOn;
        public static UIColor ClosedDefault = StandardButtonLight;

        public static void DropFirstResponder(UIView view)
        {
            view.BackgroundColor = StandardBackground;

            foreach (UIView v in view.Subviews)
            {
                if (v is UIButton)
                {
                    UIButton b = v as UIButton;
                    b.ResignFirstResponder();
                }
                else if (v is UISwitch)
                {
                    UISwitch sw = v as UISwitch;
                    sw.ResignFirstResponder();
                }
                else if (v is UIWebView)
                {
                    UIWebView wv = v as UIWebView;
                    v.ResignFirstResponder();
                }
                else if (v is UICollectionView)
                {
                    UICollectionView cv = v as UICollectionView;
                    cv.ResignFirstResponder();
                }
                else if (v is UITextField)
                {
                    UITextField tf = v as UITextField;
                    tf.ResignFirstResponder();
                }
                else if (v is UITextView)
                {
                    UITextView tf = v as UITextView;
                    tf.ResignFirstResponder();
                }
                else if (v is UITableView)
                {
                    UITableView tv = v as UITableView;
                    tv.ResignFirstResponder();
                }
            }
        }

        public static void SetUIColors(UIView view)
        {
            view.BackgroundColor = StandardBackground;

            foreach (UIView v in view.Subviews)
            {
                if (v is UIButton)
                {
                    UIButton b = v as UIButton;
                    b.SetTitleColor(UIColor.FromRGBA(255, 255, 255, 255), UIControlState.Normal);
                    b.SetTitleColor(UIColor.FromRGBA(255, 255, 255, 64), UIControlState.Disabled);
                    string title = b.Title(UIControlState.Normal);
                    string titleLower = title.ToLower();
                    if (titleLower.Contains("logout"))
                        b.BackgroundColor = LogoutButton;
                    else if (titleLower.Contains("back"))
                        b.BackgroundColor = StandardBackground;
                    else
                        b.BackgroundColor = StandardButton;
                }
                else if (v is UISwitch)
                {
                    UISwitch sw = v as UISwitch;
                    sw.OnTintColor = C_Common.SwitchOn;
                }
                else if (v is UIWebView)
                {
                    UIWebView wv = v as UIWebView;
                    wv.BackgroundColor = StandardBackground;
                }
                else if (v is UICollectionView)
                {
                    UICollectionView cv = v as UICollectionView;
                    ((UICollectionView)v).BackgroundColor = StandardBackground;
                }
                else if (v is UITextField)
                {
                    UITextField tf = v as UITextField;
                    tf.BackgroundColor = StandardButton;
                    tf.TextColor = UIColor.White;
                }
                else if (v is UITextView)
                {
                    UITextView tf = v as UITextView;
                    tf.BackgroundColor = StandardButton;
                    tf.TextColor = UIColor.White;
                }
                else if (v is UITableView)
                {
                    UITableView tv = v as UITableView;
                    tv.BackgroundColor = StandardBackground;
                }
            }
        }

        public static void EnableUI(UIView view, bool en)
        {
            foreach (UIView v in view.Subviews)
            {
                if (v is UIButton)
                {
                    UIButton b = v as UIButton;
                    b.Enabled = en;
                }
                else if (v is UITableView)
                {
                    UITableView tv = v as UITableView;
                    tv.UserInteractionEnabled = en;
                }
                else if (v is UITextField)
                {
                    UITextField tf = v as UITextField;
                    tf.Enabled = en;
                }
                else if (v is UISwitch)
                {
                    UISwitch sw = v as UISwitch;
                    sw.Enabled = en;
                }
                else if (v is UIWebView)
                {
                    UIWebView wv = v as UIWebView;
                    wv.UserInteractionEnabled = en;
                }
                else if (v is UICollectionView)
                {
                    UICollectionView cv = v as UICollectionView;
                    cv.UserInteractionEnabled = en;
                }
                else if (v is UITextView)
                {
                    UITextView tf = v as UITextView;
                    tf.UserInteractionEnabled = en;
                }
            }
        }

        public static void SetEnabledColors(UITextField tf)
        {
            tf.TextColor = tf.Enabled ? UIColor.White : UIColor.Gray;
        }
    }
}
