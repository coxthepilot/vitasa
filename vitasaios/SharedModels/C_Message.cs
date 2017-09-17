using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
//using System.Collections.Generic;
//using System.Text;
//using System.Net.Http;

//using UIKit;
//using System.Linq;
//using Foundation;

namespace zsquared
{
    public class C_Message
    {
        public enum E_Language { Unknown = 0, English, Spanish }

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
			if (!(jv is JsonObject))
				throw new ApplicationException("expecting JsonObject");

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

		public static async Task<C_Message> GetMessage(E_Language language, string slug)
        {
            C_Message msg = null;
            string acceptLanguage = language == E_Language.Spanish ? "es" : "en";

			try
			{
				string submiturl = "/resources/" + slug + "/";

				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");
                wc.Headers.Add(HttpRequestHeader.AcceptLanguage, acceptLanguage);

                string responseString = await wc.DownloadStringTaskAsync(submiturl);

                try
                {
                    JsonValue responseJson = JsonValue.Parse(responseString);
                    // if it parses then it is our success result
                    msg = new C_Message(responseJson);
                }
                catch {}
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
                msg = null;
			}

			return msg;
        }

        public static async Task<bool> AddMessage(string token, C_Message english, C_Message spanish)
        {
            bool success = false;

			string bodyjson = "{ "
				+ "\"" + "slug" + "\" : \"" + english.Slug + "\""
				+ ",\"" + "text_en" + "\" : \"" + EscapeText(english.Text) + "\""
                + ",\"" + "text_es" + "\" : \"" + EscapeText(spanish.Text) + "\""
				+ "}";
            
			try
			{
                string submiturl = "/resources";

				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				string responseString = await wc.UploadStringTaskAsync(submiturl, "POST", bodyjson);

				JsonValue responseJson = JsonValue.Parse(responseString);
				// if it parses then it is our success result

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
				success = false;
			}

			return success;
        }

        private static string EscapeText(string s)
        {
            return s.Replace("\n", "\\n");
        }

		//public async Task<bool> AddMessage(string token)
		//{
  //          string messageLanguage = Language == E_Language.Spanish ? "text_es" : "text_en";
		//	string escapedText = Text.Replace("\n", "\\n");
		//	string bodyjson = "{ "
  //              + "\"" + messageLanguage + "\" : \"" + escapedText + "\""
		//		+ "}";

		//	bool success = false;
		//	try
		//	{
  //              string submiturl = "/resources/" + Slug + "/";

		//		WebClient wc = new WebClient()
		//		{
		//			BaseAddress = C_Vita.VitaCoreUrl
		//		};
		//		wc.Headers.Add(HttpRequestHeader.Cookie, token);
		//		wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
		//		wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

  //              string responseString = await wc.UploadStringTaskAsync(submiturl, "POST", bodyjson);

		//		JsonValue responseJson = JsonValue.Parse(responseString);
		//		// if it parses then it is our success result

		//		success = true;
		//	}
		//	catch (Exception e)
		//	{
  //              Console.WriteLine(e.Message);
		//		success = false;
		//	}

		//	return success;
		//}

		public async Task<bool> UpdateMessage(string token)
		{
			string messageLanguage = Language == E_Language.Spanish ? "text_es" : "text_en";
			string bodyjson = "{ "
				+ "\"" + messageLanguage + "\" : \"" + Text + "\""
				+ "}";

			bool success = false;
			try
			{
				string submiturl = "/resources/" + Slug + "/";
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				string responseString = await wc.UploadStringTaskAsync(submiturl, "PUT", bodyjson);

				JsonValue responseJson = JsonValue.Parse(responseString);
				// if it parses then it is our success result

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
				success = false;
			}

			return success;
		}

		public async Task<bool> RemoveMessage(string token)
		{
			bool success = false;
			try
			{
				string submiturl = "/resources/" + Slug + "/";
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				string responseString = await wc.UploadStringTaskAsync(submiturl, "DELETE", "");

				//string responseString = Encoding.UTF8.GetString(responseBytes);
				//JsonValue responseJson = JsonValue.Parse(responseString);
				// if it parses then it is our success result

				success = true;
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
				success = false;
			}

			return success;
		}
    }
}
