using System;
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
        public C_SignUp SignUp;
        public C_WorkShift WorkShift;
        public C_Message Message;
    }
}
