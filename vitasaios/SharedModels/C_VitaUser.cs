using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;

namespace zsquared
{
    public enum E_VitaUserRoles { NewUser, SiteCoordinator, SiteCoordinatorInactive, User, Admin, Unknown }

    public class C_VitaUser
    {
        public int id;
		public string email;
		public string password;
		public List<E_VitaUserRoles> Permissions;
        public string ManagingRegion;

        public static readonly string N_ID = "id";
        public static readonly string N_Email = "email";
        public static readonly string N_Password = "password";
        public static readonly string N_Permissions = "permissions";
        public static readonly string N_ManagingRegion = "managingregion";

        public bool HasAdmin
        {
            get
            {
                bool res = false;
                foreach(E_VitaUserRoles vr in Permissions)
                {
                    if (vr == E_VitaUserRoles.Admin)
                    {
                        res = true;
                        break;
                    }
                }

                return res;
            }
        }

		public bool HasSiteCoordinator
		{
			get
			{
				bool res = false;
				foreach (E_VitaUserRoles vr in Permissions)
				{
                    if (vr == E_VitaUserRoles.SiteCoordinator)
					{
						res = true;
						break;
					}
				}

				return res;
			}
		}

		public bool HasUser
		{
			get
			{
				bool res = false;
				foreach (E_VitaUserRoles vr in Permissions)
				{
                    if (vr == E_VitaUserRoles.User)
					{
						res = true;
						break;
					}
				}

				return res;
			}
		}

		public C_VitaUser()
        {
            Permissions = new List<E_VitaUserRoles>();
        }

        public C_VitaUser(int _id, string _email, string _pw)
        {
            id = _id;
            email = _email;
            password = _pw;
            Permissions = new List<E_VitaUserRoles>();
        }

        public C_VitaUser(JsonValue jv)
        {
            // jv should be a JsonObject

            if (!(jv is JsonObject))
                throw new ApplicationException("expecting JsonObject");

            Permissions = new List<E_VitaUserRoles>();

            if (jv.ContainsKey(N_Email))
                email = jv[N_Email];
            
            if (jv.ContainsKey(N_Password))
                password = jv[N_Password]; // should not get this one, but just in case
            
            if (jv.ContainsKey(N_ID))
                password = jv[N_ID];

            if (jv.ContainsKey(N_ManagingRegion))
                ManagingRegion = jv[N_ManagingRegion];

			if (jv.ContainsKey(N_Permissions))
            {
                JsonValue jva = jv[N_Permissions]; // should be an array type

                if (!(jva is JsonArray))
                    throw new ApplicationException("must be an array type");
                
                foreach (JsonValue jvav in jva)
                {
                    string role_s = jvav;
                    E_VitaUserRoles role_e = Tools.StringToEnum<E_VitaUserRoles>(role_s);
                    Permissions.Add(role_e);
                }
            }
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

		public static async Task<List<C_VitaUser>> FetchUsersList(string token)
		{
			string usersUrl = C_Vita.VitaCoreUrl + "/users";
            List<C_VitaUser> res = null;

			try
			{
				WebClient wc = new WebClient();
				wc.BaseAddress = C_Vita.VitaCoreUrl;
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

        public string RolesSummary()
        {
            string res = "";
            foreach (E_VitaUserRoles vur in Permissions)
            {
                if (res.Length != 0)
                    res += ", ";
                res += vur.ToString();

			}
            return res;
        }
	}
}
