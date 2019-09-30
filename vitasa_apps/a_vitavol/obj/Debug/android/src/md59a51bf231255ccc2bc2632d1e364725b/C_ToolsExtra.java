package md59a51bf231255ccc2bc2632d1e364725b;


public class C_ToolsExtra
	extends android.app.Activity
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("zsquared.C_ToolsExtra, a_vitavol", C_ToolsExtra.class, __md_methods);
	}


	public C_ToolsExtra ()
	{
		super ();
		if (getClass () == C_ToolsExtra.class)
			mono.android.TypeManager.Activate ("zsquared.C_ToolsExtra, a_vitavol", "", this, new java.lang.Object[] {  });
	}

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
