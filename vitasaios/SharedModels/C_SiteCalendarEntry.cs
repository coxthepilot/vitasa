//using System;
//using System.Json;
//using System.IO;
//using System.Net;
//using System.Threading.Tasks;
//using System.Collections.Generic;
//using System.Text;
//using System.Net.Http;
//using UIKit;

namespace zsquared
{
    public class C_SiteCalendarEntry
    {
        public string OpenTime;
        public string CloseTime;
        public int NumEFilers;

        /// <summary>
        /// Not saved or restored; used to remember how many seats are requied and may have been overridded in a calendar
        /// </summary>
        public int OverrideNumEFilers;
    }
}
