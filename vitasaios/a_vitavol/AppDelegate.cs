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
    public class MyAppDelegate : Application, I_Global
    {
        public C_Global Global;

        public C_AndroidGlobal AndroidGlobal;

		private long _BytesReceived;

		public MyAppDelegate(System.IntPtr ptr, Android.Runtime.JniHandleOwnership o) : base(ptr, o)
        {
            
        }

		public C_Global GetGlobal()
		{
			return Global;
		}

		public long GetBytesReceived()
		{
			return _BytesReceived;
		}

		public void UpdateBytesReceived(int v)
		{
			_BytesReceived += v;
		}


	}
}
