using System.Collections.Generic;
namespace zsquared
{
    public class C_IOResult
    {
        public bool Success;
        public string ResponseString;
        public E_IOResultCode ResultCode;
        public string ErrorMessage;

        public C_VitaSite Site;
        public C_VitaUser User;
    }
}
