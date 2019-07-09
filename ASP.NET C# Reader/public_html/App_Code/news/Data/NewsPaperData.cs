using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
namespace News
{

    public class NewsPaperData : DataAccess
    {

        public DataSet NewsPaperGetAll()
        {
            DataSet aDs;
            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "NewsPaperGetAll");
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                this.closeConection();
            }
            return aDs;
        }

        public DataSet NewsGetByNewsPaper(int pIdNewsPaper)
        {
            DataSet aDs;
            this.openConection();
            try
            {
                SqlParameter qIdNewsPaper = new SqlParameter("@IdNewsPaper", SqlDbType.Int);
                qIdNewsPaper.Value = pIdNewsPaper;

                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "NewsGetByIdNewsPaper", qIdNewsPaper);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                this.closeConection();
            }
            return aDs;
        }

        public DataRow NewsPaperGetById(int pIdNewsPaper)
        {
            DataSet aDs;
            this.openConection();
            try
            {
                SqlParameter qIdNewsPaper = new SqlParameter("@IdNewsPaper", SqlDbType.Int);
                qIdNewsPaper.Value = pIdNewsPaper;

                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "NewsPaperGetById", qIdNewsPaper);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                this.closeConection();
            }

            if (aDs.Tables.Count > 0)
            {
                if (aDs.Tables[0].Rows.Count > 0)
                {
                    return aDs.Tables[0].Rows[0];
                }
            }
            return null;
        }
    }



}