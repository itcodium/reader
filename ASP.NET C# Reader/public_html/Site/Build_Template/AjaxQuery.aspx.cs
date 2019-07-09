using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site_Build_Template_AjaxQuery : System.Web.UI.Page
{
    public string p = "%";
    public string name = "__Columns";
    public string path;
    // "+pModelName+@"+
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnCrear_Click(object sender, EventArgs e)
    {

        name = txtNombreObjeto.Text;
        path = Server.MapPath("") + "\\" + name;
        if (!Directory.Exists(path)){
            Directory.CreateDirectory(path);
        }

        foreach (ListItem item in lstCampos.Items)
        {
            Response.Write(item.Text);
        }
        // Gordon,and,Harvey,Dent,launch,an,assault 
        createModel(name);
        createView(name);
        createControler(name);
        createTemplate(name);
    }

    public void createModel(string pModelName)
    { 
        string model = 
            @"" + pModelName + @" = Backbone.Model.extend({";
            model = model + getModelList() + @"
        });" + "\n\n" + pModelName + @"List = Backbone.Collection.extend({
                        model: " + pModelName + @"
                    });
            ";
        System.IO.File.WriteAllText(path + "\\" + pModelName + ".model.js", model);

       }

    public string getModelList() {
        string items = "";
        string coma = ",";
        int i = 0;
        foreach (ListItem item in lstCampos.Items)
        {
            if (i == lstCampos.Items.Count - 1)
            {
                coma = "";
            }
            items += "\n\t\t\t" + item.Text + ":" + "''" + coma;
            i++;
        }
        return items;
    }
    public void createView(string pModelName)
    {

        string view = @" 
" + pModelName + @"View = Backbone.View.extend({
    initialize: function () {
        this.render();
    },
    render: function () {

        var variables = {};

        try {

            this.cancel();
            this.updateView();

            this.template = _.template($(""#"" + " + pModelName + @"ControlConfig.Template).html());

            console.log(""this.model"", $(""#"" + " + pModelName + @"ControlConfig.Template).html());
            $(""#"" + " + pModelName + @"ControlConfig.Content).empty();
            $(this.el).html(this.template({
                lst" + pModelName + @": this.model.toJSON()
            }));

            $(""#"" + " +pModelName +@"ControlConfig.Content).removeClass(""content-spin"");
            $(""#"" + " +pModelName +@"ControlConfig.Name+ ""Box"").slideDown();
            return this;
        } catch (err) {
            console.log(""View: "" + err.message);
        }
    }
    ,
    events: {
    //""click .item"": ""click_SelectItem"",
},
init: function () {

},
click_close: function (event) {
    this.updateView();
},
click_SelectItem: function (e) {
 
},
cancel: function () {
    //$(this.el).undelegate('.item', 'click');
},
updateView: function () {

    this.undelegateEvents();
    this.$el.html("""");
},
click_download: function (e) {
}

});

";

        System.IO.File.WriteAllText(path + "\\" + pModelName + ".view.js", view);
    }


    public void createControler(string pModelName)
    {
        
        string controler= @"
var pnl"+pModelName+@";
var lst"+pModelName+@"= new "+pModelName+@"List();


var "+pModelName+@"ControlConfig = {    Name: '"+pModelName+@"',
                                Template:  """+pModelName+@"Template"",
                                Content: """+pModelName+@"Panel""
                                };

                                                        
var "+pModelName+@"Controler = function (token) {
    
    var url = DB_SRV.url + DB_SRV.servicio.databases;

    this.AjaxCall = function (pUrl, pCallback, data) {
        $.ajax({ url: pUrl,
            dataType: 'jsonp',
            type: 'POST',
            data: data,
            async: false,
            timeout: 10000,
            success: pCallback,
            error: function (x, t, m) {
                if (t == 'timeout') {
                    alert('Timeout');
                } else {
                    alert(x.responseText);
                }
            }
        });
    }

    this."+pModelName+@"GetByTable = function (pData) {
        var vUrl = url + '/"+pModelName+@"GetByTable';
        this.AjaxCall(vUrl, "+pModelName+@"_callback, pData);
    }
     
};

var "+pModelName+@"_callback = function (response) {
    $.each(response, function (i, value) {
        var p = new "+pModelName+@"({ _id: i,
            " + getModelList() + @"
        });
        lst" +pModelName+@".add(p);
    });

    
     pnl"+pModelName+@"= new "+pModelName+@"View({ el: $('#"+pModelName+"'"+@"+ControlConfig.Content),
        model: lst"+pModelName+@"
    });
 
}
";

        System.IO.File.WriteAllText(path + "\\" + pModelName + ".controler.js", controler);

    }
    public void createTemplate(string pModelName)
    {

        string Template = @" 
<!DOCTYPE HTML>
<html>
  <head>
 <meta charset=""UTF-8"">
     <META HTTP-EQUIV=""CACHE-CONTROL"" CONTENT=""NO-CACHE"">
     <META HTTP-EQUIV=""PRAGMA"" CONTENT=""NO-CACHE"">
	<meta name=""viewport"" content=""width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"">
	<meta name=""apple-mobile-web-app-capable"" content=""yes"">
	<meta name=""apple-mobile-web-app-status-bar-style"" content=""black"">
</head>

<body>
    <div id="""+pModelName+@"Panel"" class=""content""></div>

    <script src=""common.js""></script>
    
    <script src=""../../js/jquery-1.7.2.min.js""></script>
    <script src=""../../js/backboneJS/underscore-min.js""></script>
    <script src=""../../js/backboneJS/backbone-min.js""></script>
    
    <script src=""pages/"+pModelName+@"/"+pModelName+@".model.js""></script>
    <script src=""pages/"+pModelName+@"/"+pModelName+@".controler.js""></script>
    <script src=""pages/"+pModelName+@"/"+pModelName+@".view.js""></script>
    
    <script type=""text/javascript"">
        $(document).ready(function () {
            var "+pModelName.ToLower()+@"= new "+pModelName+@"Controler();
                " + pModelName.ToLower() + @".GetData(" + pModelName + @"_callback);
        });
    </script>


    <script type=""text/x-underscore-template"" id=""" +pModelName+@"Template"">
        <ul>
            <%for (var i = 0, len =  lst"+pModelName+@".length; i < len; i++){%> 
                        <li data-name=""<%= lst"+pModelName+@"[i].name%>"">
					    <span class=""label""><%= lst" + pModelName + @"[i].name%></b></span>
                        </li>
            <% }; %>    
        </ul>
    </script> 

</body>
</html>
";
        System.IO.File.WriteAllText(path + "\\" + pModelName + ".html", Template);
}




    protected void btnAddITem_Click(object sender, EventArgs e)
    {

        if (txtItemName.Text.IndexOf(",") != -1)
        {
            string[] split = txtItemName.Text.Split(',');
            foreach (string s in split)
            {
                string s2 = s.Trim();
                if (s2 != "") {
                    ListItem item = lstCampos.Items.FindByText(s2);
                    if (item == null)
                    {
                        lstCampos.Items.Add(new ListItem(s2.ToLower()));
                    }
                    else
                    {
                        lblError.Text += "El item <b>"+s2+"</b> ya existe.<br>";
                    }
                }
                    
            }
        }
        else {
            ListItem item = lstCampos.Items.FindByText(txtItemName.Text);
            if (item == null)
            {
                lstCampos.Items.Add(new ListItem(txtItemName.Text.ToLower()));
            }
            else
            {
                lblError.Text = "El item ya existe";
            }
        }
        


        

        
    }
}