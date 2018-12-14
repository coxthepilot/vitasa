using System;

namespace zsquared
{
    /// <summary>
    /// This class implements DateTime as only a Year, Month and Day - no time of day.
    /// </summary>
    public class C_HMS
    {
        int _hour;
        public int Hour
        {
            get { return _hour; }
            set
            {
                if ((value < 0) || (value > 23))
                    throw new ApplicationException("Hour must be 0..23");
                _hour = value;
            }
        }

        int _minutes;
        public int Minutes
        {
            get { return _minutes; }
            set
            {
                if ((value < 0) || (value > 59))
                    throw new ApplicationException("Minutes must be 0..59");
                _minutes = value;
            }
        }

        public int _seconds;
        public int Seconds
        {
            get { return _seconds; }
            set
            {
                if ((value < 0) || (value > 59))
                    throw new ApplicationException("Seconds must be 0..59");
                _seconds = value;
            }
        }

        public C_HMS(int h, int m, int s)
        {
            _hour = h;
            _minutes = m;
            _seconds = s;
        }

        public C_HMS(DateTime dt)
        {
            Hour = dt.Hour;
            Minutes = dt.Minute;
            Seconds = dt.Second;
        }

        public C_HMS(string s)
        {
            if (s.Length > 8)
            {
                // must be in the format "2000-01-01 10:00:00 UTC"
                if (s.Contains("UTC"))
                {
                    string[] s1 = s.Split(' ');
                    if (s1.Length != 3)
                        throw new ApplicationException("Unexpected format");
                    s = s1[1];
                }
                else
                    throw new ApplicationException("Unexpected format");
            }

            bool isPM = s.Contains("pm");
            if (s.Contains("am"))
            {
                int ix = s.IndexOf("am", StringComparison.Ordinal);
                s = s.Remove(ix, 2);
            }
            if (s.Contains("pm"))
            {
                int ix = s.IndexOf("pm", StringComparison.Ordinal);
				s = s.Remove(ix, 2);
			}
            // just in case there are any left over blanks...
            s = s.Trim();

			// HH:MM:SS or HH:MM
			string[] ss = s.Split(new char[] { ':' });
            try
            {
                if (ss.Length == 3)
                {
                    _hour = Convert.ToInt32(ss[0]);
                    _minutes = Convert.ToInt32(ss[1]);
                    _seconds = Convert.ToInt32(ss[2]);
                }
                else if (ss.Length == 2)
                {
                    _hour = Convert.ToInt32(ss[0]);
                    _minutes = Convert.ToInt32(ss[1]);
                    _seconds = 0;
                }
                else
                {
                    _hour = 0;
                    _minutes = 0;
                    _seconds = 0;
                }
            }
            catch (Exception e)
            {
                throw new ApplicationException("Conversion error (" + e.Message + ")");
            }

            if (isPM && (_hour != 12))
                _hour += 12;
            if (_hour == 24)
                _hour = 0;
        }

        public C_HMS(C_HMS hms)
        {
            Hour = hms.Hour;
            Minutes = hms.Minutes;
            Seconds = hms.Seconds;
        }

        public DateTime ToDateTime(C_YMD ymd)
        {
            return new DateTime(ymd.Year, ymd.Month, ymd.Day, _hour, _minutes, _seconds);
        }

        public static C_HMS Now
        {
            get 
            { 
                DateTime now = DateTime.Now;
                return new C_HMS(now.Hour, now.Minute, now.Second);
            }

        }

        public C_HMS AddMinutes(int num)
        {
            C_HMS res = new C_HMS(this);

            res._minutes += num;
            if (res._minutes >= 60)
            {
                int hourAdder = res._minutes / 60; // we could have been given more than 60 minutes to add
                res._minutes = res._minutes % 60;
                res._hour += hourAdder;
                if (res._hour >= 24)
                    throw new ApplicationException("Illegal hour value as a result of increment");
            }
            else if (res._minutes < 0)
            {
                while (res._minutes < 0)
                {
                    res._hour--;
                    res._minutes += 60;
                    if (res._hour < 0)
                        throw new ApplicationException("Illegal hour value as a result of decrement");
                }
            }

            return res;
        }

