package md5b41ac70c8aef3c98747c160425237e3b;


public class A_ViewNotification
	extends android.app.Activity
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onCreate:(Landroid/os/Bundle;)V:GetOnCreate_Landroid_os_Bundle_Handler\n" +
			"";
		mono.android.Runtime.register ("a_vitavol.A_ViewNotification, a_vitavol", A_ViewNotification.class, __md_methods);
	}


	public A_ViewNotification ()
	{
		super ();
		if (getClass () == A_ViewNotification.class)
			mono.android.TypeManager.Activate ("a_vitavol.A_ViewNotification, a_vitavol", "", this, new java.lang.Object[] {  });
	}


	public void onCreate (android.os.Bundle p0)
	{
		n_onCreate (p0);
	}

	private native void n_onCreate (android.os.Bundle p0);

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
