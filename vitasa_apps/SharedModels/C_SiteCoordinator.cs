using System;
using System.Json;

namespace zsquared
{
    public class C_SiteCoordinator
    {
        public int UserId;
        public string Email;

        public static readonly string N_Id = "id";
        public static readonly string N_Email = "email";

        public C_SiteCoordinator(JsonValue jv)
        {
            if (!(jv is JsonObject))
                return;

            if (jv.ContainsKey(N_Id))
                UserId = Tools.JsonProcessInt(jv[N_Id], UserId);

            if (jv.ContainsKey(N_Email))
                Email = Tools.JsonProcessString(jv[N_Email], Email);
        }

        public C_SiteCoordinator(C_VitaUser user)
        {
            UserId = user.id;
            Email = user.Email;
        }

        public string ToJson()
        {
            C_JsonBuilder jb = new C_JsonBuilder();

            jb.Add(UserId, N_Id);
            //jb.Add(Email, N_Email);

            return jb.ToString();
        }
    }
}
