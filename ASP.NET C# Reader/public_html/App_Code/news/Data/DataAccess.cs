using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace News
{

    public abstract class DataAccess
    {
        protected readonly static string connectionString = ConfigurationManager.ConnectionStrings["cnnDatabase"].ToString();
        protected SqlConnection cnn;

        protected DataAccess()
        {
            cnn = new SqlConnection(connectionString);
        }

        protected bool conectionIsOpen()
        {
            return (cnn.State.ToString() == "Open");
        }
        protected void closeConection()
        {
            if (conectionIsOpen())
            {
                cnn.Close();
            }
        }

        protected void openConection()
        {
            if (!conectionIsOpen())
            {
                cnn.Open();
            }
        }


    }

}