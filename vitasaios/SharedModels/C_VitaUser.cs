using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;

//using UIKit;
using System.Linq;
//using Foundation;

namespace zsquared
{
    public enum E_VitaUserRoles { NewUser, SiteCoordinator, SiteCoordinatorInactive, Volunteer, Admin, Unknown }

    public class C_VitaUser
    {
        public readonly int id;
        public readonly string Name;
		public readonly string Email;
        public string Password; // only used on create new user; never sent from the backend
        public readonly string Phone;
        public readonly E_Certification Certification;
        public List<C_WorkItem> WorkHistoryX;
        public List<C_WorkItem> WorkIntentsX;
		public List<E_VitaUserRoles> Roles;
        public List<C_Suggestion> Suggestions;

        public string Token; // saved across UI transitions

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
        public static readonly string N_Token = "token";

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

            if (jv.ContainsKey(N_Token))
                Token = Tools.JsonProcessString(jv[N_Token], Token);

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

        public string GetJson()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("{");

            sb.Append("\"" + N_ID + "\" : \"" + id.ToString() + "\"");
			sb.Append(",");
			sb.Append("\"" + N_Name + "\" : \"" + Name + "\"");
			sb.Append(",");
			sb.Append("\"" + N_Email + "\" : \"" + Email + "\"");
			sb.Append(",");
			sb.Append("\"" + N_Password + "\" : \"" + Password + "\"");
			sb.Append(",");
			sb.Append("\"" + N_Phone + "\" : \"" + Phone + "\"");
			sb.Append(",");
            sb.Append("\"" + N_Certification + "\" : \"" + Certification.ToString() + "\"");

			sb.Append(",");
            sb.Append("\"" + N_Roles + "\" : [");
            for (int ix = 0; ix != Roles.Count; ix++)
            {
                if (ix != 0) sb.Append(",");
                sb.Append("\"" + Roles[ix].ToString() + "\"");
            }
            sb.Append("]");

			sb.Append(",");
            sb.Append("\"" + N_Suggestions + "\" : [");
            for (int ix = 0; ix != Suggestions.Count; ix++)
			{
				if (ix != 0) sb.Append(",");
                sb.Append("\"" + Suggestions[ix].GetJson() + "\"");
			}
			sb.Append("]");

			sb.Append(",");
            sb.Append("\"" + N_Token + "\" : \"" + Token + "\"");

			sb.Append("}");

			return sb.ToString();
        }

        public override bool Equals(System.Object obj)
        {
			if (obj == null)
				return false;

            C_VitaUser g = obj as C_VitaUser;
			if ((System.Object)g == null)
				return false;

			bool res = true;

            res &= id == g.id;
            if (Name != null)
                res &= Name == g.Name;
            if (Email != null)
                res &= Email == g.Email;
            if (Password != null)
                res &= Password == g.Password;
            if (Phone != null)
                res &= Phone == g.Phone;
            res &= Certification == g.Certification;
            res &= Roles.Count == g.Roles.Count;
            foreach (E_VitaUserRoles r in Roles)
                res &= g.Roles.Contains(r);
            res &= Suggestions.Count == g.Suggestions.Count;
            for (int ix = 0; ix != Suggestions.Count; ix ++)
                res &= Suggestions[ix] == g.Suggestions[ix];
            if (Token != null)
                res &= Token == g.Token;

			return res;
		}

        public static bool operator ==(C_VitaUser a, C_VitaUser b)
		{
			// If both are null, or both are same instance, return true.
			if (System.Object.ReferenceEquals(a, b))
			{
				return true;
			}

			// If one is null, but not both, return false.
			if (((object)a == null) || ((object)b == null))
			{
				return false;
			}

            // Return true if the fields match:
            return a.Equals(b);
		}

		public static bool operator !=(C_VitaUser a, C_VitaUser b)
		{
			return !(a == b);
		}        

        public override int GetHashCode()
        {
			int hash = 269;
			hash = (hash * 47) * id.GetHashCode();
			hash = (hash * 47) * Name.GetHashCode();
            hash = (hash * 47) * Email.GetHashCode();
            hash = (hash * 47) * Phone.GetHashCode();
            hash = (hash * 47) * Certification.GetHashCode();

			return hash;
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
