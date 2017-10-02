using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

namespace zsquared
{
    public enum E_VitaUserRoles { NewUser, SiteCoordinator, SiteCoordinatorInactive, Volunteer, Admin, Unknown }

    public class C_VitaUser
    {
        /// <summary>
        /// This users ID. Most other structures simply refer to the user id rather than name or keep a 
        /// copy of the user structure.
        /// </summary>
        public int id;
        /// <summary>
        /// The users name.
        /// </summary>
        public string Name;
        /// <summary>
        /// The users email (and their login credential)
        /// </summary>
        public string Email;
        /// <summary>
        /// The users password; only used on creating a new user
        /// </summary>
        public string Password;
        /// <summary>
        /// The users phone
        /// </summary>
        public string Phone;
        /// <summary>
        /// The certification level for this user
        /// </summary>
        public E_Certification Certification;
        /// <summary>
        /// The work history for this user. This field will normally be emtpy since the functions that
        /// read the history copy them to a general store and remove from here.
        /// </summary>
        public List<C_WorkItem> WorkHistoryX;
		/// <summary>
		/// The work intents for this user. This field will normally be emtpy since the functions that
		/// read the history copy them to a general store and remove from here.
		/// </summary>
		public List<C_WorkItem> WorkIntentsX;
        /// <summary>
        /// The roles assigned to this user.
        /// </summary>
        public List<E_VitaUserRoles> Roles;
        /// <summary>
        /// The suggestions created by this user.
        /// </summary>
        public List<C_Suggestion> Suggestions;
        /// <summary>
        /// The list of sites that this person is either a primary or back site coordinator for.
        /// </summary>
        public List<C_SiteCoordinated> SitesCoordinated;

        public string Token; // saved across UI transitions but not in backend DB

        public const string N_ID = "id";
        public const string N_Name = "name";
        public const string N_Email = "email";
        public const string N_Password = "password";
        public const string N_Phone = "phone";
        public const string N_Certification = "certification";
        public const string N_WorkHistory = "work_history";
        public const string N_WorkIntents = "work_intents";
        public const string N_Roles = "roles";
        public const string N_Suggestions = "suggestions";
        public const string N_Token = "token";
        public const string N_SitesCoordinated = "sites_coordinated";

        /// <summary>
        /// Returns true if this user has admin privilidge.
        /// </summary>
        /// <value><c>true</c> if has admin; otherwise, <c>false</c>.</value>
        public bool HasAdmin
        {
            get
            {
                var or = Roles.Where(r => r == E_VitaUserRoles.Admin);
                return or.Any();
            }
        }

        /// <summary>
        /// Returns true if this user has site coordinator privilidge (either primary or backup)
        /// </summary>
        /// <value><c>true</c> if has site coordinator; otherwise, <c>false</c>.</value>
        public bool HasSiteCoordinator
        {
            get
            {
                var or = Roles.Where(r => r == E_VitaUserRoles.SiteCoordinator);
                return or.Any();
            }
        }

        /// <summary>
        /// Returns true if this user has volunteer privilidge
        /// </summary>
        /// <value><c>true</c> if has volunteer; otherwise, <c>false</c>.</value>
        public bool HasVolunteer
        {
            get
            {
                var or = Roles.Where(r => r == E_VitaUserRoles.Volunteer);
                return or.Any();
            }
        }

        /// <summary>
        /// Returns true if this use is still flagged as a new user (awaiting approval from bak office)
        /// </summary>
        /// <value><c>true</c> if has new user; otherwise, <c>false</c>.</value>
        public bool HasNewUser
        {
            get
            {
                var or = Roles.Where(r => r == E_VitaUserRoles.NewUser);
                return or.Any();
            }
        }

        /// <summary>
        /// Create an instance of a user populated from the Json values. This is the normal
        /// path for populating from the backend.
        /// </summary>
        /// <param name="jv">Jv.</param>
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

        /// <summary>
        /// Returns a string representing the roles for this user.
        /// </summary>
        /// <returns>The summary.</returns>
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

        /// <summary>
        /// Only updates the user name, phone, and certification
        /// </summary>
        /// <returns>The user profile.</returns>
        /// <param name="token">Token.</param>
        public async Task<bool> UpdateUserProfile(string token)
        {
			int retryCount = 0;
			bool retry = false;

			bool success = false;
            do
            {
                try
                {
                    retry = false;
                    string bodyjson = "{ "
                        + "\"" + N_Name + "\" : \"" + Name + "\""
                        + ","
                        + "\"" + N_Phone + "\" : \"" + Phone + "\""
                        + ","
                        + "\"" + N_Certification + "\" : \"" + Certification.ToString() + "\""
                        + "}";

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
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						success = false;
						retry = retryCount < 3;
						retryCount++;
					}
				}
				catch (Exception e)
                {
#if DEBUG
                    Console.WriteLine(e.Message);
#endif
                    success = false;
                }
            }
            while (retry);

			return success;
		}
	}
}
