using System.Json;

namespace zsquared
{
    /// <summary>
    /// Calendar entry for site calendar defaults. Deprecated.
    /// </summary>
    public class C_SiteCalendarEntryX
    {
        public bool SiteIsOpen;

        public C_WorkShift[] WorkShifts;

        //public C_HMS OpenTime;
        //public C_HMS CloseTime;
        //public int NumEFilers;
        ///// <summary>
        ///// This is used to remember how many seats are requied and may have been overridded in a calendar; not saved
        ///// in system DB; is preserved across UI screens however
        ///// </summary>
        //public int OverrideNumEFilers;

        //public static readonly string N_OpenTime = "opentime";
        //public static readonly string N_CloseTime = "closetime";
        //public static readonly string N_NumEFilers = "numefilers";
        //public static readonly string N_OverrideNumEFilers = "overridenumefilers";

        public C_SiteCalendarEntryX()
        {
            WorkShifts = new C_WorkShift[3];
            for (int ix = 0; ix != 3; ix++)
                WorkShifts[ix] = new C_WorkShift();
        }

        public C_SiteCalendarEntryX(JsonValue jv)
        {
			//if (jv.ContainsKey(N_OpenTime))
   //             OpenTime = Tools.JsonProcessTime(jv[N_OpenTime], OpenTime);

			//if (jv.ContainsKey(N_CloseTime))
			//	CloseTime = Tools.JsonProcessTime(jv[N_CloseTime], CloseTime);

			//if (jv.ContainsKey(N_NumEFilers))
			//	NumEFilers = Tools.JsonProcessInt(jv[N_NumEFilers], NumEFilers);

			//if (jv.ContainsKey(N_OverrideNumEFilers))
				//OverrideNumEFilers = Tools.JsonProcessInt(jv[N_OverrideNumEFilers], OverrideNumEFilers);
		}
	}
}
