using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Linq;

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
        public List<C_SiteCoordinated> SitesCoordinated;

        public string Token; // saved across UI transitions but not in backedn DB (obviously)

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
        public static readonly string N_SitesCoordinated = "sites_coordinated";

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
            SitesCoordinated = new List<C_SiteCoordinated>();
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
            SitesCoordinated = new List<C_SiteCoordinated>();
        }

        public C_VitaUser(JsonValue jv)
        {
#if DEBUG
            if (!(jv is JsonObject))
                throw new ApplicationException("expecting JsonObject");
#endif

            WorkHistoryX = new List<C_WorkItem>();
            WorkIntentsX = new List<C_WorkItem>();
            Roles = new List<E_VitaUserRoles>();
            Suggestions = new List<C_Suggestion>();
            SitesCoordinated = new List<C_SiteCoordinated>();

            if (jv.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(jv[N_ID], id);

            if (jv.ContainsKey(N_Name))
                Name = Tools.JsonProcessString(jv[N_Name], Name);

            if (jv.ContainsKey(N_Email))
                Email = Tools.JsonProcessString(jv[N_Email], Email);

            if (jv.ContainsKey(N_Password))
                Password = Tools.JsonProcessString(jv[N_Password], Password);

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

#if DEBUG
                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");
#endif

                foreach (JsonValue jvav in jva)
                {
                    C_WorkItem wh = new C_WorkItem(jvav);
                    WorkHistoryX.Add(wh);
                }
            }

            if (jv.ContainsKey(N_WorkIntents))
            {
                JsonValue jva = jv[N_WorkIntents]; // should be an array type

#if DEBUG
                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");
#endif

                foreach (JsonValue jvav in jva)
                {
                    C_WorkItem wh = new C_WorkItem(jvav);
                    WorkIntentsX.Add(wh);
                }
            }

            if (jv.ContainsKey(N_Roles))
            {
                JsonValue jva = jv[N_Roles]; // should be an array type

#if DEBUG
                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");
#endif

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

#if DEBUG
                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");
#endif

                foreach (JsonValue jvav in jva)
                {
                    C_Suggestion s = new C_Suggestion(jvav);
                    Suggestions.Add(s);
                }
            }

            if (jv.ContainsKey(N_SitesCoordinated))
            {
                JsonValue jva = jv[N_SitesCoordinated]; // should be an array type

#if DEBUG
                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");
#endif

                foreach (JsonValue jvav in jva)
                {
                    C_SiteCoordinated s = new C_SiteCoordinated(jvav);
                    SitesCoordinated.Add(s);
                }
            }

            if (jv.ContainsKey(N_Token))
                Token = Tools.JsonProcessString(jv[N_Token], Token);
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

#if DEBUG
            if (!(jv is JsonArray))
                throw new ApplicationException("must be an array");
#endif

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

#if DEBUG
                if (!(jv is JsonObject))
                    throw new ApplicationException("must be an object");
#endif

                res = new C_VitaUser(jv);
            }
            catch (Exception ex)
            {
#if DEBUG
                Console.WriteLine(ex.Message);
#endif
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

#if DEBUG
                // we are expecting an array
                if (!(jv is JsonArray))
                    throw new ApplicationException("must be an array");
#endif

                res = new List<C_VitaUser>();
                foreach (JsonValue jv1 in jv)
                {
                    C_VitaUser vu = new C_VitaUser(jv1);
                    res.Add(vu);
                }
            }
            catch (Exception ex)
            {
#if DEBUG
                Console.WriteLine(ex.Message);
#endif
                res = null;
            }

            return res;
        }

        /// <summary>
        /// Only updates the user name, phone, and certification
        /// </summary>
        /// <returns>The user profile.</returns>
        /// <param name="token">Token.</param>
        public async Task<bool> UpdateUserProfile(string token)
        {
            string bodyjson = "{ "
                + "\"" + N_Name + "\" : \"" + Name + "\""
                + ","
                + "\"" + N_Phone + "\" : \"" + Phone + "\""
                + ","
                + "\"" + N_Certification + "\" : \"" + Certification.ToString() + "\""
                + "}";

            bool success = false;
            try
            {
                string submiturl = "/users/" + id.ToString();
                WebClient wc = new WebClient()
                {
                    BaseAddress = C_Vita.VitaCoreUrl
                };
                wc.Headers.Add(HttpRequestHeader.Cookie, token);
                wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(submiturl, "PUT", bodyjson);

#if DEBUG
                JsonValue responseJson = JsonValue.Parse(responseString);
                C_VitaUser userx = new C_VitaUser(responseJson);
                if ((Name != userx.Name)
                    || (Phone != userx.Phone)
                    || (Certification != userx.Certification))
                    throw new ApplicationException("updated items failed to udpate");
#endif

                success = true;
            }
            catch (Exception e)
            {
#if DEBUG
                Console.WriteLine(e.Message);
#endif
                success = false;
			}

			return success;
		}
	}
}
