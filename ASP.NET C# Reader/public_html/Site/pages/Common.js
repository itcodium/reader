﻿var DB_SRV = {
    //url: "http://localhost/ReaderNews",
    //url: "http://localhost:4419/ReaderNews",
    // url: "http://news.ilimek.com.ar",
    url: "http://v0011129.ferozo.com/",
    servicio: { databases: "/DataBases.asmx" }
};
 
// --------------------------------------------------

var AjaxCaller = function(token) {
    var ajaxSpinContent = "";
    this.Url = DB_SRV.url + DB_SRV.servicio.databases;

    this.setAjaxSpin = function(p) {
        ajaxSpinContent = p;
    }
    this.getAjaxSpin = function() {
        return ajaxSpinContent;
    }
    this.hideSpin = function() {
    $(ajaxSpinContent).hide();
    }
    
    this.AjaxCall = function(pUrl, pCallback, data) {
        $(ajaxSpinContent).fadeIn(400, function() {
            $.ajax({ url: pUrl,
                dataType: 'jsonp',
                contentType: "application/json; charset=utf-8",
                crossDomain: true,
                type: "POST",
                data: data,
                async: false,
                timeout: 10000,
                success: pCallback,
                error: function(x, t, m) {
                    if (t == "timeout") {
                        alert("Timeout");
                    } else {
                        alert(x.responseText);
                    }
                    $(ajaxSpinContent).hide();
                }
            });
        });
    }
}

Date.prototype.yyyymmdd = function () {
    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString(); // getMonth() is zero-based         
    var dd = this.getDate().toString();

    return yyyy + '-' + (mm[1] ? mm : "0" + mm[0]) + '-' + (dd[1] ? dd : "0" + dd[0]);
};  



// -- Table MenuView ---------------------------------

var MenuType = { button: "BUTTON", filter: "FILTER" }

//alert(MenuType.button);
//table_menu.addFilter
Menu = Backbone.Model.extend({
    name: '',
    idmodel: function() { return this.cid; },
    filter:'',
    label: '',
    param: '',
    type: '',
    onClick: '',
    onClickRemove: ''
});

MenuList = Backbone.Collection.extend({
    model: Menu
});

var MenuControl = function () {
    this.menu = new MenuList();

    this.add = function (pName, pLabel, pOnClick, aParam) {
        this.menu.add(new Menu({ type: MenuType.button, name: pName, label: pLabel, onClick: pOnClick, param: aParam }));
        //console.log("this.add ", aParam, this.menu);
    }
    this.addFilter = function (pName, pLabel, pOnClick, pOnClickRemove) {
        this.menu.add(new Menu({ type: MenuType.filter, name: pName, label: pLabel, onClick: pOnClick, onClickRemove: pOnClickRemove }));
    }
    this.getMenu = function () {
        return this.menu;
    }
    this.getItem = function (id, name) {
        var res = this.menu.get(id).get(name);
        if (typeof res == 'undefined') {
            res = "";
        }
        return res;
    }
    this.setItem = function (id, name, value) {
        this.menu.get(id).set(name, value);
    }

}

TableMenu = Backbone.View.extend({
    initialize: function (options) {
        this.options = options || {};
        this.el = this.options.el;
        this.model.on("change", this.change, this);
        this.render();
    },
    change: function (e) {
        if (e.get("filter") != "") {
            if ($("#RemoveFilter" + e.cid).hasClass("filter")) {
                $("#RemoveFilter" + e.cid).removeClass("filter").addClass("filterRemove");
            }
        } else {
            $("#RemoveFilter" + e.cid).removeClass("filterRemove").addClass("filter");
        }
        console.log("change: function(e)", e.cid, e.get("type"), e.get("filter"));
    },
    render: function () {
        // console.log("MODEL***", this.model.models);
        var strMenuTemplate = '<%for (var i = 0, len =  model.length; i < len; i++){%>';
        strMenuTemplate += '<% var c=""; if(model[i].get("type")=="FILTER"){c="left"}%>';
        
        strMenuTemplate += '<a  data-schema="<% if (typeof model[i].get("param") != "undefined") {%><%= model[i].get("param").schema%><%} %>"';
        strMenuTemplate += '    data-table="<% if (typeof model[i].get("param") != "undefined") {%><%= model[i].get("param").table%><%} %>"';
        strMenuTemplate += '    data-cid="<%=model[i].cid%>" id="Filter<%=model[i].cid%>" class="button grey <%=c%>"';
        strMenuTemplate += '    onClick="<%=model[i].get("onClick")%>"';
        //strMenuTemplate += '    data-idmodel="<%= model[i].idmodel()%>"
        strMenuTemplate += '    >';
        strMenuTemplate += '    <%=model[i].get("label")%></a>';
        strMenuTemplate += '<% if(c!=""){%>';
        strMenuTemplate += '<a data-param="<%=model[i].get("param")%>" data-cid="<%=model[i].cid%>" id="RemoveFilter<%=model[i].cid%>" class="button grey right filter" ';
        strMenuTemplate += '         onClick="<%=model[i].get("onClickRemove")%>"';
        //strMenuTemplate += '         data-idmodel="<%=model[i].idmodel()%>"
        strMenuTemplate += '>';
        strMenuTemplate += '         &nbsp;</a></span>';
        strMenuTemplate += '    <%}%>';
        strMenuTemplate += '<% }; %>';
     
        var template = _.template(strMenuTemplate, { model: this.model.models });
        this.$el.html(template);
        return this;
    },
    events: {},
    filter: function (event) {
        console.log(event.currentTarget);
    }
});
 


// --------------------------------------------------
Table = Backbone.Model.extend({
    object_id: '',
    name: '',
    schema_id: '',
    schema_name: '',
    create_date: '',
    modify_date: '',
    selected: false
});

TableList = Backbone.Collection.extend({
    model: Table
});

// --------------------------------------------------

Columns = Backbone.Model.extend({
    object_id: '',
    column_id:'',
    name: '',
    schema_id: '',
    schema_name: '',
    create_date: '',
    modify_date: '',
    enabled:'',
    Islink:'',
    LinkText:''
});

ColumnsList = Backbone.Collection.extend({
    model: Columns
});

// --------------------------------------------------

TableNavigation = Backbone.Model.extend({
    type:'',
    schema:'',
    table:''
});

TableNavigationList = Backbone.Collection.extend({
    model: TableNavigation
});




// --------------------------------------------------


var ConfigView = function(name) {
    this.SwipPanel;
    this.Temlate = "";
    this.PanelElement = "";
    this.view_name = "";



    if (typeof name != 'undefined') {
        this.Temlate = name + "Template";
        this.PanelElement = name + "Panel";
        this.SwipPanel = name + "Swip";
        this.view_name = name ;
    }
    this.SetSwip = function(name) { this.SwipPanel = name; }
    this.SetTemplate = function(name) { this.Temlate = name; }
    this.SetPanel = function(name) { this.PanelElement = name }

    this.Swip = function() { return this.SwipPanel; }
    this.Template = function() { return this.Temlate; }
    this.Panel = function() { return this.PanelElement; }
    this.View = function() { return this.view_name; }

    this.SwipID = function() { return "#" + this.SwipPanel; }
    this.TemplateID = function() { return "#" + this.Temlate; }
    this.PanelID = function() { return "#" + this.PanelElement; }
}


 
function ValidURL(str) {

    
    var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;

    if (regexp.test(str)) {
        return '<a target="_blank" href="' + str + '">' + str + '</a>';
    } else {
    return str;
    
    }
}