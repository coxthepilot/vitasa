using System;
using System.Text;
using System.Collections.Generic;
namespace zsquared
{
	public class C_JsonBuilder
	{
		readonly StringBuilder sb;
		bool IsFirst;
        readonly Queue<bool> FirstQueue;

        public C_JsonBuilder()
		{
			IsFirst = true;
			FirstQueue = new Queue<bool>();

			sb = new StringBuilder();
			sb.Append("{");
		}

		public override string ToString()
		{
			sb.Append("}");
			return sb.ToString();
		}

		public void Add(bool b, string name)
		{
			if (!IsFirst)
				sb.Append(",");
			IsFirst = false;

			sb.Append("\"" + name + "\" : \"" + (b ? "true" : "false") + "\"");
		}

		public void Add(int i, string name)
		{
			if (!IsFirst)
				sb.Append(",");
			IsFirst = false;

			sb.Append("\"" + name + "\" : \"" + i.ToString() + "\"");
		}

		public void Add(C_YMD date, string name)
		{
			if (!IsFirst)
				sb.Append(",");
			IsFirst = false;

			sb.Append("\"" + name + "\" : \"" + date.ToString("yyyy-mm-dd") + "\"");
		}

		public void Add(C_HMS time, string name)
		{
			if (!IsFirst)
				sb.Append(",");
			IsFirst = false;

			sb.Append("\"" + name + "\" : \"" + time.ToString("hh:mm") + "\"");
		}

		public void Add(string s, string name)
		{
			if (!IsFirst)
				sb.Append(",");
			IsFirst = false;

			sb.Append("\"" + name + "\" : \"" + s + "\"");
		}

        public void Add(float f, string name)
        {
			if (!IsFirst)
				sb.Append(",");
			IsFirst = false;

            sb.Append("\"" + name + "\" : \"" + f.ToString("R") + "\"");
		}

		public void StartArray(string name)
		{
			if (!IsFirst)
				sb.Append(",");
			IsFirst = false;

			sb.Append("\"" + name + "\" : [");

			FirstQueue.Enqueue(IsFirst);
			IsFirst = true;
		}

		public void EndArray()
		{
			sb.Append("]");

			IsFirst = FirstQueue.Dequeue();
		}
	}
}
