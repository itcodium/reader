using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace News
{


    public class CatalogData : DataAccess
    {
        public int RubroInsert(DataRow aDr)
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = Convert.ToInt32(SqlHelper.ExecuteNonQueryTypedParams(tran, "usp_ProductsInsert", aDr));
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                throw ex;
            }
            finally
            {
                this.closeConection();
            }
            return res;
        }
        public int RubroUpdate(DataRow aDr)
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = SqlHelper.ExecuteNonQueryTypedParams(tran, "usp_ProductsUpdate", aDr);
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                throw ex;
            }
            finally
            {
                this.closeConection();
            }
            return res;

        }
        public int RubroDelete(int aId)
        {
            SqlParameter qIdProducts = new SqlParameter("@IdProducts", SqlDbType.Int);
            qIdProducts.Value = aId;

            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = SqlHelper.ExecuteNonQuery(tran, "usp_ProductsDelete", qIdProducts);
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                throw ex;
            }
            finally
            {
                this.closeConection();
            }
            return res;
        }
        public DataRow RubroGetById(int aId)
        {
            DataSet aDs;
            SqlParameter qIdProducts = new SqlParameter("@Idproducts", SqlDbType.Int);
            qIdProducts.Value = aId;

            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, "usp_ProductsGetById", qIdProducts);
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


        public DataSet TablesGetAll(string aSchema)
        {
            DataSet aDs;
            SqlParameter qSchema = new SqlParameter("@schema", SqlDbType.VarChar);
            qSchema.Value = aSchema;
            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "adm_Tables_Get", qSchema);
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
        public DataSet TablesFilter(string aSchema, string aFilter)
        {
            DataSet aDs;
            SqlParameter qSchema = new SqlParameter("@schema", SqlDbType.VarChar);
            qSchema.Value = aSchema;
            SqlParameter qName = new SqlParameter("@name", SqlDbType.VarChar);
            qName.Value = aFilter;


            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "adm_Tables_Get", qSchema, qName);
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
        public DataSet TableSelectQuery(string aSchema, string aName, string aAlias, string aFilter)
        {
            DataSet aDs;
            SqlParameter qSchema = new SqlParameter("@schema", SqlDbType.VarChar);
            qSchema.Value = aSchema;

            SqlParameter qName = new SqlParameter("@name", SqlDbType.VarChar);
            qName.Value = aName;

            SqlParameter qAlias = new SqlParameter("@alias", SqlDbType.VarChar);
            qAlias.Value = aAlias;


            SqlParameter qFilter = new SqlParameter("@filter", SqlDbType.VarChar);
            qFilter.Value = aFilter;


            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "adm_Select_Query_Get", qSchema, qName, qAlias, qFilter);
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
        public DataSet TableSelectData(string aSchema, string aName, string aAlias, string aFilter)
        {

            DataSet aDs;
            SqlParameter qSchema = new SqlParameter("@schema", SqlDbType.VarChar);
            qSchema.Value = aSchema;

            SqlParameter qName = new SqlParameter("@name", SqlDbType.VarChar);
            qName.Value = aName;

            SqlParameter qAlias = new SqlParameter("@alias", SqlDbType.VarChar);
            qAlias.Value = aAlias;

            SqlParameter qFilter = new SqlParameter("@filter", SqlDbType.VarChar);
            qFilter.Value = aFilter;

            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "adm_Select_Table_Data", qSchema, qName, qAlias, qFilter);
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
        public DataRow TablesGetByName(string aSchema, string aName)
        {
            DataSet aDs;

            SqlParameter qSchema = new SqlParameter("@schema", SqlDbType.VarChar);
            qSchema.Value = aSchema;

            SqlParameter qName = new SqlParameter("@name", SqlDbType.VarChar);
            qName.Value = aName;

            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, "adm_Tables_Get", qSchema, qName);
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
        public DataSet ColumnsGetByTable(string aSchema, string aTableName)
        {
            DataSet aDs;
            SqlParameter qSchema = new SqlParameter("@schema", SqlDbType.VarChar);
            qSchema.Value = aSchema;

            SqlParameter qName = new SqlParameter("@name", SqlDbType.VarChar);
            qName.Value = aTableName;


            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "adm_Columns_Get", qSchema, qName);
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

        public DataSet TableNavigate(string aSchema, string aTableName)
        {
            DataSet aDs;
            SqlParameter qSchema = new SqlParameter("@schema", SqlDbType.VarChar);
            qSchema.Value = aSchema;

            SqlParameter qName = new SqlParameter("@name", SqlDbType.VarChar);
            qName.Value = aTableName;


            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "dbo.adm_TableNavigator", qSchema, qName);
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







        public int ColumnsSetEnabled(Int64 object_id, string name, bool enabled)
        {
            SqlParameter qObject_id = new SqlParameter("@object_id", SqlDbType.BigInt);
            qObject_id.Value = object_id;
            SqlParameter qName = new SqlParameter("@name", SqlDbType.VarChar);
            qName.Value = name;
            SqlParameter qEnabled = new SqlParameter("@enabled", SqlDbType.Bit);
            qEnabled.Value = enabled;

            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = SqlHelper.ExecuteNonQuery(tran, "dbo.adm_Columns_Enabled", qObject_id, qName, qEnabled);
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                throw ex;
            }
            finally
            {
                this.closeConection();
            }
            return res;
        }



    }



}