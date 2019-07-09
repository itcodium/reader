var ColumnsConfig = {
    SwipPanel: "ColumnsSwip",
    Temlate: "ColumnsTemplate"
}

// ----------------------------------------------------
// -- Controler
// ----------------------------------------------------

var url = DB_SRV.url + DB_SRV.servicio.databases;

var ColumnsControler = function(token) {
    this.ColumnsGetByTable = function(pData, pCallBack) {
        var vUrl = DB_SRV.url + DB_SRV.servicio.databases + '/ColumnsGetByTable';
        this.AjaxCall(vUrl, pCallBack, pData);

    }

    this.ColumnsSetEnabled = function(pData, pCallBack) {

        console.log("ColumnsSetEnabled ", pData);
        var vUrl = DB_SRV.url + DB_SRV.servicio.databases + '/ColumnsSetEnabled';
        this.AjaxCall(vUrl, pCallBack, pData);

    }

};

ColumnsControler.prototype = new AjaxCaller; // AjaxCaller => Pages/Common.js


var lstColumns = new ColumnsList();


// ----------------------------------------------------
// -- View
// ----------------------------------------------------

ColumnsView = Backbone.View.extend({
    initialize: function(options) {
        this.options = options || {};
        this.el = this.options.el;
        this.render();
    },
    click_item: function(p) { console.log("**** ColumnsView click_item:  ***", p); },
    render: function() {
        try {
            var template = _.template($("#" + ColumnsConfig.Temlate).html());
            this.$el.append(template({ models: this.model.models, ParentID: this.options.ParentID }));
            columnsSwipScroll = new iScroll(this.options.ParentID + "_TemplateContentPanel");
            this.click_item = this.options.click_item;
            return this;
        } catch (err) {
            console.log("Error ColumnsView!! " + err.message);
        }
    },
    events: {
        "click .item": "click_item",
        "click .link": "click_link"

    },
    getTitle: function(e) {
        console.log("Title");
    },
    click_SelectItem: function(e) {
        console.log("click_SelectItem ", e);
        this.click_item(e.currentTarget);
        if ($(e.currentTarget).hasClass("selected")) {
            $(e.currentTarget).removeClass("selected");
        } else {
            $(e.currentTarget).addClass("selected");
        }
        e.stopPropagation();
        e.preventDefault();
    },
    click_link: function(e) {
        //console.log("click_SelectItem ", $(e.currentTarget).children()[0], $(e.currentTarget).children()[0]);
        console.log("click_SelectItem ");
        if ($(e.currentTarget).attr('checked') == "checked") {
            
            $(e.currentTarget).attr('checked', 'checked');
        } else {
            $(e.currentTarget).removeAttr('checked');
        }
        e.stopPropagation();
        e.preventDefault();
    }
});


