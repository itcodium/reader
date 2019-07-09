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
 
using System.Xml;
using System.Xml.Linq;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
 
/// <summary>
/// Descripción breve de Clarin
/// </summary>
public class ParseDateTime
{
    //  Tue, 21 Mar 2017 02:25:22 -0000

        int day;
        int month;
        int year;
    public ParseDateTime()
    { 
    }
    public DateTime getDateTime()
    {
        return new DateTime(this.year, this.month, this.day);
    }
    public ParseDateTime(string fecha )
	{

        string[] part = fecha.Split(',')[1].Trim().Split(' ');

        Dictionary<string, int> myList = new Dictionary<string, int>();
        myList.Add("JAN",1);
        myList.Add("FEB",2);
        myList.Add("MAR",3);
        myList.Add("APR",4);
        myList.Add("MAY",5);
        myList.Add("JUN",6);
        myList.Add("JUL",7);
        myList.Add("AUG",8);
        myList.Add("SEP",9);
        myList.Add("OCT",10);
        myList.Add("NOV",11);
        myList.Add("DEC",12);
    

        day = Convert.ToInt16( part[0]);
        month=(int) myList[part[1].ToUpper()];
        year = Convert.ToInt16( part[2].ToString());
       

        
 
	}
     
}

 