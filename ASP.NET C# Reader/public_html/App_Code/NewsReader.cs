using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
 
 
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Web.Script.Serialization;

 
using System.Data;
using News;
/// <summary>
/// Descripción breve de NewsReader
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class NewsReader : System.Web.Services.WebService {

    public NewsReader () {

        //Eliminar la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hola a todos";
    }

    [WebMethod]
    public DataSet newsGetAll()
    {
        NewsBus n = new NewsBus();
        return n.newsGetAll();
    }

    [WebMethod]
    public DataSet newsGetReport()
    {
        NewsBus n = new NewsBus();
        return n.newsGetReport();
    }
     
    [WebMethod]
    public string test(int id)
    {
        return "Hola a test";
    }
   

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void newsGetAllMayorId(int id)
    {
        NewsBus news= new NewsBus();
        DataTable dt;
        string strTable = "";
        try
        {
            dt = news.newsGetAllMayorId(id).Tables[0];
            DataTableToString d = new DataTableToString();
            strTable = d.ConvertDataTabletoCSV(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] +  strTable );
    }


    
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void NewsGetToExport(int cantidad)
    {
        NewsBus news = new NewsBus();
        DataTable dt;
        string strTable = "";
        try
        {
            dt = news.NewsGetToExport(cantidad).Tables[0];
            DataTableToString d = new DataTableToString();
            strTable = d.ConvertDataTableToString(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + strTable);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void NewsExportGetByDate(int fecha)
    {
        NewsBus news = new NewsBus();
        DataTable dt;
        string strTable = "";
        try
        {
            dt = news.NewsToExportGetByDate(fecha).Tables[0];
            DataTableToString d = new DataTableToString();
            strTable = d.ConvertDataTableToString(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + strTable);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void NewsExportDateUpdate(int publishData, int total)
    {
        NewsBus news = new NewsBus();
        int res;
        string strTable = "";
        try
        {
            res = news.NewsExportDateUpdate(publishData, total);
            DataTableToString d = new DataTableToString();
            strTable ="{ total:"+ res.ToString()+ "}";
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + strTable);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void NewsGetExported()
    {
        NewsBus news = new NewsBus();
        DataTable dt;
        string strTable = "";
        try
        {
            dt = news.NewsGetExported().Tables[0];
            DataTableToString d = new DataTableToString();
            strTable = d.ConvertDataTableToString(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        Context.Response.ContentType = "application/json;charset=utf-8";
        Context.Response.Write(Context.Request["callback"] + strTable);
    }
    


}

