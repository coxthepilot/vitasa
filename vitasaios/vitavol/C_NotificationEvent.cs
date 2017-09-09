using System;
using System.Json;
using System.Text;
using System.Collections.Generic;

namespace zsquared
{
	public class C_NotificationEvent
	{
		public int WorkItemId;
		public bool NotificationIssued;
		public C_YMD EventDate;
		public string SiteSlug;
		public string SiteName;

		public static readonly string N_WorkItemId = "workitemid";
		public static readonly string N_NotificationIssued = "notificationissued";
		public static readonly string N_EventDate = "eventdate";
		public static readonly string N_SiteSlug = "siteslug";
		public static readonly string N_SiteName = "sitename";

		public C_NotificationEvent(JsonValue j)
		{
            if (j.JsonType != JsonType.Object)
				throw new ApplicationException("expecting an object");

			if (j.ContainsKey(N_WorkItemId))
				WorkItemId = Tools.JsonProcessInt(j[N_WorkItemId], WorkItemId);

			if (j.ContainsKey(N_NotificationIssued))
				NotificationIssued = Tools.JsonProcessBool(j[N_NotificationIssued], NotificationIssued);

			if (j.ContainsKey(N_EventDate))
				EventDate = Tools.JsonProcessDate(j[N_EventDate], EventDate);

			if (j.ContainsKey(N_SiteSlug))
				SiteSlug = Tools.JsonProcessString(j[N_SiteSlug], SiteSlug);

			if (j.ContainsKey(N_SiteName))
				SiteName = Tools.JsonProcessString(j[N_SiteName], SiteName);
		}

		public C_NotificationEvent(C_WorkItem wi)
		{
			WorkItemId = wi.id;
			NotificationIssued = false;
			EventDate = wi.Date;
			SiteSlug = wi.SiteSlug;
		}

		public string GetJson()
		{
			string res =
					"\"" + N_WorkItemId + "\" : \"" + WorkItemId.ToString() + "\""
				 + ",\"" + N_NotificationIssued + "\" : \"" + (NotificationIssued ? "true" : "false") + "\""
				 + ",\"" + N_EventDate + "\" : \"" + EventDate.ToString("yyyy-mm-dd") + "\""
				 + ",\"" + N_SiteSlug + "\" : \"" + SiteSlug + "\""
				 + ",\"" + N_SiteName + "\" : \"" + SiteName + "\""
				;

			return res;
		}

		public static string GetJsonFromList(List<C_NotificationEvent> nList)
		{
			StringBuilder sb = new StringBuilder();

            sb.Append("{ \"knownevents\" : ");
			sb.Append("[");
			if (nList.Count != 0)
			{
				int x = 0;
				foreach (C_NotificationEvent ne in nList)
				{
					if (x != 0)
						sb.Append(",");
					sb.Append("{");
					sb.Append(ne.GetJson());
					sb.Append("}");
				}
			}
			sb.Append("]");
			sb.Append("}");

			return sb.ToString();
		}

		public static int ComparebyDateAscending(C_NotificationEvent ne1, C_NotificationEvent ne2)
		{
			return ne1.EventDate.CompareTo(ne2.EventDate);
		}
	}

}
