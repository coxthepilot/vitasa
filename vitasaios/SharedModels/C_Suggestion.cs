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
#if DEBUG
            if (!(j is JsonObject))
                throw new ApplicationException("we can only work with an object");
#endif

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
            res &= CreateDate == s.CreateDate;
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
            hash = (hash * 47) * CreateDate.GetHashCode();
            hash = (hash * 47) * FromPublic.GetHashCode();

            return hash;
        }

        public static async Task<List<C_Suggestion>> GetAllSuggestions(string token)
		{
            List<C_Suggestion> res;

			int retryCount = 0;
			bool retry = false;

			res = null;
			do
			{
				try
				{
					retry = false;

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
                    string responseString = await wc.DownloadStringTaskAsync(submiturl);

					// get and parse the response
					JsonValue responseJson = JsonValue.Parse(responseString);

                    res = ImportSuggestions(responseJson);
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
                        res = null;
						retry = retryCount < 3;
						retryCount++;
					}
				}
				catch (Exception e)
				{
#if DEBUG
					Console.WriteLine(e.Message);
#endif
                    res = null;
				}
			}
			while (retry);

			return res;
		}

        private static List<C_Suggestion> ImportSuggestions(JsonValue jv)
        {
#if DEBUG
			if (!(jv is JsonArray))
				throw new ApplicationException("the sites list must be an array");
#endif
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
			int retryCount = 0;
			bool retry = false;
			
            bool success = false;
            do
            {
                try
                {
                    retry = false;
                    string escapedText = Text.Replace("\n", "\\n");
                    string bodyjson = "{ "
                        + "\"subject\" : \"" + Subject + "\""
                        + ",\"details\" : \"" + escapedText + "\""
                        + ",\"from_public\" : \"" + (FromPublic ? "true" : "false") + "\""
                        + "}";

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

                    C_Suggestion nsug = new C_Suggestion(responseJson);
                    id = nsug.id;

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

        /// <summary>
        /// Makes the API call to add a Suggestion. If successful, also adds to the User Suggestions list.
        /// </summary>
        /// <returns>true on success</returns>
        public async Task<bool> UpdateSuggestion(string token)
        {
#if DEBUG
            if (id == -1)
                throw new ApplicationException("can't update a Suggestion that hasn't been submitted yet");
#endif
			int retryCount = 0;
			bool retry = false;

			bool success = false;
            do
            {
                try
                {
                    retry = false;
                    string escapedText = Text.Replace("\n", "\\n");
                    string bodyjson = "{ "
                        + "\"" + N_Text + "\" : \"" + escapedText + "\""
                        + ","
                        + "\"" + N_Subject + "\" : \"" + Subject + "\""
						+ ","
						+ "\"" + N_Status + "\" : \"" + Status.ToString() + "\""
                        + "}";

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

#if DEBUG
                    C_Suggestion nsug = new C_Suggestion(responseJson);
                    if (!(nsug.Equals(this)))
                        throw new ApplicationException("response mismatch");
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
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                    success = false;
                }
            }
            while (retry);

            return success;
        }

        /// <summary>
        /// Makes the API call to remove the Suggestion; on success, removes from this users Suggestions list
        /// </summary>
        /// <returns>True on success</returns>
        public async Task<bool> RemoveSuggestion(string token)
        {
#if DEBUG
            if (id == -1)
                throw new ApplicationException("must be an existing id; can't delete one that hasn't been added");
#endif
			int retryCount = 0;
			bool retry = false;

			bool success = false;
            do
            {
                try
                {
                    retry = false;
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
                    // there is no response from a delete
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
				catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                    success = false;
                }
            }
            while (retry);

			return success;
		}
	}
}