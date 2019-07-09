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
 
 

/// <summary>
/// Descripción breve de Clarin
/// </summary>
public class RssNacionReader:RssReader
{
    XmlDocument RSSXml = new XmlDocument();
    public RssNacionReader()
	{
      
	}

    public RssNacionReader(int pIdNewsPaper, int pIdChannel, string pUrl, string pNodeName)
    {
        IdNewsPaper = pIdNewsPaper;
        IdChannel = pIdChannel;
        url = pUrl;
        nodeName = pNodeName;
        try
        {
            RSSXml.Load(url);
        }
        catch (Exception ex)
        {
            this.saveLog(ex.Message);
        }
    }

    public override int getRss(HttpResponse res)
    {

        XmlNodeList authorsList = RSSXml.GetElementsByTagName(nodeName);
        XDocument xmlDoc = RSSXml.ToXDocument();
        DateTime? maxdate = pNew.getMaxPublishedDate(IdNewsPaper, IdChannel);
        int lanacionCounter = 0;
        foreach (XmlNode RSSNode in authorsList)
        {
            /*
            string title = RSSNode["title"].InnerText.ToString();
            string link = RSSNode["link"].InnerText.ToString();
            
            string content = RSSNode["content"].InnerText;
            */
            DateTime updated = Convert.ToDateTime( RSSNode["updated"].InnerText.ToString());
            XmlNode nAuthor = RSSNode["author"];
            string strAuthor = nAuthor["name"].InnerText.ToString() + ";" +
                               nAuthor["uri"].InnerText.ToString() + ";" +
                               nAuthor["email"].InnerText.ToString();

            DataRow drNew = new dsNewsReader().Tables["News"].NewRow();
            drNew["IdNewsPaper"] = IdNewsPaper;
            drNew["IdChannel"] = IdChannel;
            drNew["Title"] = RSSNode["title"].InnerText.ToString();
            drNew["Description"] = RSSNode["content"].InnerText;
            drNew["PublishDate"] = updated;
            drNew["Link"] = RSSNode["link"].Attributes["href"].Value;
            drNew["Author"] = strAuthor;

            if (maxdate == null || updated > maxdate)
            {
                lanacionCounter++; 
                pNew.newsInsert(drNew);
            }

        }
        return lanacionCounter;
    }
}


/*
 Remove Tag 

HtmlDocument doc = new HtmlDocument();
doc.LoadHtml("<p><b>Cristina Kirchner</b> expresó su "orgullo" por el aval del organismo al planteo argentino para que se elabore un <a href="http://www.infobae.com/2014/09/09/1593689-kicillof-y-giorgi-acusaran-las-automotrices-tener-plazos-fijos-us2500-millones">marco regulatorio para reestructuraciones de deuda. </a> Además cuestionó a ruralistas</p><p></p>");
foreach (var node in doc.DocumentNode.SelectNodes("//img|//img").ToArray())
{
    var replacement = doc.CreateTextNode(" ");
    node.ParentNode.RemoveChild(node);
}
 
 */