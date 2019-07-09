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

public class RssInfobaeReader:RssReader
{
    public RssInfobaeReader()
	{
	}
    public RssInfobaeReader(int pIdNewsPaper, int pIdChannel, string pUrl, string pNodeName)
        : base(pIdNewsPaper, pIdChannel, pUrl, pNodeName)
    {
    }

   

    public override int getRss(HttpResponse res)
    {
        var items = xEle.Descendants(nodeName);
        string error = "";
        int counter = 0;
        DateTime? maxdate;
        int cantTitle = 0;
        maxdate = null;
        foreach (var item in items)
        {
            DateTime pData = DateTime.Now;

            try
            {
                pData = Convert.ToDateTime(item.Element("pubDate").Value);
            }
            catch (Exception ex){
                    pData = new ParseDateTime(item.Element("pubDate").Value).getDateTime();
            }

             
            DataRow drNew = new dsNewsReader().Tables["News"].NewRow();

            Uri myUri = new Uri(item.Element("guid").Value);
            string host = myUri.Host;
            string strChannel = myUri.Segments[1].Replace("/","");

            if (strChannel == "economia") {
                var c = "econo";
            }
            if (strChannel == "deportes-2")
            {
                var c = "DEPOR";
                strChannel = "Deportes";
            }



            if ((strChannel == "Política" || strChannel == "politica" ||strChannel == "Economía" || strChannel == "economia" ||
                strChannel == "Deportes" || strChannel == "El Mundo" || strChannel == "Sociedad" ||strChannel == "Policiales" ||
                    strChannel == "noticias"))
            {
                int vChannel = 0;
                // int cantTitle=0;
                DataTable dtChannel = pNew.News_GetChannelIdPorDescripcion(strChannel).Tables[0];
                
              

                try{
                    vChannel = (int)dtChannel.Rows[0]["IdChannel"];
                    var vTitle=replaceCDATA(item.Element("title").Value);
                    maxdate = pNew.getMaxPublishedDate(IdNewsPaper, vChannel);
                    cantTitle= pNew.countByTitle(IdNewsPaper, vChannel,vTitle);
                    
                    drNew["IdNewsPaper"] = IdNewsPaper;
                    drNew["IdChannel"] = vChannel;
                    drNew["Title"] = vTitle;
                    drNew["Link"] = item.Element("guid").Value;
                    drNew["Description"] = RemoveHTML(replaceCDATA(item.Element("description").ToString()));
                    drNew["PublishDate"] = pData;
                    drNew["Author"] = "";

                }
                catch (Exception ex)
                {
                    // throw ex;
                    error = error + strChannel + ex.Message.ToString();
                }

                if (maxdate == null || pData > maxdate ||  cantTitle == 0)
                {
                    counter++;
                    pNew.newsInsert(drNew);
                }
            }
        }

        if (error!=""){
             throw new Exception(error);
        }
        return counter;
    }
}
 