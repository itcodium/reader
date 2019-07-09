using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace News
{

    public class NewsData : DataAccess
    {
        public int newsInsert(DataRow aDr)
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = Convert.ToInt32(SqlHelper.ExecuteNonQueryTypedParams(tran, "News_Insert", aDr));
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

        public int newsLog_Insert(DataRow aDr)
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = Convert.ToInt32(SqlHelper.ExecuteNonQueryTypedParams(tran, "NewsLog_Insert", aDr));
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





        public int newsInsert_FromWebSite(DataRow aDr)
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = Convert.ToInt32(SqlHelper.ExecuteNonQueryTypedParams(tran, "News_Insert_FromWebSite", aDr));
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

        public int newsReset()
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = Convert.ToInt32(SqlHelper.ExecuteNonQuery(tran, "News_Reset"));
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

        public int countByTitle(int pIdNewsPaper, int pIdChannel,string title)
        {
            this.openConection();
            int res;
            SqlParameter qIdNewsPaper = new SqlParameter("@IdNewsPaper", SqlDbType.Int);
            qIdNewsPaper.Value = pIdNewsPaper;
            SqlParameter qIdChannel = new SqlParameter("@IdChannel", SqlDbType.Int);
            qIdChannel.Value = pIdChannel;

            SqlParameter qTitle = new SqlParameter("@title", SqlDbType.VarChar);
            qTitle.Value = title;

            try
            {
                var cantidad = SqlHelper.ExecuteScalar( this.cnn, "News_CountByTitle", qIdNewsPaper, qIdChannel, qTitle);
                if (DBNull.Value.Equals(cantidad))
                {
                    res = 0;
                }
                else
                {
                    res =(int) cantidad;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("News_CountByTitle: " + ex.Message);
            }
            finally
            {
                this.closeConection();
            }
            return res;
        }



        public DateTime? getMaxPublishedDate(int pIdNewsPaper, int pIdChannel)
        {
            this.openConection();
            DateTime? res;
            SqlTransaction tran = cnn.BeginTransaction();

            SqlParameter qIdNewsPaper = new SqlParameter("@IdNewsPaper", SqlDbType.Int);
            qIdNewsPaper.Value = pIdNewsPaper;
            SqlParameter qIdChannel = new SqlParameter("@IdChannel", SqlDbType.Int);
            qIdChannel.Value = pIdChannel;
            try
            {
                var maxdate = SqlHelper.ExecuteScalar(tran, "News_GetMaxPublishedDate", qIdNewsPaper, qIdChannel);
                if (DBNull.Value.Equals(maxdate))
                {
                    res = null;
                }
                else
                {
                    res = Convert.ToDateTime(maxdate);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("GetMaxPublishedDate: " + ex.Message);
            }
            finally
            {
                this.closeConection();
            }
            return res;
        }


        public DataSet NewsGetToExport(int cantidad)
        {
            this.openConection();
            DataSet aDs;
            SqlParameter qCantidad = new SqlParameter("@cantidad", SqlDbType.Int);
            qCantidad.Value = cantidad;
            try
            {
                aDs = SqlHelper.ExecuteDataset(this.cnn, "News_GetToExport", qCantidad);
            }
            catch (Exception ex)
            {
                throw new Exception("News_GetToExport: " + ex.Message);
            }
            finally
            {
                this.closeConection();
            }
            return aDs;
        }
        public DataSet NewsToExportGetByDate(int pFecha)
        {
            this.openConection();
            DataSet aDs;
            SqlParameter qFecha = new SqlParameter("@fecha", SqlDbType.Int);
            qFecha.Value = pFecha;
            try{
                aDs = SqlHelper.ExecuteDataset(this.cnn, "News_ToExportGetByDate", qFecha);
            }catch (Exception ex){
                throw new Exception("News_ExportGetByDate: " + ex.Message);
            }
            finally{
                this.closeConection();
            }
            return aDs;
        }
        public int NewsExportDateUpdate(int publishData, int total)
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                SqlParameter qPublishData = new SqlParameter("@publishData", SqlDbType.Int);
                qPublishData.Value = publishData;
                SqlParameter qTotal = new SqlParameter("@total", SqlDbType.Int);
                qTotal.Value = total;
                res = Convert.ToInt32(SqlHelper.ExecuteNonQuery(tran, "News_ExportDateUpdate", qPublishData, qTotal));
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
        public DataSet NewsGetExported()
        {
            DataSet aDs;
            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "News_GetExported");
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
        

        public DataSet newsGetAll()
        {
            DataSet aDs;
            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "News_GetAll");
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
        public DataSet newsGetReport()
        {
            DataSet aDs;
            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "News_GetReport");
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

        public DataSet newsGetAllMayorId(int id)
        {
            DataSet aDs;
            this.openConection();
            try

            {
                SqlParameter qId = new SqlParameter("@id", SqlDbType.Int);
                qId.Value = id;
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "News_GetAllGreaterThanId", qId);
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

        public DataSet News_GetChannelIdPorDescripcion(string value)
        {
            DataSet aDs;
            this.openConection();
            try
            {
                SqlParameter descripcion = new SqlParameter("@descripcion", SqlDbType.VarChar);
                descripcion.Value = value;
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "News_GetChannelIdPorDescripcion", descripcion);
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

        
        public DataSet newsPaperUrl_GetAllEnabled()
        {
            DataSet aDs;
            this.openConection();
            try
            {
                aDs = SqlHelper.ExecuteDataset(cnn, CommandType.StoredProcedure, "NewsPaperUrl_GetAllEnabled");
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




    }



}