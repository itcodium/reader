using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace News { 
 
    public class UsuarioBus 
    {
        private UsuarioData usuario=new UsuarioData();

        public UsuarioBus()
        {
		}
        public int UsuarioInsert(DataRow drUser)
        {
            return usuario.UsuarioInsert(drUser);
        }

    }
}

 
			