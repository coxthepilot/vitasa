using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;

namespace zsquared
{
    public enum E_SuggestionStatus { Open, Closed, WontFix, InProgress, Unknown }

    public class C_Suggestion
    {
        public int id;
        public readonly int UserId;
        public string Subject;
        public string Text;
        public readonly C_YMD CreateDate;
		public readonly C_YMD UpdateDate;
		public E_SuggestionStatus Status;
        public readonly bool FromPublic;

        public bool dirty; // not saved or restored

        public static readonly string N_ID = "id";
        public static readonly string N_UserId = "user_id";
        public static readonly string N_Subject = "subject";
        public static readonly string N_Text = "details";
        public static readonly string N_CreateDate = "created_at";
		public static readonly string N_UpdateDate = "created_at";
		public static readonly string N_Status = "status";
        public static readonly string N_FromPublic = "from_public";

        public C_Suggestion(int userId, C_YMD date, bool fromPublic)
        {
            id = -1; // make sure we know that this a new item, never from the DB (yet)
            Status = E_SuggestionStatus.Open;

            UserId = userId;
            CreateDate = date;
            UpdateDate = CreateDate;
            FromPublic = fromPublic;
        }

        public C_Suggestion(JsonValue j)
        {
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

            if (j.ContainsKey(N_CreateDate))
                CreateDate = Tools.JsonProcessDate(j[N_CreateDate], CreateDate);

            if (j.ContainsKey(N_UpdateDate))
                UpdateDate = Tools.JsonProcessDate(j[N_UpdateDate], UpdateDate);

			if (j.ContainsKey(N_Status))
            {
                string ssv = Tools.JsonProcessString(j[N_Status], E_SuggestionStatus.Unknown.ToString());
                Status = Tools.StringToEnum<E_SuggestionStatus>(ssv);
            }

            if (j.ContainsKey(N_FromPublic))
                FromPublic = Tools.JsonProcessBool(j[N_FromPublic], FromPublic);

            dirty = false;
        }

        public static async Task<List<C_Suggestion>> FetchAllSuggestions(string token)
		{
            List<C_Suggestion> res = null;

			string submiturl = "/suggestions";

            string responseString = await Tools.Download(submiturl, token);

            if (responseString != null)
            {
				JsonValue responseJson = JsonValue.Parse(responseString);

				res = ImportSuggestions(responseJson);
			}

            return res;
		}

        private static List<C_Suggestion> ImportSuggestions(JsonValue jv)
        {
			// create the holding place for the results
            List<C_Suggestion> res = new List<C_Suggestion>();
			foreach (JsonValue j in jv)
			{
				try
				{
					C_Suggestion vs = new C_Suggestion(j);
					res.Add(vs);
				}
				catch (Exception e)
				{
#if DEBUG
					Console.WriteLine(e.Message);
#endif
				}
			}

			return res;
		}

		public async Task<bool> AddSuggestion(string token)
        {
			string escapedText = Text.Replace("\n", "\\n");

			C_JsonBuilder jb = new C_JsonBuilder();
			jb.Add(Subject, N_Subject);
			jb.Add(escapedText, N_Text);
			jb.Add(FromPublic, N_FromPublic);
			string bodyjson = jb.ToString();

			string submiturl = "/suggestions";

            string responseString = await Tools.Upload("POST", submiturl, bodyjson, token);

            if (responseString != null)
            {
				JsonValue responseJson = JsonValue.Parse(responseString);

				C_Suggestion nsug = new C_Suggestion(responseJson);
				id = nsug.id;
			}

            return responseString != null;
        }

        /// <summary>
        /// Makes the API call to add a Suggestion. If successful, also adds to the User Suggestions list.
        /// </summary>
        /// <returns>true on success</returns>
        public async Task<bool> UpdateSuggestion(string token)
        {
			string escapedText = Text.Replace("\n", "\\n");

			C_JsonBuilder jb = new C_JsonBuilder();
			jb.Add(Subject, N_Subject);
			jb.Add(escapedText, N_Text);
			jb.Add(Status.ToString(), N_Status);
			string bodyjson = jb.ToString();

			string submiturl = "/suggestions/" + id.ToString();

            string responseString = await Tools.Upload("PUT", submiturl, bodyjson, token);

            return responseString != null;
        }

        /// <summary>
        /// Makes the API call to remove the Suggestion; on success, removes from this users Suggestions list
        /// </summary>
        /// <returns>True on success</returns>
        public async Task<bool> RemoveSuggestion(string token)
        {
			string submiturl = "/suggestions/" + id.ToString();

            string responseString = await Tools.Upload("DELETE", submiturl, "", token);

            return responseString != null;
		}
	}
}