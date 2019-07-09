using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace News { 
 
    public class CatalogBus 
    {
        private CatalogData catalog=new CatalogData();

        public CatalogBus()
        {
		}
        public DataSet TablesGetAll(string aSchema)
        {
            return catalog.TablesGetAll(aSchema);
        }

        public DataSet TablesFilter(string aSchema,string aFilter)
        {
            return catalog.TablesFilter( aSchema,aFilter);
        }

        
        public DataRow TablesGetByName(string aSchema,string aName)
        {
            return catalog.TablesGetByName(aSchema, aName);
        }
        public DataSet TableSelectQuery(string aSchema, string aName, string aAlias, string aFilter)
        {
            return catalog.TableSelectQuery(aSchema, aName, aAlias, aFilter);
        }
        public DataSet TableSelectData(string aSchema, string aName, string aAlias, string aFilter)
        {
            return catalog.TableSelectData(aSchema, aName, aAlias,aFilter);
        }
        public DataRow Columns(string aSchema, string aName)
        {
            return catalog.TablesGetByName(  aSchema,aName);
        }

        public DataSet ColumnsGetByTable(string aSchema,string aTableName) {
            return catalog.ColumnsGetByTable(aSchema, aTableName);
        }


        public int ColumnsSetEnabled(Int64 object_id, string name, bool enabled)
        {
            return catalog.ColumnsSetEnabled(object_id, name, enabled);
        }


        public DataSet TableNavigate(string aSchema, string aName)
        {

            DataTable dtType= new dsNewsReader().Tables["ListType"];
            DataRow drType = dtType.NewRow();

            drType["schema"]=aSchema;
            drType["table"]=aName;
            drType["type"] = "List";

            DataSet dstables = catalog.TableNavigate(aSchema, aName);
    
            if (dstables.Tables[0].Rows.Count != 0)
            {
                DataSet dstableData=null;
                if (dstables.Tables[0].Rows[0]["NAVIGATE"].ToString() != "")
                {
                    dtType.Rows.Add(drType);
                    dstables.Tables.Add(dtType.Copy());
                }
                else { 
                    drType["type"]="Data";
                    drType["pk"] = dstables.Tables[0].Rows[0]["pk"].ToString();
                    dtType.Rows.Add(drType);
                    dstableData=catalog.TableSelectData(aSchema, aName, "","");
                    dstableData.Tables.Add(dtType.Copy());
                    return dstableData;
                }
                
            }

            
            return dstables;
        }
    }



}