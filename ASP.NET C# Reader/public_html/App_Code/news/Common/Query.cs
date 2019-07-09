using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;


namespace News
{
    public class Query
    {
        public string query
        {
            get { return m_query; }
            set { m_query = value; }
        }
        private string m_query;
        public string table
        {
            get { return m_table; }
            set { m_table = value; }
        }
        private string m_table;
    }



}