using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;


namespace News
{
    public class Messages
    {
        public int value
        {
            get { return m_value; }
            set { m_value = value; }
        }
        private int m_value;
        public string message
        {
            get { return m_message; }
            set { m_message = value; }
        }
        private string m_message;
    }



}