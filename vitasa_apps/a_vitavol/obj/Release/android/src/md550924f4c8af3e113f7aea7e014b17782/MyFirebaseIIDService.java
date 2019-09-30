package md550924f4c8af3e113f7aea7e014b17782;


public class MyFirebaseIIDService
	extends com.google.firebase.iid.FirebaseInstanceIdService
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onTokenRefresh:()V:GetOnTokenRefreshHandler\n" +
			"";
		mono.android.Runtime.register ("FCMClient.MyFirebaseIIDService, a_vitavol", MyFirebaseIIDService.class, __md_methods);
	}


	public MyFirebaseIIDService ()
	{
		super ();
		if (getClass () == MyFirebaseIIDService.class)
			mono.android.TypeManager.Activate ("FCMClient.MyFirebaseIIDService, a_vitavol", "", this, new java.lang.Object[] {  });
	}


	public void onTokenRefresh ()
	{
		n_onTokenRefresh ();
	}

	private native void n_onTokenRefresh ();

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
