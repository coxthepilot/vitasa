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
    public class C_VitaUser
    {
        public C_VitaUser()
        {
        }

		public static async Task<JsonValue> FetchUsersList()
		{
			string usersUrl = C_Vita.VitaCoreUrl + "/users";
			// Create an HTTP web request using the URL:
			HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(new Uri(usersUrl));
			//request.Headers.Add(HttpRequestHeader.Accept, "application/json");
			request.Accept = "application/json";
			//request.ContentType = "application/json";
			request.Method = "GET";

			// Send the request to the server and wait for the response:
			using (WebResponse response = await request.GetResponseAsync())
			{
				// Get a stream representation of the HTTP web response:
				using (Stream stream = response.GetResponseStream())
				{
					// todo: make sure they responded with an application/json response
					// todo: make sure we got response code 200 (ok)

					// Use this stream to build a JSON document object:
					JsonValue jsonDoc = await Task.Run(() => JsonObject.Load(stream));
					//Console.Out.WriteLine("Response: {0}", jsonDoc.ToString());

					JsonValue jv = jsonDoc;
					if (jsonDoc is JsonObject)
					{
						try { jv = JsonValue.Parse(jsonDoc); }
						catch (Exception e)
						{
							Console.WriteLine(e.Message);
						}
					}

					// Return the JSON document:
					return jv;
				}
			}
		}

	}
}