        public int CompareTo(C_HMS v2)
        {
            int res = 1;
            if ((_hour == v2._hour) && (_minutes == v2._minutes) && (_seconds == v2._seconds))
                res = 0;
            else if ((_hour < v2._hour)
                || ((_hour == v2._hour) && (_minutes < v2._minutes))
                || ((_hour == v2._hour) && (_minutes == v2._minutes) && (_seconds < v2._seconds))
                )
                res = -1;

            return res;
        }

        public static bool operator >(C_HMS v1, C_HMS v2)
        {
            bool res = ((v1._hour > v2._hour)
                || ((v1._hour == v2._hour) && (v1._minutes > v2._minutes))
                || ((v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds > v2._seconds))
                );

            return res;
        }

        public static bool operator >=(C_HMS v1, C_HMS v2)
        {
            bool res = (((v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds == v2._seconds))
                || (v1._hour > v2._hour)
                || ((v1._hour == v2._hour) && (v1._minutes > v2._minutes))
                || ((v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds > v2._seconds))
                );

            return res;
        }

        public static bool operator <(C_HMS v1, C_HMS v2)
        {
            bool yearsEqual = v1._hour == v2._hour;
            if ((yearsEqual) && (v1._minutes == v2._minutes) && (v1._seconds < v2._seconds))
                return true;
            else if ((yearsEqual) && (v1._minutes < v2.Minutes))
                return true;
            else if (v1._hour < v2._hour)
                return true;

            return false;
        }

        public static bool operator <=(C_HMS v1, C_HMS v2)
        {
            bool res = (((v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds == v2._seconds))
                || (v1._hour < v2._hour)
                || ((v1._hour == v2._hour) && (v1._minutes < v2._minutes))
                || ((v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds < v2._seconds))
                );

            return res;
        }

        public static bool operator ==(C_HMS v1, C_HMS v2)
        {
            if (((object)v1 == null) && ((object)v2 != null))
                return false;
            if (((object)v1 != null) && ((object)v2 == null))
                return false;
            if (((object)v1 == null) && ((object)v2 == null))
                return true;


            return (v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds == v2._seconds);
        }

        public static bool operator !=(C_HMS v1, C_HMS v2)
        {
            if (((object)v1 == null) && ((object)v2 != null))
                return true;
            if (((object)v1 != null) && ((object)v2 == null))
                return true;
            if (((object)v1 == null) && ((object)v2 == null))
                return false;

            return (v1._hour != v2._hour) || (v1._minutes != v2._minutes) || (v1._seconds != v2._seconds);
        }

        public override string ToString()
        {
            return _hour.ToString("D2") + ":" + _minutes.ToString("D2") + ":" + _seconds.ToString("D2");
        }

        /// <summary>
        /// returns a formated time using the provided format
        /// "hhmmssp" hh = hours, mm = minutes, ss = seconds, p = use 12-hour format
        /// </summary>
        /// <param name="fmt"></param>
        /// <returns></returns>
        public string ToString(string fmt)
        {
            string res = fmt.ToLower();

            string ampm = "";
            int ampmHour = _hour;
            if (res.Contains("p"))
            {
                if (ampmHour > 12)
                {
                    ampmHour = ampmHour - 12;
                    ampm = "pm";
                    if (ampmHour == 0)
                    {
                        ampmHour = 12;
                        ampm = "am";
                    }
                }
                else if (ampmHour == 12)
                    ampm = "pm";
                else
                    ampm = "am";
            }

            string s_ampmHour = ampmHour.ToString("D2");
            if (ampmHour < 10)
                s_ampmHour = " " + ampmHour.ToString("D1");

            if (res.Contains("hh"))
                res = res.Replace("hh", s_ampmHour);
            if (res.Contains("mm"))
                res = res.Replace("mm", _minutes.ToString("D2"));
            if (res.Contains("ss"))
                res = res.Replace("ss", _seconds.ToString("D2"));
            if (res.Contains("p"))
                res = res.Replace("p", ampm);

            return res;
        }

        public override int GetHashCode()
        {
            return _hour * 60 * 60 + _minutes * 60 + _seconds;
        }

        public override bool Equals(object obj)
        {
            if (obj == null || !(obj is C_YMD))
                return false;
            else
            {
                C_HMS nn = (C_HMS)obj;
                return (_hour == nn._hour) && (_minutes == nn._minutes) && (_seconds == nn._seconds);
            }
        }
    }

}
