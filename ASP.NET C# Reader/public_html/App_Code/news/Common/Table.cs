using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;


namespace News
{
    public class Table
    {
        public string name
        {
            get { return m_name; }
            set { m_name = value; }
        }
        private string m_name;

        public string object_id
        {
            get { return m_object_id; }
            set { m_object_id = value; }
        }
        private string m_object_id;

        public string schema_name
        {
            get { return m_schema_name; }
            set { m_schema_name = value; }
        }
        private string m_schema_name;

        public string schema_id
        {
            get { return m_schema_id; }
            set { m_schema_id = value; }
        }
        private string m_schema_id;


        public string create_date
        {
            get { return m_create_date; }
            set { m_create_date = value; }
        }
        private string m_create_date;

        public string modify_date
        {
            get { return m_modify_date; }
            set { m_modify_date = value; }
        }
        private string m_modify_date;




    }



}