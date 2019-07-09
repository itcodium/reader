using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using News;
using System.Threading;
using HtmlAgilityPack;
 

public partial class _Default : System.Web.UI.Page
{
private static ManualResetEvent allDone = new ManualResetEvent(false);
    public string resultados = "";
    public string process_infobae  = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        DataSet newsUrl=null;
        int IdNewsPaper, IdChannel;
        string url, nodeName;

        try {
            newsUrl = new NewsBus().newsPaperUrl_GetAllEnabled();
        }
        catch (Exception ex) {
            Response.Write("<h1>"+ ex.ToString()+"</h1>");
            return;
        }

        int infobaeCount = 0;
        int lanacionCount = 0;
        int clarinCount = 0;
         

        for (int i = 0; i < newsUrl.Tables[0].Rows.Count; i++)
        {
            DataRow dr= newsUrl.Tables[0].Rows[i];
            IdNewsPaper = Convert.ToInt32(dr["IdNewsPaper"]);
            IdChannel = Convert.ToInt32( dr["IdChannel"]);
            url = dr["Url"].ToString();
            nodeName = dr["RssNodeName"].ToString();
            // Response.Write("Node Name:"+nodeName); 
            switch (dr["Diario"].ToString())
            {
                case "CLARIN":
                    try{
                        var clarin = new RssClarinReader(IdNewsPaper, IdChannel, url, nodeName);
                        clarinCount = clarinCount + clarin.getRss(Response);
                         // Response.Write("<p> clarin.getRss(): " + clarinCount.ToString() + "</p>");
                    }catch (Exception ex){
                        Response.Write("<h4> clarin.getRss(): " + ex.ToString() + "</h4>");
                    }
                    break;
                case "NACION":
                    try
                    {
                        var nacion = new RssNacionReader(IdNewsPaper, IdChannel, url, nodeName);
                        lanacionCount = lanacionCount + nacion.getRss(Response);
                    }catch (Exception ex){
                        Response.Write("<h4>" + ex.ToString() + "</h4>");
                    }
                    
                    break;
                case "INFOBAE":
                    try{
                        process_infobae += url+"<br>";
                        var infobae = new RssInfobaeReader(IdNewsPaper, IdChannel, url, nodeName);
                        infobaeCount = infobaeCount + infobae.getRss(Response);
                    }catch (Exception ex){
                        Response.Write("<h4>" + ex.ToString() + "</h4>");
                    }
                    break;
                default:
                    break;
            }
        }

        resultados = "<h4> Infobae:" + infobaeCount.ToString() + "</h4>";
        resultados += "<h4> Clarin:" + clarinCount.ToString() + "</h4>";
        resultados += "<h4> La Nacion:" + lanacionCount.ToString() + "</h4>";
            
    }
}




        