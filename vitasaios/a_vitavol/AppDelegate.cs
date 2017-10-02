using Android.App;

using System;

using zsquared;

namespace a_vitavol
{
//#if DEBUG
//    [Application(Debuggable = true)]
//#else
//    [Application(Debuggable = false)]
//#endif
    [Application]
    public class MyAppDelegate : Application
    {
        public C_Global Global;
        public C_AndroidGlobal AndroidGlobal;

        public MyAppDelegate(System.IntPtr ptr, Android.Runtime.JniHandleOwnership o) : base(ptr, o)
        {
            
        }
    }
}
