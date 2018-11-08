using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace zsquared
{
    public enum E_Certification { None, Basic, Advanced, Unknown }
    public enum E_VitaUserRoles { None, SiteCoordinator, Volunteer, Admin, Mobile, Unknown, All }

    public class C_VitaUser
    {
        public int id;          // the user's id
        public string Name;     // user name
        public string Email;    // user email
        public string Password; // user password; never returned, only provided on PUT or POST
        public string Phone;    // user phone
        public E_Certification Certification;   // certification level for this user
        public List<E_VitaUserRoles> Roles;     // roles assigned to this user
        public List<C_SiteCoordinated> SitesCoordinated;    // list of sites coordinated by this user
        public List<C_WorkLogItem> WorkItems; // list of this users work items
        public List<string> PreferredSiteSlugs; // the list of preferred sites for this user
        public bool SubscribeMobile; // true if a member of a mobile team (and therefore will get notifications on mobile sites)
        public bool SubscribePreferred; // true if the user wants notifications on changes to preferred sites
        public bool SubscribeEmailFeedback;
        public bool SubscribeEmailNewUser;

        public string Token; // saved across UI transitions, provided by the backend

        public bool Flag; // not saved; used to know the switch state for this user
        public bool IV_Flag; // not save, initial value of Flag
        public bool Dirty; // not saved; used to know if the data has been modified

        public const string N_ID = "id";
        public const string N_Name = "name";
        public const string N_Email = "email";
        public const string N_Password = "password";
        public const string N_PasswordConfirmation = "password_confirmation";
        public const string N_Phone = "phone";
        public const string N_Certification = "certification";
        public const string N_Roles = "roles";
        public const string N_SitesCoordinated = "sites_coordinated";
        public const string N_Token = "token";
        public const string N_WorkItems = "workitems";
        public const string N_PreferredSites = "preferredsites";
        public const string N_SubscribeMobile = "subscribemobile";
        public const string N_SubscribePreferred = "subscribepreferred";
        public const string N_SubscribeEmailNewUser = "subscribenewuser";
        public const string N_SubscribeEmailFeedback = "subscribefeedback";

        /// <summary>
        /// Returns true if this user has admin privilidge.
        /// </summary>
        /// <value><c>true</c> if has admin; otherwise, <c>false</c>.</value>
        public bool HasAdmin
        {
            get
            {
                return Roles.Contains(E_VitaUserRoles.Admin);
                //var or = Roles.Where(r => r == E_VitaUserRoles.Admin);
                //return or.Any();
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
                return Roles.Contains(E_VitaUserRoles.SiteCoordinator);
                //var or = Roles.Where(r => r == E_VitaUserRoles.SiteCoordinator);
                //return or.Any();
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
                return Roles.Contains(E_VitaUserRoles.Volunteer);
                //var or = Roles.Where(r => r == E_VitaUserRoles.Volunteer);
                //return or.Any();
            }
        }

        /// <summary>
        /// Returns true if this use is still flagged as a new user (awaiting approval from bak office)
        /// </summary>
        /// <value><c>true</c> if has new user; otherwise, <c>false</c>.</value>
        public bool HasMobile
        {
            get
            {
                return Roles.Contains(E_VitaUserRoles.Mobile);
                //var or = Roles.Where(r => r == E_VitaUserRoles.Mobile);
                //return or.Any();
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

            Roles = new List<E_VitaUserRoles>();
            SitesCoordinated = new List<C_SiteCoordinated>();
            WorkItems = new List<C_WorkLogItem>();
            PreferredSiteSlugs = new List<string>();

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

            if (jv.ContainsKey(N_SubscribeMobile))
                SubscribeMobile = Tools.JsonProcessBool(jv[N_SubscribeMobile], SubscribeMobile);

            if (jv.ContainsKey(N_SubscribePreferred))
                SubscribePreferred = Tools.JsonProcessBool(jv[N_SubscribePreferred], SubscribePreferred);

            if (jv.ContainsKey(N_SubscribeEmailNewUser))
                SubscribeEmailNewUser = Tools.JsonProcessBool(jv[N_SubscribeEmailNewUser], SubscribeEmailNewUser);

            if (jv.ContainsKey(N_SubscribeEmailFeedback))
                SubscribeEmailFeedback = Tools.JsonProcessBool(jv[N_SubscribeEmailFeedback], SubscribeEmailFeedback);

            if (jv.ContainsKey(N_Certification))
            {
                string cs = Tools.JsonProcessString(jv[N_Certification], "Unknown");
                Certification = Tools.StringToEnum<E_Certification>(cs);
            }

            if (jv.ContainsKey(N_WorkItems))
            {
                JsonValue jva = jv[N_WorkItems];

                foreach(JsonValue jvav in jva)
                {
                    C_WorkLogItem wi = new C_WorkLogItem(jvav);
                    WorkItems.Add(wi);
                }
            }

            if (jv.ContainsKey(N_PreferredSites))
            {
                JsonValue jva = jv[N_PreferredSites];

                foreach (JsonValue jvav in jva)
                {
                    string pss = Tools.JsonProcessString(jvav, null);
                    if (!string.IsNullOrWhiteSpace(pss))
                        PreferredSiteSlugs.Add(pss);
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

        public C_VitaUser()
        {
            Roles = new List<E_VitaUserRoles>();
            SitesCoordinated = new List<C_SiteCoordinated>();
            WorkItems = new List<C_WorkLogItem>();
            PreferredSiteSlugs = new List<string>();
        }

        public string ToJson()
        {
            C_JsonBuilder jb = new C_JsonBuilder();

            jb.Add(id, N_ID);
            jb.Add(Name, N_Name);
            jb.Add(Email, N_Email);
            jb.Add(Phone, N_Phone);
            jb.Add(Certification.ToString(), N_Certification);
            jb.Add(SubscribeMobile, N_SubscribeMobile);
            jb.Add(SubscribeEmailNewUser, N_SubscribeEmailNewUser);
            jb.Add(SubscribeEmailFeedback, N_SubscribeEmailFeedback);

            if (!string.IsNullOrWhiteSpace(Password))
            {
                jb.Add(Password, N_Password);
                jb.Add(Password, N_PasswordConfirmation);
            }

            jb.StartArray(N_Roles);
            foreach (E_VitaUserRoles role in Roles)
                jb.AddArrayElement(role.ToString());
            jb.EndArray();

            jb.StartArray(N_SitesCoordinated);
            foreach (C_SiteCoordinated sc in SitesCoordinated)
                jb.AddArrayObject(sc.ToJson());
            jb.EndArray();

            jb.StartArray(N_PreferredSites);
            foreach (string ps in PreferredSiteSlugs)
                jb.AddArrayObject(ps);
            jb.EndArray();

            return jb.ToString();
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

        public override string ToString()
        {
            return Name;
        }

        public static int CompareByName(C_VitaUser u1, C_VitaUser u2)
        {
            return string.Compare(u1.Name, u2.Name, StringComparison.Ordinal);
        }

        public static int CompareByNameToLower(C_VitaUser u1, C_VitaUser u2)
        {
            return string.Compare(u1.Name.ToLower(), u2.Name.ToLower(), StringComparison.Ordinal);
        }

	}
}
