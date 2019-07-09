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
/// Descripción breve de News
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class NewsPaper : System.Web.Services.WebService {

    public NewsPaper()
    {
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hola a todos";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void NewsPaperGetAll()
    {


        
        NewsPaperBus newspaper = new NewsPaperBus();
        DataTable dt;
        string strTable = "";
        try
        {
            dt = newspaper.NewsPaperGetAll().Tables[0];
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
    public void NewsGetByNewsPaper(int IdNewsPaper)
    {
        NewsPaperBus newspaper = new NewsPaperBus();
        DataTable dt;
        string strTable = "";
        string strNewsPaper="";
        try
        {
            DataRow dr= newspaper.NewsPaperGetById(IdNewsPaper);
            strNewsPaper = dr["Nombre"].ToString();
            dt = newspaper.NewsGetByNewsPaper(IdNewsPaper).Tables[0];
            DataTableToString d = new DataTableToString();
            strTable = d.ConvertDataTableToString(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

        Context.Response.ContentType = "application/json;charset=utf-8";
        //  Context.Response.Write(Context.Request["callback"] + "(" + strTable + ")");
        Context.Response.Write(Context.Request["callback"] + "( [{\"NewsPaper\":\"" + strNewsPaper + "\"} ,{\"data\": " + strTable + "}])");
    }

    
    
}

