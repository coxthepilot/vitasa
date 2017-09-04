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
using Foundation;

namespace zsquared
{
    public enum E_VitaUserRoles { NewUser, SiteCoordinator, SiteCoordinatorInactive, Volunteer, Admin, Unknown }

    public class C_VitaUser
    {
        public int id;
        public string Name;
		public string Email;
        public string Password; // only used on create new user; never sent from the backend
        public string Phone;
        public E_Certification Certification;
        public List<C_WorkItem> WorkHistory;
        public List<C_WorkItem> WorkIntents;
		public List<E_VitaUserRoles> Roles;
        public List<C_Suggestion> Suggestions;

        public string Token; // not saved or restored; from the login headers

        public static readonly string N_ID = "id";
        public static readonly string N_Name = "name";
        public static readonly string N_Email = "email";
        public static readonly string N_Password = "password";
        public static readonly string N_Phone = "phone";
        public static readonly string N_Certification = "certification";
        public static readonly string N_WorkHistory = "work_history";
		public static readonly string N_WorkIntents = "work_intents";
        public static readonly string N_Roles = "roles";
        public static readonly string N_Suggestions = "suggestions";

        public bool HasAdmin
        {
            get
            {
                var or = Roles.Where(r => r == E_VitaUserRoles.Admin);
                return or.Any();
            }
        }

		public bool HasSiteCoordinator
		{
			get
			{
				var or = Roles.Where(r => r == E_VitaUserRoles.SiteCoordinator);
				return or.Any();
			}
		}

		public bool HasVolunteer
		{
			get
			{
				var or = Roles.Where(r => r == E_VitaUserRoles.Volunteer);
				return or.Any();
			}
		}

		public bool HasNewUser
		{
			get
			{
                var or = Roles.Where(r => r == E_VitaUserRoles.NewUser);
				return or.Any();
			}
		}

		public C_VitaUser()
        {
            WorkHistory = new List<C_WorkItem>();
            WorkIntents = new List<C_WorkItem>();
            Roles = new List<E_VitaUserRoles>();
            Suggestions = new List<C_Suggestion>();
        }

        public C_VitaUser(int _id, string _email, string _pw)
        {
            id = _id;
            Email = _email;
            Password = _pw;

			WorkHistory = new List<C_WorkItem>();
			WorkIntents = new List<C_WorkItem>();
			Roles = new List<E_VitaUserRoles>();
			Suggestions = new List<C_Suggestion>();
		}

        public C_VitaUser(JsonValue jv)
        {
            // jv should be a JsonObject

            if (!(jv is JsonObject))
                throw new ApplicationException("expecting JsonObject");

			WorkHistory = new List<C_WorkItem>();
			WorkIntents = new List<C_WorkItem>();
			Roles = new List<E_VitaUserRoles>();
			Suggestions = new List<C_Suggestion>();

			if (jv.ContainsKey(N_ID))
				id = jv[N_ID];

			if (jv.ContainsKey(N_Name))
				Name = jv[N_Name];

			if (jv.ContainsKey(N_Email))
                Email = jv[N_Email];

            if (jv.ContainsKey(N_Phone))
				Phone = jv[N_Phone];

            if (jv.ContainsKey(N_Certification))
                Certification = Tools.StringToEnum<E_Certification>((string)jv[N_Certification]);

            if (jv.ContainsKey(N_WorkHistory))
            {
				JsonValue jva = jv[N_WorkHistory]; // should be an array type

				if (!(jva is JsonArray))
					throw new ApplicationException("must be an array type");

				foreach (JsonValue jvav in jva)
				{
                    C_WorkItem wh = new C_WorkItem(jvav);
                    WorkHistory.Add(wh);
				}
			}

            if (jv.ContainsKey(N_WorkIntents))
            {
				JsonValue jva = jv[N_WorkIntents]; // should be an array type

				if (!(jva is JsonArray))
					throw new ApplicationException("must be an array type");

				foreach (JsonValue jvav in jva)
				{
					C_WorkItem wh = new C_WorkItem(jvav);
                    WorkIntents.Add(wh);
				}
			}

            if (jv.ContainsKey(N_Roles))
            {
                JsonValue jva = jv[N_Roles]; // should be an array type

                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");
                
                foreach (JsonValue jvav in jva)
                {
                    string role_s = jvav;
                    E_VitaUserRoles role_e = Tools.StringToEnum<E_VitaUserRoles>(role_s);
                    Roles.Add(role_e);
                }
            }

            if (jv.ContainsKey(N_Suggestions))
            {
                JsonValue jva = jv[N_Suggestions]; // should be an array type

                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");

                foreach (JsonValue jvav in jva)
                {
                    C_Suggestion s = new C_Suggestion(jvav);
                    Suggestions.Add(s);
                }
            }
		}

