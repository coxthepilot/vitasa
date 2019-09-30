using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;

namespace zsquared
{
	public enum E_Message { Unknown = 0, BeforeYoGo, Resources, About, BecomeAVolunteer, Using211, MyFreeTaxes }

	public enum E_Language { Unknown = 0, English, Spanish }

	public class C_Message
    {

        public int id;
        public string Slug;
        public string Text;
        public E_Language Language;

        public static readonly string N_ID = "id";
        public static readonly string N_Slug = "messageslug";
        public static readonly string N_Text = "text";
        public static readonly string N_Language = "language";

        public C_Message(string slug, string text, E_Language language)
        {
            id = -1;
            Slug = slug;
            Text = text;
            Language = language;
        }

        public C_Message(JsonValue jv)
        {
            if (jv.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(jv[N_ID], id);

            if (jv.ContainsKey(N_Slug))
                Slug = Tools.JsonProcessString(jv[N_Slug], Slug);

            if (jv.ContainsKey(N_Text))
                Text = Tools.JsonProcessString(jv[N_Text], Text);

            if (jv.ContainsKey(N_Language))
            {
                string es = Tools.JsonProcessString(jv[N_Language], E_Language.Unknown.ToString());
                Language = Tools.StringToEnum<E_Language>(es);
            }
        }

        public static readonly string Slug_BeforeYouGo = "before-you-go";
        public static readonly string Slug_Resources = "community-resources";
        public static readonly string Slug_About = "about";
        public static readonly string Slug_BecomeAVolunteer = "become-a-volunteer";
        public static readonly string Slug_Using211 = "using-211";
        public static readonly string Slug_MyFreeTaxes = "my-free-taxes";

        public static string SlugForMessage(E_Message msg)
        {
            string res = null;
            switch (msg)
            {
                case E_Message.BeforeYoGo:
                    res = Slug_BeforeYouGo;
                    break;
                case E_Message.Resources:
                    res = Slug_Resources;
                    break;
                case E_Message.About:
                    res = Slug_About;
                    break;
                case E_Message.BecomeAVolunteer:
                    res = Slug_BecomeAVolunteer;
                    break;
                case E_Message.Using211:
                    res = Slug_Using211;
                    break;
                case E_Message.MyFreeTaxes:
                    res = Slug_MyFreeTaxes;
                    break;
            }

            return res;
        }

    }
}
