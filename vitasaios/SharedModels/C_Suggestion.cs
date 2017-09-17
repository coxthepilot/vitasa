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

namespace zsquared
{
    public enum E_SuggestionStatus { Open, Closed, WontFix, InProgress, Unknown }

    public class C_Suggestion
    {
        public readonly int id;
        public readonly int UserId;
        public string Subject;
        public string Text;
        public readonly C_YMD Date;
        public E_SuggestionStatus Status;
        public readonly bool FromPublic;
        public bool dirty; // not saved or restored

        public static readonly string N_ID = "id";
        public static readonly string N_UserId = "user_id";
        public static readonly string N_Subject = "subject";
        public static readonly string N_Text = "details";
        public static readonly string N_Date = "created_at";
        public static readonly string N_Status = "status";
        public static readonly string N_FromPublic = "from_public";

        public C_Suggestion(int userId, C_YMD date, bool fromPublic)
        {
            id = -1; // make sure we know that this a new item, never from the DB (yet)
            Status = E_SuggestionStatus.Open;

            UserId = id;
            Date = date;
            FromPublic = fromPublic;
        }

        public C_Suggestion(JsonValue j)
        {
            if (!(j is JsonObject))
                throw new ApplicationException("we can only work with an object");

            if (j.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(j[N_ID], id);

            if (j.ContainsKey(N_UserId))
                UserId = Tools.JsonProcessInt(j[N_UserId], UserId);

            if (j.ContainsKey(N_Subject))
                Subject = Tools.JsonProcessString(j[N_Subject], Subject);

            if (j.ContainsKey(N_Text))
            {
                string unescapedText = Tools.JsonProcessString(j[N_Text], Text);
                if (unescapedText != null)
                    Text = unescapedText.Replace("\\n", "\n");
            }

            if (j.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(j[N_Date], Date);

            if (j.ContainsKey(N_FromPublic))
                FromPublic = Tools.JsonProcessBool(j[N_FromPublic], FromPublic);

			if (j.ContainsKey(N_Status))
            {
                string ssv = Tools.JsonProcessString(j[N_Status], E_SuggestionStatus.Unknown.ToString());
                Status = Tools.StringToEnum<E_SuggestionStatus>(ssv);
            }

            dirty = false;
        }

        public string GetJson()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("{");

            sb.Append("\"" + N_ID + "\" : \"" + id.ToString() + "\"");
            sb.Append(",");
            sb.Append("\"" + N_UserId + "\" : \"" + UserId + "\"");
            if (Subject != null)
            {
                sb.Append(",");
                sb.Append("\"" + N_Subject + "\" : \"" + Subject + "\"");
            }
            if (Text != null)
            {
                sb.Append(",");
                sb.Append("\"" + N_Text + "\" : \"" + Text + "\"");
            }
            if (Date != null)
            {
                sb.Append(",");
                sb.Append("\"" + N_Date + "\" : \"" + Date.ToString("yyyy-mm-dd") + "\"");
            }
			sb.Append(",");
            sb.Append("\"" + N_Status + "\" : \"" + Status.ToString() + "\"");
			sb.Append(",");
            sb.Append("\"" + N_FromPublic + "\" : \"" + (FromPublic ? "true" : "false") + "\"");

			sb.Append("}");

            return sb.ToString();
        }

        public override bool Equals(System.Object obj)
        {
			if (obj == null)
				return false;

            C_Suggestion s = obj as C_Suggestion;
			if ((System.Object)s == null)
				return false;

			bool res = true;

            res &= id == s.id;
            res &= UserId == s.UserId;
            res &= Subject == s.Subject;
            res &= Text == s.Text;
            res &= Date == s.Date;
            res &= Status == s.Status;
            res &= FromPublic == s.FromPublic;

			return res;
        }

        public static bool operator ==(C_Suggestion a, C_Suggestion b)
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

		public static bool operator !=(C_Suggestion a, C_Suggestion b)
		{
			return !(a == b);
		}

		public override int GetHashCode()
        {
            int hash = 269;
            hash = (hash * 47) * id.GetHashCode();
            hash = (hash * 47) * UserId.GetHashCode();
			hash = (hash * 47) * Date.GetHashCode();
            hash = (hash * 47) * FromPublic.GetHashCode();

			return hash;
        }

		public static List<C_Suggestion> ImportSuggestion(JsonValue json)
		{
			if (!(json is JsonArray))
				throw new ApplicationException("the sites list must be an array");

			// create the holding place for the results
			List<C_Suggestion> res = new List<C_Suggestion>();
			foreach (JsonValue j in json)
			{
				C_Suggestion vs = new C_Suggestion(j);
				res.Add(vs);
			}

			return res;
		}

        public async Task<bool> AddSuggestion(string token)
        {
			string escapedText = Text.Replace("\n", "\\n");
			string bodyjson = "{ "
				+ "\"subject\" : \"" + Subject + "\""
				+ ",\"details\" : \"" + escapedText + "\""
                + ",\"from_public\" : \"" + (FromPublic ? "true" : "false") + "\""
				+ "}";

			bool success = false;
			try
			{
				string submiturl = "/suggestions";
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				if (token != null)
					wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				// do the actual web request
				string responseString = await wc.UploadStringTaskAsync(submiturl, "POST", bodyjson);

				// get and parse the response
				JsonValue responseJson = JsonValue.Parse(responseString);

				//C_Suggestion nsug = new C_Suggestion(responseJson);
				//id = nsug.id;
				//Suggestions.Add(this);

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
		public async Task<bool> UpdateSuggestion(string token)
		{
			if (id == -1)
				throw new ApplicationException("can't update a Suggestion that hasn't been submitted yet");

			string escapedText = Text.Replace("\n", "\\n");
			string bodyjson = "{ "
				+ "\"user\" : \"" + id.ToString() + "\""
				+ ",\"details\" : \"" + escapedText + "\""
				+ ",\"subject\" : \"" + Subject + "\""
				+ "}";

			bool success = false;
			try
			{
				string submiturl = "/suggestions/" + id.ToString();
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
                if (token != null)
    				wc.Headers.Add(HttpRequestHeader.Cookie, token);
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
		public async Task<bool> RemoveSuggestion(string token)
		{
			if (id == -1)
				throw new ApplicationException("must be an existing id; can't delete one that hasn't been added");

			bool success = false;
			try
			{
				string submiturl = "/suggestions/" + id.ToString();
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
                if (token != null)
    				wc.Headers.Add(HttpRequestHeader.Cookie, token);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");


				byte[] dataBytes = Encoding.UTF8.GetBytes("");
				// do the actual web request
				byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "DELETE", dataBytes);

				//string responseString = Encoding.UTF8.GetString(responseBytes);
				//JsonValue responseJson = JsonValue.Parse(responseString);
				// if it parses then it is our success result

				// remove this intent from the list
				//Suggestions.Remove(wi);

				success = true;
			}
			catch
			{
				success = false;
			}

			return success;
		}
	}
}