        /// <summary>
        /// Makes the API call to add an Intent. If successful, also adds to the User WorkIntents list.
        /// </summary>
        /// <returns>true on success</returns>
        /// <param name="wi">work item to add</param>
        public async Task<bool> AddIntent(C_WorkItem wi)
        {
            string submiturl = C_Vita.VitaCoreUrlSSL + "/users/" + id.ToString() + "/signups/";

            C_Vita.SetupCertificateHandling();

			string bodyjson = "{ "
                + "\"site\" : \"" + wi.SiteSlug + "\""
                + ",\"date\" : \"" + wi.Date.ToString("yyyy-mm-dd") + "\""
				+ "}";

            bool success = false;
			try
			{
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrlSSL
				};
                wc.Headers.Add(HttpRequestHeader.Cookie, Token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);
				// do the actual web request
				byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "POST", dataBytes);
                // get and parse the response
				string responseString = Encoding.UTF8.GetString(responseBytes);
				JsonValue responseJson = JsonValue.Parse(responseString);
                // if it parses then it is our success result

                // add the intent to this users WorkIntent list
                WorkIntents.Add(wi);

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to add intent or response parsing failed: " + e.Message);
                success = false;
			}

			return success;
        }

        /// <summary>
        /// Makes the API call to remove the intent; on success, removes the this users WorkIntents list.
        /// </summary>
        /// <returns>true on success</returns>
        /// <param name="wi">work item to remove</param>
        public async Task<bool> RemoveIntent(C_WorkItem wi)
        {
            if (wi.id == -1)
                throw new ApplicationException("must be an existing id; can't delete one that hasn't been added");
            
            string submiturl = C_Vita.VitaCoreUrlSSL + "/users/" + id.ToString() + "/signups/" + wi.id.ToString();

            C_Vita.SetupCertificateHandling();

            bool success = false;
			try
			{
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, Token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				byte[] dataBytes = Encoding.UTF8.GetBytes("");
				// do the actual web request
				byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "DELETE", dataBytes);

				string responseString = Encoding.UTF8.GetString(responseBytes);
				JsonValue responseJson = JsonValue.Parse(responseString);
                // if it parses then it is our success result

                // remove this intent from the list
                WorkIntents.Remove(wi);

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to remove intent or response parsing failed: " + e.Message);
                success = false;
			}

			return success;
        }

		/// <summary>
		/// Makes the API call to add a Suggestion. If successful, also adds to the User Suggestions list.
		/// </summary>
		/// <returns>true on success</returns>
		/// <param name="sug">suggestion to add</param>
        public async Task<bool> AddSuggestion(C_Suggestion sug)
		{
            string submiturl = C_Vita.VitaCoreUrlSSL + "/suggestions";

            C_Vita.SetupCertificateHandling();

            // todo; needs the subject, date, status, and maybe more
			string bodyjson = "{ "
                + "\"subject\" : \"" + sug.Subject + "\""
                + ",\"details\" : \"" + sug.Text + "\""
				//+ ",\"from_public\" : \"" + "false" + "\""
				+ "}";
			byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);

			WebClient wc = new WebClient()
			{
				BaseAddress = C_Vita.VitaCoreUrlSSL
			};
			wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
			wc.Headers.Add(HttpRequestHeader.Accept, "application/json");
            wc.Headers.Add(HttpRequestHeader.Cookie, Token);

			bool success = false;
			try
			{
				// do the actual web request
				byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "POST", dataBytes);
				// get and parse the response
				string responseString = Encoding.UTF8.GetString(responseBytes);
				JsonValue responseJson = JsonValue.Parse(responseString);
                // if it parses then it is our success result
                C_Suggestion nsug = new C_Suggestion(responseJson);

                // add the intent to this users WorkIntent list
                Suggestions.Add(sug);

				success = true;
			}
			catch (Exception e)
			{
                Console.WriteLine("Attempt to add intent or response parsing failed: " + e.Message);
				success = false;
			}

			return success;
		}

		/// <summary>
		/// Makes the API call to add a Suggestion. If successful, also adds to the User Suggestions list.
		/// </summary>
		/// <returns>true on success</returns>
		/// <param name="sug">suggestion to add</param>
		public async Task<bool> UpdateSuggestion(C_Suggestion sug)
		{
            if (sug.id == -1)
                throw new ApplicationException("can't update a Suggestion that hasn't been submitted yet");
            
            string submiturl = C_Vita.VitaCoreUrlSSL + "/suggestions/" + sug.id.ToString();

            C_Vita.SetupCertificateHandling();

			// todo; needs the subject, date, status, and maybe more
			string bodyjson = "{ "
				+ "\"user\" : \"" + id.ToString() + "\""
                                      + ",\"text\" : \"" + sug.Text + "\""
				+ "}";

			bool success = false;
			try
			{
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, Token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);
				// do the actual web request
				byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "PUT", dataBytes);
				// get and parse the response
				string responseString = Encoding.UTF8.GetString(responseBytes);
				JsonValue responseJson = JsonValue.Parse(responseString);
				// if it parses then it is our success result

				// add the intent to this users WorkIntent list
				Suggestions.Add(sug);

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to add intent or response parsing failed: " + e.Message);
				success = false;
			}

			return success;
		}

		/// <summary>
		/// Makes the API call to remove the Suggestion; on success, removes from this users Suggestions list
		/// </summary>
		/// <returns>True on success</returns>
		/// <param name="wi">Suggestion to remove</param>
        public async Task<bool> RemoveSuggestion(C_Suggestion wi)
		{
			if (wi.id == -1)
				throw new ApplicationException("must be an existing id; can't delete one that hasn't been added");

            string submiturl = C_Vita.VitaCoreUrlSSL + "/suggestions/" + wi.id.ToString();

            C_Vita.SetupCertificateHandling();

			bool success = false;
			try
			{
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, Token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");


				byte[] dataBytes = Encoding.UTF8.GetBytes("");
				// do the actual web request
				byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "DELETE", dataBytes);

				string responseString = Encoding.UTF8.GetString(responseBytes);
				JsonValue responseJson = JsonValue.Parse(responseString);
                // if it parses then it is our success result

                // remove this intent from the list
                Suggestions.Remove(wi);

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to remove intent or response parsing failed: " + e.Message);
				success = false;
			}

			return success;
		}

		public string RolesSummary()
		{
			string res = "";
			foreach (E_VitaUserRoles vur in Roles)
			{
				if (res.Length != 0)
					res += ", ";
				res += vur.ToString();

			}
			return res;
		}

		public static List<C_VitaUser> ImportUsers(JsonValue jv)
        {
            List<C_VitaUser> res = new List<C_VitaUser>();

			if (!(jv is JsonArray))
				throw new ApplicationException("must be an array");
            
			res = new List<C_VitaUser>();
			foreach (JsonValue jv1 in jv)
			{
				C_VitaUser vu = new C_VitaUser(jv1);
				res.Add(vu);
			}

            return res;
		}

        public static async Task<C_VitaUser> FetchUser(string token, int id)
        {
            string usersUrl = C_Vita.VitaCoreUrlSSL + "/users/" + id.ToString();
			C_Vita.SetupCertificateHandling();

			C_VitaUser res = null;

			try
			{
                WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				var data = await wc.DownloadDataTaskAsync(new Uri(usersUrl));

				using (Stream outstream = new MemoryStream())
				{
					await outstream.WriteAsync(data, 0, data.Length);

					outstream.Seek(0, SeekOrigin.Begin);

					// todo: need to handle abritrarily large read responses
					byte[] ba = new byte[10000]; // arbitrary number
					int bytesRead = outstream.Read(ba, 0, 10000);

					string resp = Encoding.UTF8.GetString(ba, 0, bytesRead);

					JsonValue jv = JsonValue.Parse(resp);

					// we are expecting an array
                    if (!(jv is JsonObject))
						throw new ApplicationException("must be an object");
                    
					res = new C_VitaUser(jv);
				}
			}
			catch (Exception e)
			{
				Console.WriteLine("error in download: " + e.Message);
				res = null;
			}

			return res;        
        }

        /// <summary>
        /// Fetchs the users list. Must have admin privilege to run.
        /// </summary>
        /// <returns>The users list.</returns>
        /// <param name="token">Token.</param>
		public static async Task<List<C_VitaUser>> FetchUsersList(string token)
		{
            string usersUrl = C_Vita.VitaCoreUrlSSL + "/users";
            C_Vita.SetupCertificateHandling();

            List<C_VitaUser> res = null;

			try
			{
                WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrlSSL
                };
                wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                var data = await wc.DownloadDataTaskAsync(new Uri(usersUrl));

                using (Stream outstream = new MemoryStream())
                {
                    await outstream.WriteAsync(data, 0, data.Length);

                    outstream.Seek(0, SeekOrigin.Begin);

                    // todo: need to handle abritrarily large read responses
                    byte[] ba = new byte[10000]; // arbitrary number
                    int bytesRead = outstream.Read(ba, 0, 10000);

                    string resp = Encoding.UTF8.GetString(ba, 0, bytesRead);

                    JsonValue jv = JsonValue.Parse(resp);

					// we are expecting an array
					if (!(jv is JsonArray))
						throw new ApplicationException("must be an array");
					res = new List<C_VitaUser>();
                    foreach(JsonValue jv1 in jv)
                    {
                        C_VitaUser vu = new C_VitaUser(jv1);
                        res.Add(vu);
                    }
                }
			}
			catch (Exception e)
			{
				Console.WriteLine("error in download: " + e.Message);
                res = null;
			}

            return res;
		}
	}
}
