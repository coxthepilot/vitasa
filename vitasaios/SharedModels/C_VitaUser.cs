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
        public int id;          // the user's id
        public string Name;     // user name
        public string Email;    // user email
        public string Password; // user password; never returned, only provided on PUT or POST
        public string Phone;    // user phone
        public E_Certification Certification;   // certification level for this user
        public List<C_SignUp> WorkHistoryX;     // signups history
        public List<C_SignUp> WorkIntentsX;     // signups pending
        public List<E_VitaUserRoles> Roles;     // roles assigned to this user
        public List<C_Suggestion> Suggestions;  // suggestions created by this user
        public List<C_SiteCoordinated> SitesCoordinated;    // list of sites coordinated by this user

        public string Token; // saved across UI transitions, provided by the backend

        public const string N_ID = "id";
        public const string N_Name = "name";
        public const string N_Email = "email";
        public const string N_Password = "password";
        public const string N_PasswordConfirmation = "password_confirmation";
        public const string N_Phone = "phone";
        public const string N_Certification = "certification";
        public const string N_WorkHistory = "work_history";
        public const string N_WorkIntents = "work_intents";
        public const string N_Roles = "roles";
        public const string N_Suggestions = "suggestions";
        public const string N_SitesCoordinated = "sites_coordinated";
        public const string N_Token = "token";

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
            if (!(jv is JsonObject))
                return;

            WorkHistoryX = new List<C_SignUp>();
            WorkIntentsX = new List<C_SignUp>();
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

                foreach (JsonValue jvav in jva)
                {
                    C_SignUp wh = new C_SignUp(jvav);
                    WorkHistoryX.Add(wh);
                }
            }

            if (jv.ContainsKey(N_WorkIntents))
            {
                JsonValue jva = jv[N_WorkIntents]; // should be an array type

                foreach (JsonValue jvav in jva)
                {
                    C_SignUp wh = new C_SignUp(jvav);
                    WorkIntentsX.Add(wh);
                }
            }

            if (jv.ContainsKey(N_Roles))
            {
                JsonValue jva = jv[N_Roles]; // should be an array type

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

                foreach (JsonValue jvav in jva)
                {
                    C_Suggestion s = new C_Suggestion(jvav);
                    Suggestions.Add(s);
                }
            }

            if (jv.ContainsKey(N_SitesCoordinated))
            {
                JsonValue jva = jv[N_SitesCoordinated]; // should be an array type

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


	}
}
