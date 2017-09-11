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
        public List<C_WorkItem> WorkHistoryX;
        public List<C_WorkItem> WorkIntentsX;
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
            WorkHistoryX = new List<C_WorkItem>();
            WorkIntentsX = new List<C_WorkItem>();
            Roles = new List<E_VitaUserRoles>();
            Suggestions = new List<C_Suggestion>();
        }

        public C_VitaUser(int _id, string _email, string _pw)
        {
            id = _id;
            Email = _email;
            Password = _pw;

			WorkHistoryX = new List<C_WorkItem>();
			WorkIntentsX = new List<C_WorkItem>();
			Roles = new List<E_VitaUserRoles>();
			Suggestions = new List<C_Suggestion>();
		}

        public C_VitaUser(JsonValue jv)
        {
            // jv should be a JsonObject

            if (!(jv is JsonObject))
                throw new ApplicationException("expecting JsonObject");

			WorkHistoryX = new List<C_WorkItem>();
			WorkIntentsX = new List<C_WorkItem>();
			Roles = new List<E_VitaUserRoles>();
			Suggestions = new List<C_Suggestion>();

            if (jv.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(jv[N_ID], id);

            if (jv.ContainsKey(N_Name))
                Name = Tools.JsonProcessString(jv[N_Name], Name);

            if (jv.ContainsKey(N_Email))
                Email = Tools.JsonProcessString(jv[N_Email], Email);

            if (jv.ContainsKey(N_Phone))
                Phone = Tools.JsonProcessString(jv[N_Phone], Phone);

            if (jv.ContainsKey(N_Certification))
            {
                string cs = Tools.JsonProcessString(jv[N_Certification], "Unknown");

				Certification = Tools.StringToEnum<E_Certification>(cs);
            }

            if (jv.ContainsKey(N_WorkHistory))
            {
				JsonValue jva = jv[N_WorkHistory]; // should be an array type

				if (!(jva is JsonArray))
					throw new ApplicationException("must be an array type");

				foreach (JsonValue jvav in jva)
				{
                    C_WorkItem wh = new C_WorkItem(jvav);
                    WorkHistoryX.Add(wh);
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
                    WorkIntentsX.Add(wh);
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
		/// Makes the API call to add a Suggestion. If successful, also adds to the User Suggestions list.
		/// </summary>
		/// <returns>true on success</returns>
		/// <param name="sug">suggestion to add</param>
        public async Task<bool> AddSuggestion(C_Suggestion sug)
		{
			string bodyjson = "{ "
                + "\"subject\" : \"" + sug.Subject + "\""
                + ",\"details\" : \"" + sug.Text + "\""
				//+ ",\"from_public\" : \"" + "false" + "\""
				+ "}";

			bool success = false;
			try
			{
				string submiturl = "/suggestions";
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");
				wc.Headers.Add(HttpRequestHeader.Cookie, Token);

                // do the actual web request
                string responseString = await wc.UploadStringTaskAsync(submiturl, "POST", bodyjson);

				// get and parse the response
				JsonValue responseJson = JsonValue.Parse(responseString);

                C_Suggestion nsug = new C_Suggestion(responseJson);

                // add the intent to this users WorkIntent list
                sug.id = nsug.id;
                Suggestions.Add(sug);

				success = true;
			}
			catch (Exception e)
			{
                Console.WriteLine(e.Message);
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

            string escapedText = sug.Text.Replace("\n", "\\n");
			string bodyjson = "{ "
				+ "\"user\" : \"" + id.ToString() + "\""
                + ",\"details\" : \"" + escapedText + "\""
                + ",\"subject\" : \"" + sug.Subject + "\""
				+ "}";

			bool success = false;
			try
			{
				string submiturl = "/suggestions/" + sug.id.ToString();
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, Token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(submiturl, "PUT", bodyjson);

				// get and parse the response
				JsonValue responseJson = JsonValue.Parse(responseString);

                C_Suggestion nsug = new C_Suggestion(responseJson);
				// if it parses then it is our success result

				success = true;
			}
			catch
			{
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

			bool success = false;
			try
			{
				string submiturl = "/suggestions/" + wi.id.ToString();
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, Token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");


				byte[] dataBytes = Encoding.UTF8.GetBytes("");
				// do the actual web request
				byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "DELETE", dataBytes);

				//string responseString = Encoding.UTF8.GetString(responseBytes);
				//JsonValue responseJson = JsonValue.Parse(responseString);
                // if it parses then it is our success result

                // remove this intent from the list
                Suggestions.Remove(wi);

				success = true;
			}
			catch
			{
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

        public static async Task<C_VitaUser> FetchUserX(string token, int id)
        {
			C_VitaUser res = null;
			try
			{
				string usersUrl = "/users/" + id.ToString();
				WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string ss = await wc.DownloadStringTaskAsync(usersUrl);

				JsonValue jv = JsonValue.Parse(ss);

				if (!(jv is JsonObject))
					throw new ApplicationException("must be an object");

				res = new C_VitaUser(jv);
			}
			catch
			{
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
            List<C_VitaUser> res = null;
			try
			{
				string usersUrl = "/users";
				WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrl
                };
                wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string resp = await wc.DownloadStringTaskAsync(usersUrl);

				JsonValue jv = JsonValue.Parse(resp);

				// we are expecting an array
				if (!(jv is JsonArray))
					throw new ApplicationException("must be an array");
                
				res = new List<C_VitaUser>();
				foreach (JsonValue jv1 in jv)
				{
					C_VitaUser vu = new C_VitaUser(jv1);
					res.Add(vu);
				}
			}
			catch
			{
                res = null;
			}

            return res;
		}
	}
}
