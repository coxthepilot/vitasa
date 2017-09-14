using Foundation;
using UserNotifications;
using UIKit;
using System;
using System.Json;
using System.Threading.Tasks;
using System.Text;

using zsquared;

using System.Collections.Generic;
using System.Linq;
using Xamarin.Forms;

namespace vitavol
{
    // The UIApplicationDelegate for the application. This class is responsible for launching the
    // User Interface of the application, as well as listening (and optionally responding) to application events from iOS.
    [Register("AppDelegate")]
    public class AppDelegate : UIApplicationDelegate
    {
		public static readonly string N_KnownEventsJson = "knowneventsjson";
        public static readonly string N_Email = "email";
        public static readonly string N_Password = "password";
        public static readonly string N_PushDeviceToken = "PushDeviceToken";

		/// <summary>
		/// These are values that get pass from ViewController to ViewController.
		/// </summary>
		public C_Global Global;

        public override UIWindow Window
        {
            get;
            set;
        }

        public override bool FinishedLaunching(UIApplication application, NSDictionary launchOptions)
        {
            // initialize the variables that are shared across pages
            Global = new C_Global();

            // only needed once when the app starts; this lets us handle the certificate from abandonedfactory.net
			C_Vita.SetupCertificateHandling();

			try
            {
                // required so we can request permission to do authorizations
                global::Xamarin.Forms.Forms.Init();

                // tell the user we are going to issue notifications; the OS will ask for permission
                if (UIDevice.CurrentDevice.CheckSystemVersion(10, 0))
                {
                    // Request Permissions
                    UNUserNotificationCenter.Current.RequestAuthorization(UNAuthorizationOptions.Alert, (granted, error) => { });

                    //UIRemoteNotificationType notificationTypes = UIRemoteNotificationType.Alert | UIRemoteNotificationType.Sound;
                    //UIApplication.SharedApplication.RegisterForRemoteNotificationTypes(notificationTypes);
                    UIApplication.SharedApplication.RegisterForRemoteNotifications();
                }
                else if (UIDevice.CurrentDevice.CheckSystemVersion(8, 0))
                {
                    var notificationSettings = UIUserNotificationSettings.GetSettingsForTypes(UIUserNotificationType.Alert, null);

                    application.RegisterUserNotificationSettings(notificationSettings);

					var pushSettings = UIUserNotificationSettings.GetSettingsForTypes(
					   UIUserNotificationType.Alert | UIUserNotificationType.Sound,
					   new NSSet());

					UIApplication.SharedApplication.RegisterUserNotificationSettings(pushSettings);
					UIApplication.SharedApplication.RegisterForRemoteNotifications();
                }

                //Get current notification settings (why????)
                //UNUserNotificationCenter.Current.GetNotificationSettings((settings) =>
                //{
                //    var alertsAllowed = (settings.AlertSetting == UNNotificationSetting.Enabled);
                //});

                // set our delegate in place to let us know when notifications are about to happen
                UNUserNotificationCenter.Current.Delegate = new UserNotificationCenterDelegate();

                // set the minium amount of time between fetches (in seconds)
                // we target 4 hours to make sure we get at least one late at night
                UIApplication.SharedApplication.SetMinimumBackgroundFetchInterval(4 * 60 * 60);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            return true;
        }

		public override void RegisteredForRemoteNotifications(UIApplication application, NSData deviceToken)
		{
			// Get current device token
			var DeviceToken = deviceToken.Description;
			if (!string.IsNullOrWhiteSpace(DeviceToken))
			{
				DeviceToken = DeviceToken.Trim('<').Trim('>');
			}

			// Get previous device token
			var oldDeviceToken = NSUserDefaults.StandardUserDefaults.StringForKey(N_PushDeviceToken);

			// Has the token changed?
			if (string.IsNullOrEmpty(oldDeviceToken) || !oldDeviceToken.Equals(DeviceToken))
			{
                // todo: call the back end api to register this APNS token
                Console.WriteLine(DeviceToken);
			}

			// Save new device token
			NSUserDefaults.StandardUserDefaults.SetString(DeviceToken, N_PushDeviceToken);
		}

		public override void FailedToRegisterForRemoteNotifications(UIApplication application, NSError error)
		{
            Console.WriteLine("Failed to register token");
		}

        public override void PerformFetch(UIApplication application, Action<UIBackgroundFetchResult> completionHandler)
        {
			Console.WriteLine("OS initiated Fetch...");
			FetchHandler(completionHandler);
        }

        public void FetchHandler(Action<UIBackgroundFetchResult> completionHandler)
        {
            // get our settings; if this is a new app, then create the empty json set
			// KnownEventsJson is a list of events for which we will eventually issue notifications
			string KnownEventsJsonString = NSUserDefaults.StandardUserDefaults.StringForKey(N_KnownEventsJson);
			if (string.IsNullOrEmpty(KnownEventsJsonString))
			{
				KnownEventsJsonString = "{}";
				NSUserDefaults.StandardUserDefaults.SetString(KnownEventsJsonString, N_KnownEventsJson);
			}

			// see if we have a user; if we do not have a user, then we have nothing to do
            string email = NSUserDefaults.StandardUserDefaults.StringForKey(N_Email);
            string password = NSUserDefaults.StandardUserDefaults.StringForKey(N_Password);
			if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
			{
                completionHandler?.Invoke(UIBackgroundFetchResult.NoData);
                return;
			}

			Task.Run(async () =>
			{
				C_VitaUser ourUser = await C_Vita.PerformLogin(email, password);
                if ((ourUser == null) || (ourUser.HasSiteCoordinator))
				{
					completionHandler?.Invoke(UIBackgroundFetchResult.NoData);
					return;
				}

				// now that we have a user, go ahead and parse the KnownEvents
				List<C_NotificationEvent> KnownEvents = new List<C_NotificationEvent>();
                try
                {
                    JsonValue KnownEventsJson = JsonValue.Parse(KnownEventsJsonString);
                    if (KnownEventsJson.ContainsKey("knownevents"))
                    {
                        JsonValue kej = KnownEventsJson["knownevents"];
                        foreach (JsonValue jv in kej)
                        {
                            C_NotificationEvent ne = new C_NotificationEvent(jv);
                            KnownEvents.Add(ne);
                        }
                    }
                }
                catch {}

				C_YMD firstDay = C_YMD.Now;
				// remove items that happened from yesterday back
				// this leave the list with items from this day forward
				List<C_NotificationEvent> itemsToRemove = new List<C_NotificationEvent>();
				foreach (C_NotificationEvent wi in KnownEvents)
				{
					if (wi.EventDate < firstDay)
						itemsToRemove.Add(wi);
				}
				foreach (C_NotificationEvent ne in itemsToRemove)
					KnownEvents.Remove(ne);

				// update the KnownEvents based on the fetch of the user WorkItems
				// get the work items for the next 7 days, including today
				C_YMD lastDay = firstDay.AddDays(7);
				List<C_WorkItem> ourUserWorkItems = new List<C_WorkItem>();
				foreach (C_WorkItem wi in ourUser.WorkIntentsX)
				{
					if ((wi.Date >= firstDay) && (wi.Date <= lastDay))
						ourUserWorkItems.Add(wi);
				}

				// a dictionary to convert slugs to site names; our cache of conversions
				// populte with the ones we already know
				Dictionary<string, string> SlugToSiteName = new Dictionary<string, string>();
				foreach (C_NotificationEvent ne in KnownEvents)
				{
					if (!SlugToSiteName.ContainsKey(ne.SiteSlug))
						SlugToSiteName.Add(ne.SiteSlug, ne.SiteName);
				}

				// go through the events received with the user, filter for the next 7 days
				//  if the event is in KnownEvents, copy it over and update it
				//  if not in KnownEvents, create a new Event
				List<C_NotificationEvent> NewKnownEvents = new List<C_NotificationEvent>();
				foreach (C_WorkItem wi in ourUserWorkItems)
				{
					// look for this event in the KnownEvents
					var ou = KnownEvents.Where(nex => nex.WorkItemId == wi.id);
					if (ou.Any())
					{
						// item found; just add to the result
						NewKnownEvents.Add(ou.First());
					}
					else
					{
						// the workitem was not found in our known events
						C_NotificationEvent nne = new C_NotificationEvent(wi);
						if (SlugToSiteName.ContainsKey(wi.SiteSlug))
						{
							nne.SiteName = SlugToSiteName[wi.SiteSlug];
							NewKnownEvents.Add(nne);
						}
						else
						{
							C_VitaSite site = await C_VitaSite.FetchSitesDetails(wi.SiteSlug);
							if (site != null)
							{
								SlugToSiteName.Add(wi.SiteSlug, site.Name);
								nne.SiteName = site.Name;
								NewKnownEvents.Add(nne);
							}
						}
					}
				}

				// if the next event has not already been scehduled to notify, then do so
				if (NewKnownEvents.Count != 0)
				{
					// sort the events so that the next event is on top
					NewKnownEvents.Sort(C_NotificationEvent.ComparebyDateAscending);
					// get that next event
					C_NotificationEvent ne = NewKnownEvents[0];
					// if we haven't already issue the notification, the create and post it
					if (!ne.NotificationIssued)
					{
                        try
                        {
                            // figure out when we want the alert to go out
                            C_YMD notificationDate = ne.EventDate.SubtractDays(1);
                            if (notificationDate < C_YMD.Now)
                                notificationDate = C_YMD.Now;
                            DateTime notificationDateTime = new DateTime(
                                notificationDate.Year,
                                notificationDate.Month,
                                notificationDate.Day,
                                15, 00, 0); // at 3pm in the afternoon (totally arbitrary)

                            ILocalNotification adiln = DependencyService.Get<ILocalNotification>();
                            if (adiln != null)
                            {
                                adiln.ShowNotification(
                                    "VITA Event Sign Up",                   // title
                                    "You have signed up to volunteer",      // subtitle
                                    ne.SiteName + " on " + ne.EventDate.ToString("mmm dd, yyyy"),  // description
                                    ne.WorkItemId.ToString(),               // id
                                    notificationDateTime.ToString("O"),     // date or interval
                                    1,                                      // type = set to date
                                    "");                                    // extra parameters - we have none
                            }

                            ne.NotificationIssued = true;
                        }
                        catch
                        {
                            ne.NotificationIssued = false;
                        }
					}
				}

				// save the updated known events back into the settings storage
				string newKnownEventJsonString = C_NotificationEvent.GetJsonFromList(NewKnownEvents);
				NSUserDefaults.StandardUserDefaults.SetString(newKnownEventJsonString, N_KnownEventsJson);

				Global.LastFetchRunTime = DateTime.Now;

                completionHandler?.Invoke(UIBackgroundFetchResult.NewData);
			});        
        }

        public override void OnResignActivation(UIApplication application)
        {
            // Invoked when the application is about to move from active to inactive state.
            // This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) 
            // or when the user quits the application and it begins the transition to the background state.
            // Games should use this method to pause the game.
        }

        public override void DidEnterBackground(UIApplication application)
        {
            // Use this method to release shared resources, save user data, invalidate timers and store the application state.
            // If your application supports background exection this method is called instead of WillTerminate when the user quits.
        }

        public override void WillEnterForeground(UIApplication application)
        {
            // Called as part of the transiton from background to active state.
            // Here you can undo many of the changes made on entering the background.
        }

        public override void OnActivated(UIApplication application)
        {
            // Restart any tasks that were paused (or not yet started) while the application was inactive. 
            // If the application was previously in the background, optionally refresh the user interface.
        }

        public override void WillTerminate(UIApplication application)
        {
            // Called when the application is about to terminate. Save data, if needed. See also DidEnterBackground.
        }
    }
}

