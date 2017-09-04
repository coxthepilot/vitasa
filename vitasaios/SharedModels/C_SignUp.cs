using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using UIKit;
using System.Linq;

namespace zsquared
{
    public class C_SignUp
    {
        /// <summary>
        /// ID for this record in the SignUp DB
        /// </summary>
        public int id;
        /// <summary>
        /// The ID of the user that is signing up.
        /// </summary>
		public int UserID;
        /// <summary>
        /// The name of the site that the user is signing up for
        /// </summary>
		public string SiteSlug;
        /// <summary>
        /// The Date on which the Volunteer is signing up
        /// </summary>
        public C_YMD Date;
        /// <summary>
        /// The number of hours that the Volunteer worked. The value is 
        /// provisional until Approved.
        /// </summary>
        public float Hours;
        /// <summary>
        /// True when the Hours for this Volunteer are approved. The Hours value
        /// should not be changed when Approved is true.
        /// </summary>
        public bool Approved;

        public static readonly string N_ID = "id";
        public static readonly string N_UserID = "userid";
        public static readonly string N_SiteSlug = "siteslug";
        public static readonly string N_Date = "date";
        public static readonly string N_Hours = "hours";
        public static readonly string N_Approved = "approved";

        public C_SignUp()
        {
            id = -1;
            Hours = 4;
            Approved = false;
        }

		public C_SignUp(JsonValue j)
		{
			if (!(j is JsonObject))
				throw new ApplicationException("we can only work with an object");

			if (j.ContainsKey(N_ID))
				id = j[N_ID];

            if (j.ContainsKey(N_UserID))
                UserID = j[N_UserID];

            if (j.ContainsKey(N_SiteSlug))
                SiteSlug = j[N_SiteSlug];

            if (j.ContainsKey(N_Date))
            {
                string ds = j[N_Date];
                Date = new C_YMD(ds);
            }

			if (j.ContainsKey(N_Hours))
                Hours = j[N_Hours];

            if (j.ContainsKey(N_Approved))
            {
                string bs = j[N_Approved];
                Approved = bs.ToLower() == "true";
            }
		}

        public string GetJson()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{[");

            sb.Append("{" + N_ID + " : " + id.ToString() + "},"
                      + "{" + N_UserID + " : " + UserID.ToString() + "},"
                      + "{" + N_SiteSlug + " : " + SiteSlug + "},"
                      + "{" + N_Date + " : " + Date.ToString("yyyy-mm-dd") + "},"
                      + "{" + N_Hours + " : " + Hours.ToString() + "},"
                      + "{" + N_Approved + " : " + (Approved ? "true" : "false") + "}"
                     );

            sb.Append("]}");

            return sb.ToString();
        }

        public static List<C_SignUp> ImportSignUps(JsonValue json)
		{
			if (!(json is JsonArray))
				throw new ApplicationException("the sites list must be an array");

			// create the holding place for the results
			List<C_SignUp> res = new List<C_SignUp>();
			foreach (JsonValue j in json)
			{
				C_SignUp vs = new C_SignUp(j);
				res.Add(vs);
			}

			return res;
		}

        /// <summary>
        /// Fetchs the sign ups list based on site and user (both optional)
        /// </summary>
        /// <returns>The sign ups list.</returns>
        /// <param name="token">Token. Required</param>
        /// <param name="userid">Userid. -1 is ignore</param>
        /// <param name="siteSlug">Site slug. null is ignore</param>
        /// <param name="from">From. null is ignore</param>
        /// <param name="to">To. null is ignore</param>
        public static async Task<List<C_SignUp>> FetchSignUpsList(string token, int userid, string siteSlug, C_YMD from, C_YMD to)
		{
            //vitavol.AppDelegate myAppDelegate = (vitavol.AppDelegate)UIApplication.SharedApplication.Delegate;
            //C_TestingDB testingDB = myAppDelegate.TestingDB;
            //if (testingDB != null)
            //{
            //             List<C_SignUp> res = new List<C_SignUp>();

            //             foreach(C_SignUp su in testingDB.SignUps)
            //             {
            //                 if (
            //                        ((userid == -1) || (su.UserID == userid)) 
            //                     && ((siteSlug == null) || (su.SiteSlug == siteSlug))
            //                     && ((from == null) || (su.Date >= from)) 
            //                     && ((to == null) || (su.Date <= to))
            //                 )
            //                     res.Add(su);
            //             }

            //	return res;
            //}

            throw new ApplicationException("not implemented");

		}

        /// <summary>
        /// Add or update a SignUp in the DB.
        /// </summary>
        /// <returns>True if successful</returns>
        /// <param name="token">Token from the login</param>
        public async Task<bool> UpdateOrAddSignUp(string token)
		{
			//vitavol.AppDelegate myAppDelegate = (vitavol.AppDelegate)UIApplication.SharedApplication.Delegate;
			//C_TestingDB testingDB = myAppDelegate.TestingDB;
			//if (testingDB != null)
			//{
   //             // id of -1 means new item
   //             if (id == -1)
   //             {
   //                 // get the highest id, add 1, and insert into the db
   //                 int highestID = -1;
   //                 foreach (C_SignUp su in testingDB.SignUps)
   //                     if (su.id > highestID) highestID = su.id;
   //                 highestID++;
   //                 id = highestID;
   //                 testingDB.SignUps.Add(this);
   //             }

			//	return true;
			//}

            throw new ApplicationException("not implemented");


		}

        /// <summary>
        /// Removes this sign up from the system.
        /// </summary>
        /// <returns>true if successful</returns>
        /// <param name="token">Token.</param>
		public async Task<bool> RemoveSignUp(string token)
		{
			//vitavol.AppDelegate myAppDelegate = (vitavol.AppDelegate)UIApplication.SharedApplication.Delegate;
			//C_TestingDB testingDB = myAppDelegate.TestingDB;
			//if (testingDB != null)
			//{
   //             testingDB.SignUps.Remove(this);

			//	return true;
			//}

			throw new ApplicationException("not implemented");

		}

		public static List<C_SignUp> SignUpsForSiteOnDate(C_YMD ymd, string siteSlug, List<C_SignUp> signupList)
		{
			List<C_SignUp> res = new List<C_SignUp>();

			foreach (C_SignUp su in signupList)
			{
                if ((su.SiteSlug == siteSlug) && (su.Date == ymd))
					res.Add(su);
			}

			return res;
		}

  //      public static C_WorkItem GetSignUpForUserOnDate(C_YMD ymd, C_VitaUser u, List<C_VitaSite> sites)
		//{
		//	C_WorkItem res = null;

  //          foreach (C_VitaSite site in sites)
		//	{
  //              foreach(C_WorkItem wi in site.WorkIntents)
  //              {
  //                  if (wi.)
  //              }
		//	}

		//	return res;
		//}

		public static int CompareSignUpByDateAscending(C_SignUp s1, C_SignUp s2)
		{
            return s1.Date.CompareTo(s2.Date);
		}

		public static int CompareSignUpByDateDescending(C_SignUp s1, C_SignUp s2)
		{
			return s2.Date.CompareTo(s1.Date);
		}
	}
}
