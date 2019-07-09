using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.IO;
using System.Text;
using System.Threading;
using HtmlAgilityPack;
using System.Xml;
using System.Xml.Linq;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using News;
/// <summary>
/// Descripción breve de Clarin
/// </summary>
public abstract class RssReader
{
    protected XElement xEle = null;
    protected NewsBus pNew = new NewsBus();
    protected int IdNewsPaper;
    protected int IdChannel;
    protected string url;
    protected string nodeName;

    public RssReader()
    { 
    }
    public RssReader(int pIdNewsPaper, int pIdChannel, string pUrl, string pNodeName)
	{
        
        IdNewsPaper=pIdNewsPaper;
        IdChannel=pIdChannel;
        url=pUrl;
        nodeName=pNodeName;
        
        try
        {
            xEle = XElement.Load(pUrl);
        }
        catch (Exception ex)
        {
            this.saveLog(ex.Message);
        }
	}
    public void saveLog(string msj){
     DataRow drLog = new dsNewsReader().Tables["NewsLog"].NewRow();
            drLog["IdNewsPaper"] = IdNewsPaper;
            drLog["IdChannel"] = IdChannel;
            drLog["Description"] = msj;
            pNew.newsLog_Insert(drLog);
    }
    public abstract int getRss(HttpResponse res);
 
    public string replaceCDATA(string data){
        return data.Replace("<![CDATA[", "").Replace("]]>", "");
    }

    public static string RemoveHTML(string strHTML)
    {
        return Regex.Replace(strHTML, "<(.|\n)*?>", "");
    }
}



public static class DocumentExtensions
{
    public static XmlDocument ToXmlDocument(this XDocument xDocument)
    {
        var xmlDocument = new XmlDocument();
        using (var xmlReader = xDocument.CreateReader())
        {
            xmlDocument.Load(xmlReader);
        }
        return xmlDocument;
    }

    public static XDocument ToXDocument(this XmlDocument xmlDocument)
    {
        using (var nodeReader = new XmlNodeReader(xmlDocument))
        {
            nodeReader.MoveToContent();
            return XDocument.Load(nodeReader);
        }
    }
}  