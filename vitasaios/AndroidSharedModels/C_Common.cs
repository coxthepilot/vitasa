using System;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.Views;

using Android.Graphics;
using Android.Content.Res;

namespace zsquared
{
    public static class C_Common
    {
        public static Color StandardBackground => Color.Rgb(19, 67, 107); // #FF13436B

        public static Color StandardButton => Color.Rgb(33, 96, 147); //#ff216093

        public static Color LogoutButton => Color.Rgb(33, 122, 147); // #ff217a93 

        public static Color StandardButtonLight => Color.Rgb(70, 123, 165);

        public static Color SwitchOn => Color.Rgb(188, 196, 49);

        public static ColorStateList GetStandardColorStateList()
        {
            int[][] ButtonColorStates = {
                new int[] { Android.Resource.Attribute.StateEnabled}, // enabled                 
                new int[] {-Android.Resource.Attribute.StateEnabled}, // disabled                 
                new int[] {-Android.Resource.Attribute.StateChecked}, // unchecked                 
                new int[] { Android.Resource.Attribute.StatePressed}  // pressed             
            };
            int[] ButtonColors = {
                Color.White,
                Color.Gray,
                Color.White,
                Color.Gray
            };
            return new ColorStateList(ButtonColorStates, ButtonColors);
        }

        /// <summary>
        /// Set the view background and set the button standard colors.
        /// </summary>
        /// <param name="a">The Activity on which to set the background and find buttons</param>
        /// <param name="viewResourceId">The "Resource.Id.[value]" for this view</param>
        public static void SetViewColors(Activity a, int viewResourceId, bool setBackground = true)
        {
            View view = a.FindViewById(viewResourceId);
            if (setBackground)
                view.SetBackgroundColor(C_Common.StandardBackground);

            Queue<View> ViewsQ = new Queue<View>();
            ViewsQ.Enqueue(view);
            while (ViewsQ.Count != 0)
            {
                View v = ViewsQ.Dequeue();
                if (v is ViewGroup)
                {
                    ViewGroup vg = v as ViewGroup;
                    for (int ix = 0; ix != vg.ChildCount; ix++)
                    {
                        View child = vg.GetChildAt(ix);
                        string nameLower = child.AccessibilityClassName.ToLower();
                        if (nameLower.Contains("button"))
                        {
                            Button b = child as Button;
                            b.SetTextColor(GetStandardColorStateList());
                            b.SetBackgroundColor(StandardButton);
                        }
                        else if (nameLower.Contains("textview"))
                        {
                            TextView tv = child as TextView;
                            tv.SetTextColor(GetStandardColorStateList());
                        }
                        else if (nameLower.Contains("layout"))
                        {
                            if (child is ViewGroup)
                            {
                                View vc = child as View;
                                ViewsQ.Enqueue(vc);
                            }
                        }
                    }
                }
                else
                    Console.WriteLine("huh?");
            }
        }
    }
}
