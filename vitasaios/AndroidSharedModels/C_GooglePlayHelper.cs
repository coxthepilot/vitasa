using Android.App;
using Android.Gms.Common;

namespace zsquared
{
    public class C_GooglePlayHelper
	{
		public static bool IsGooglePlayServicesInstalled(Activity a)
		{
			int queryResult = GoogleApiAvailability.Instance.IsGooglePlayServicesAvailable(a);
			if (queryResult == ConnectionResult.Success)
			{
				//Log.Info("MainActivity", "Google Play Services is installed on this device.");
				return true;
			}

			//if (GoogleApiAvailability.Instance.IsUserResolvableError(queryResult))
			//{
			//  string errorString = GoogleApiAvailability.Instance.GetErrorString(queryResult);
			//  Log.Error("ManActivity", "There is a problem with Google Play Services on this device: {0} - {1}", queryResult, errorString);

			//  // Show error dialog to let user debug google play services
			//}

			return false;
		}
	}
}
