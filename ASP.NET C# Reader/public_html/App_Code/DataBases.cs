﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using News;
/// <summary>
/// Descripción breve de DataBases
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class DataBases : System.Web.Services.WebService {

    public DataBases () {

        //Eliminar la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hola a todos :)";
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void TableGetAll(string schema)
    {
        CatalogBus catalog = new CatalogBus();
        DataTable dt;
        var strTable="";
        try
        {
            dt = catalog.TablesGetAll(schema).Tables[0];
            DataTableToString d = new DataTableToString();
            strTable = d.ConvertDataTableToString(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "(" + strTable + ")");
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void TableFilter(string schema, string filter)
    {
        CatalogBus catalog = new CatalogBus();
        DataTable dt = catalog.TablesFilter(schema,filter).Tables[0];

        Table[] c = new Table[dt.Rows.Count];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            c[i] = new Table();
            c[i].object_id = dt.Rows[i]["object_id"].ToString();
            c[i].name = dt.Rows[i]["name"].ToString();
            c[i].schema_id = dt.Rows[i]["schema_id"].ToString();
            c[i].schema_name = dt.Rows[i]["schema_name"].ToString();
            c[i].create_date = dt.Rows[i]["create_date"].ToString();
            c[i].modify_date = dt.Rows[i]["modify_date"].ToString();
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "(" + new JavaScriptSerializer().Serialize(c) + ")");
    }

    

        [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void TableNavigate(string schema, string table)
    {
         CatalogBus catalog = new CatalogBus();
            DataSet dsNav= catalog.TableNavigate(schema, table);
            DataTable dt = dsNav.Tables[0];
            DataTable dtType = dsNav.Tables[1];
         

        DataTableToString d = new DataTableToString();
        string strTable = d.ConvertDataTableToString(dt);

        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "( [{\"schema\":\"" + schema + "\", \"table\":\"" + table + "\", \"type\":\"" + dtType.Rows[0]["type"].ToString() + "\", \"pk\":\"" + dtType.Rows[0]["pk"].ToString() + "\" } ,{\"datos\": " + strTable + "}])");
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void ColumnsGetByTable(string schema,string table)
    {
        CatalogBus catalog = new CatalogBus();
        DataTable dt = catalog.ColumnsGetByTable(schema, table).Tables[0];

        Column[] c = new Column[dt.Rows.Count];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            c[i] = new Column();
            c[i].object_id = dt.Rows[i]["object_id"].ToString();
            c[i].column_id = dt.Rows[i]["column_id"].ToString();
            c[i].name = dt.Rows[i]["name"].ToString();
            c[i].type_name = dt.Rows[i]["type_name"].ToString();    
            c[i].max_length = dt.Rows[i]["max_length"].ToString();
            c[i].enabled = dt.Rows[i]["enabled"].ToString();

            
        }

        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "( [{\"schema\":\"" + schema + "\" , \"table\":\"" + table + "\"} ,{\"datos\": " + new JavaScriptSerializer().Serialize(c) + "}])");
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void TableSelectQuery(string schema, string table, string alias,string filter) 
    {
         
        CatalogBus catalog = new CatalogBus();
        DataTable dt = catalog.TableSelectQuery(schema, table, alias, filter).Tables[0];
        
        Query[] q = new Query[dt.Rows.Count];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            q[i] = new Query();
            q[i].query= dt.Rows[i]["query"].ToString();
            q[i].table = schema+"."+table;
            
        }
        
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "(" + new JavaScriptSerializer().Serialize(q) + ")");
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void TableSelectData(string schema, string table, string alias, string filter)
    {

        CatalogBus catalog = new CatalogBus();
        DataTable dt;  
        DataTableToString d  ;
        string strTable = "{}";
        int result= 0;
        var message = "";
        try
        {
            d = new DataTableToString();
            dt = catalog.TableSelectData(schema, table, alias, filter).Tables[0];
            strTable =d.ConvertDataTableToString(dt);
        }
        catch (Exception ex)
        {
            result= -1;
            message = ex.Message;
        }

        string resEstado = "{\"result\":\"" + result.ToString() + "\", \"message\":\"" + message + "\"}";

        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "( [ " + resEstado + ",{\"schema\":\"" + schema + "\", \"table\":\"" + table + "\"} ,{\"datos\": " + strTable + "}])");
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void SaveUser(string Nombre, string Email)
    {

        DataRow drUsuario = new dsNorthwind().Tables["Usuarios"].NewRow();
        UsuarioBus usr= new UsuarioBus();
        Messages q = new Messages();
                 
        
        drUsuario["Nombre"] = Nombre;
        drUsuario["Email"] = Email;

        try
        {
            q.value = usr.UsuarioInsert(drUsuario);
            if (q.value == 1)
            {
                q.message = "Los datos se grabaron correctamente.";
            }
            else {
                q.message = "Los datos no han sido guardados.";
            }
        }
        catch (Exception ex)
        {
            q.value = -1; 
            q.message = ex.Message;
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "(" + new JavaScriptSerializer().Serialize(q) + ")");
    }


     [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void ColumnsSetEnabled(Int64 object_id, string name, bool enabled)
    {

    
        CatalogBus usr= new CatalogBus();
        Messages q = new Messages();
        try
        {
            q.value = usr.ColumnsSetEnabled(object_id, name, enabled);
            if (q.value == 1)
            {
                q.message = "Los datos se actualizaron correctamente.";
            }   
            else {
                q.message = "Los datos no han sido guardados.";
            }
        }
        catch (Exception ex)
        {
            q.value = -1;
            q.message = "ColumnsSetEnabled: " + ex.Message;
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + "(" + new JavaScriptSerializer().Serialize(q) + ")");
    }


    

 

}
