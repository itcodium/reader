using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace News { 

public class UsuarioData : DataAccess
    {
        public int UsuarioInsert(DataRow aDr)
        {
            this.openConection();
            int res = -1;
            SqlTransaction tran = cnn.BeginTransaction();
            try
            {
                res = Convert.ToInt32(SqlHelper.ExecuteNonQueryTypedParams(tran, "usp_usuario_save", aDr));
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
 
			