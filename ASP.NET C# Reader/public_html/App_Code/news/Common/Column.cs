using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;

namespace News { 
    public class Column
    {
        public string name
        {
            get { return m_name; }
            set { m_name = value; }
        }
        private string m_name;

        public string column_id
        {
            get { return m_column_id; }
            set { m_column_id = value; }
        }
        private string m_column_id;

        public string object_id
        {
            get { return m_object_id; }
            set { m_object_id = value; }
        }
        private string m_object_id;


        public string type_name
        {
            get { return m_type_name; }
            set { m_type_name = value; }
        }
        private string m_type_name;


        public string max_length
        {
            get { return m_max_length; }
            set { m_max_length = value; }
        }
        private string m_max_length;



        public string enabled
        {
            get { return m_enabled; }
            set { m_enabled = value; }
        }
        private string m_enabled;
    }


}