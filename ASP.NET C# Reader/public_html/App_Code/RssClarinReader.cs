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
public class RssClarinReader:RssReader
{
    public RssClarinReader()
	{
	}
    public RssClarinReader(int pIdNewsPaper, int pIdChannel, string pUrl, string pNodeName)
        : base(pIdNewsPaper, pIdChannel, pUrl, pNodeName)
    {
    }
    
    public override int getRss( HttpResponse res)
    {
        IEnumerable<XElement> items;
        DateTime? maxdate;
        int clarinCounter = 0;

        try
        {
            items = xEle.Descendants(nodeName);
        }
        catch (Exception ex)
        {
            throw new Exception("<h4> xEle.Descendants(nodeName)"+ ex.ToString() +" - "+ this.url+ "</h4>");
        }
        

        try
        {
            maxdate = pNew.getMaxPublishedDate(IdNewsPaper, IdChannel);
        }
        catch (Exception ex)
        {
            throw new Exception("<h3> getMaxPublishedDate(IdNewsPaper=" + IdNewsPaper.ToString() + ", IdChannel=" + IdChannel.ToString() + " --- " + ex.ToString() + "</h3>");
        }
        

        foreach (var item in items)
        {
          
            string itemDescription = HttpUtility.HtmlDecode(item.Element("description").ToString());
            var iDescription  = new HtmlDocument();
            iDescription.LoadHtml(itemDescription);
            DateTime pData=DateTime.Now;
            
            try{
                pData = Convert.ToDateTime(item.Element("pubDate").Value);
              }catch (Exception ex){
                  pData = new ParseDateTime(item.Element("pubDate").Value).getDateTime();
            }

            iDescription .DocumentNode.Descendants()
            .Where(n => n.Name == "img" || n.Name == "br" || n.Name == "a")
            .ToList()
            .ForEach(n => n.Remove());

            DataRow drNew = new dsNewsReader().Tables["News"].NewRow();

            try{
               // res.Write("<p style=margin:0;padding:0;>" + item.Element("guid").Value + "</p>");
                drNew["IdNewsPaper"] = IdNewsPaper;
                drNew["IdChannel"] = IdChannel;
                drNew["Title"] = item.Element("title").Value;
                drNew["Description"] = iDescription.DocumentNode.InnerText.Replace("<![CDATA[", "").Replace("]]>", "");
                drNew["PublishDate"] = pData;
                drNew["Link"]=item.Element("guid").Value ;
                drNew["Author"]="";
            }catch (Exception ex){
                throw new Exception("<h4> drNew: " +  " --- " + ex.ToString() + "</h3>");
            }

            
            //if (item.Element("enclosure") != null && item.Element("enclosure").HasAttributes){
            //    item.Element("enclosure").Attribute("url").Value;
            //}


            try
            {

            if (maxdate == null || pData > maxdate){
                    clarinCounter++; 
                    pNew.newsInsert(drNew);
                }
            
            }
            catch (Exception ex)
            {
                throw new Exception("<h3> pNew.newsInsert(drNew);" + ex.ToString() + "</h3>");
            }

            
        }
        return clarinCounter;
        
    }
}
