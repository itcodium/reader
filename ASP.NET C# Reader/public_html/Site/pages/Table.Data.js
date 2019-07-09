
var pColumnsControlerData = new ColumnsControler();


function menu_columns_click(e) {
    console.log("menu_columns_click(e) ", app_storage.get("schema"), app_storage.get("table"));
    pColumnsControlerData.ColumnsGetByTable({ schema: app_storage.get("schema"), table: app_storage.get("table") }, Columns_Data_Callback);
}

function menu_Refreshcolumns_click(e) {
    console.log("menu_Refreshcolumns_click", app_storage.get("schema"), app_storage.get("table"), "APP_TABLE_FILTER ", APP_TABLE_FILTER);
    
    var ctrlTables = new TablesControler();
    ctrlTables.TableSelectData(tables_selectData_callback,{ schema: app_storage.get("schema"), table: app_storage.get("table"), alias: "", filter: APP_TABLE_FILTER });
}


TableDataView = Backbone.View.extend({
    initialize: function (options) {
        this.options = options || {};
        this.el = this.options.el;
        this.render();
    },
    render: function () {
        try {
  
            var data = { schema: this.model.data[1].schema, table: this.model.data[1].table };
            var table_data_menu = new MenuControl();
            table_data_menu.add('Columnas', 'Filtrar Columnas', "menu_columns_click(this);", data);
            table_data_menu.add('Refresh', 'Actualizar', "menu_Refreshcolumns_click(this);", data);

            var menuColumns = new TableMenu({ el: $("#" + this.options.ParentID + "_MenuContent"), model: table_data_menu.getMenu() });
            this.$(".pageTitleContent").html(this.model.data[1].schema + "." + this.model.data[1].table);
            this.refreshView();
            return this;
        } catch (err) {
            console.log("TableDataView: " + err.message);
        }
    },
    refreshView: function (p) {
        $("#" + this.options.ParentID + "_TemplateContentPanel").remove();
        this.template = _.template($("#" + this.options.template).html());
        this.$el.append(this.template({ ParentID: this.options.ParentID }));
        $("#" + this.options.ParentID).css("display", "block");
        $("#" + this.options.ParentID).parent().show();
    },
    events: {
},
updateView: function () {
    this.undelegateEvents();
    this.$el.html("");
}
});



// ----------------------------------------------------
// -- Callbacks
// ----------------------------------------------------

var Columns_Data_Callback = function (response) {
    console.log("Columns_Data_Callback", response);
    lstTableColumnsData.reset();
    $.each(response[1].datos, function (i, value) {
        var p = new Columns({ _id: i,
            object_id: value.object_id,
            column_id: value.column_id,
            name: value.name,
            type_name: value.type_name,
            max_length: value.max_length,
            enabled: value.enabled
        });
        console.log("ENABLED COLS", value.enabled, p.enabled)
        lstTableColumnsData.add(p);
    });
    $("#Loading").hide();

    var p = new PanelView({ model: lstTableColumnsData,
        el: TableDataConfig.Panel(),
        template: ColumnsConfig.Template(),
        title: response[0].schema + "." + response[0].table
    });
    p.set_ClickItem(column_item_click);
    p.setView("Columns");
}


function column_item_click(p) {
    var c = new ColumnsControler();
    var enabled;
    if ($(p.currentTarget).hasClass("selected")) {
        enabled=false;
        $(p.currentTarget).removeClass("selected");
    } else {
        enabled=true;
        $(p.currentTarget).addClass("selected");
    }

    c.ColumnsSetEnabled({ object_id: $(p.currentTarget).data("object_id"), name: $(p.currentTarget).data("name"), enabled: enabled }, ColumnsSetEnabled_callback);
}



var ColumnsSetEnabled_callback = function (response) {

    console.log("ColumnsSetEnabled_callback  response", response);
    if (response.value == 1) {
        //pnlFormUser.hide();
       // alert(response.message);
    } else {
     //   alert(response.message);
    }
    ctrlTables.HideAjaxSpin();
}


