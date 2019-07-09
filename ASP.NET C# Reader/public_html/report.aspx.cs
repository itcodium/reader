using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using News;
using System.Data;

public partial class report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DataSet ds= new NewsBus().newsGetReport();
        grvReport.DataSource = ds;
        grvReport.DataBind();
        

    }
}