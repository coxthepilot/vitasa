using System;
using System.Collections.Generic;
using System.Json;

namespace zsquared
{
    public class C_WorkShift
    {
        public int id;              // db record id
        public string SiteSlug;     // site slug
        public int CalendarId;      // id for the associated calendar entry

        public C_HMS OpenTime;      // opening time for this shift
        public C_HMS CloseTime;     // closing time for this shift

        public int NumBasicEFilers; // number of basic efilers needed
        public int NumAdvEFilers;   // number of advanced efilers needed

        public List<C_WorkShiftSignUp> SignUps; // the signups for this shift

        public bool Dirty; // not saved in the DB

        public const string N_ID = "id";
        public const string N_SiteSlug = "site_slug";
        public const string N_CalendarId = "calendar_id";
        public const string N_OpenTime = "start_time";
        public const string N_CloseTime = "end_time";
        public const string N_NumBasicEFilers = "efilers_needed_basic";
        public const string N_NumAdvEFilers = "efilers_needed_advanced";
        public const string N_SignUps = "signups";

        public C_WorkShift()
        {
            Dirty = false;
        }

        public C_WorkShift(C_WorkShift ws)
        {
            id = -1;
            SiteSlug = ws.SiteSlug;
            CalendarId = -1;
            OpenTime = new C_HMS(ws.OpenTime);
            CloseTime = new C_HMS(ws.CloseTime);
            NumBasicEFilers = ws.NumBasicEFilers;
            NumAdvEFilers = ws.NumAdvEFilers;

            Dirty = false;
        }

		public C_WorkShift(JsonValue j)
		{
            Dirty = false;

			if (!(j is JsonObject))
				return;

			if (j.ContainsKey(N_ID))
				id = Tools.JsonProcessInt(j[N_ID], id);

			if (j.ContainsKey(N_SiteSlug))
                SiteSlug = Tools.JsonProcessString(j[N_SiteSlug], SiteSlug);

			if (j.ContainsKey(N_CalendarId))
                CalendarId = Tools.JsonProcessInt(j[N_CalendarId], CalendarId);

			if (j.ContainsKey(N_OpenTime))
                OpenTime = Tools.JsonProcessTime(j[N_OpenTime], new C_HMS(0, 0, 0));

			if (j.ContainsKey(N_CloseTime))
				CloseTime = Tools.JsonProcessTime(j[N_CloseTime], new C_HMS(0, 0, 0));

			if (j.ContainsKey(N_NumBasicEFilers))
				NumBasicEFilers = Tools.JsonProcessInt(j[N_NumBasicEFilers], NumBasicEFilers);

			if (j.ContainsKey(N_NumAdvEFilers))
				NumAdvEFilers = Tools.JsonProcessInt(j[N_NumAdvEFilers], NumAdvEFilers);

            if (j.ContainsKey(N_SignUps))
            {
				SignUps = new List<C_WorkShiftSignUp>();
				foreach (JsonValue jv in j[N_SignUps])
                {
                    C_WorkShiftSignUp su = new C_WorkShiftSignUp(jv);
                    SignUps.Add(su);
                }
            }
		}

        public void AddJson(C_JsonBuilder jb)
        {
            jb.Add(id, N_ID);
            jb.Add(SiteSlug, N_SiteSlug);
            jb.Add(CalendarId, N_CalendarId);
            jb.Add(OpenTime, N_OpenTime);
            jb.Add(CloseTime, N_CloseTime);
            jb.Add(NumBasicEFilers, N_NumBasicEFilers);
            jb.Add(NumAdvEFilers, N_NumAdvEFilers);
        }

        public string ToJson()
		{
            C_JsonBuilder jb = new C_JsonBuilder();
            AddJson(jb);
            return jb.ToString();
		}
	}

    public class C_WorkShiftSignUp
    {
        public int id;
        public C_WorkShiftSignUpUser User;

        public C_SignUp TheSignUp; // only used in SCVolunteers to hold the actual signup for hours CRUD and approval

        public const string N_ID = "id";
        public const string N_User = "user";

        public C_WorkShiftSignUp(C_WorkShiftSignUpUser wsuser)
        {
            id = -1;
            User = wsuser;
        }

        public C_WorkShiftSignUp(JsonValue jv)
        {
            if (jv.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(jv[N_ID], id);

            if (jv.ContainsKey(N_User))
                User = new C_WorkShiftSignUpUser(jv[N_User]);
        }
    }

    public class C_WorkShiftSignUpUser
    {
        public int UserId;
        public string UserName;
        public E_Certification Certification;
        public string Phone;

        public const string N_UserId = "id";
        public const string N_UserName = "name";
        public const string N_Certification = "certification";
        public const string N_Phone = "phone";

        public C_WorkShiftSignUpUser(int userId, string username, E_Certification cert, string phone)
        {
            UserId = userId;
            UserName = username;
            Certification = cert;
            Phone = phone;
        }

        public C_WorkShiftSignUpUser(JsonValue jv)
        {
            if (jv.ContainsKey(N_UserId))
                UserId = Tools.JsonProcessInt(jv[N_UserId], UserId);

            if (jv.ContainsKey(N_UserName))
                UserName = Tools.JsonProcessString(jv[N_UserName], UserName);

			if (jv.ContainsKey(N_Phone))
				Phone = Tools.JsonProcessString(jv[N_Phone], Phone);

			if (jv.ContainsKey(N_Certification))
            {
                string cs = Tools.JsonProcessString(jv[N_Certification], Certification.ToString());
                Certification = Tools.StringToEnum<E_Certification>(cs);
            }
        }
    }
}
