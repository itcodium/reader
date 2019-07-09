    var TablesConfig = new ConfigView("Table");
    var TableListConfig = new ConfigView("TableList");
    var FilterConfig = new ConfigView("TableFilter");
    var TableDataConfig = new ConfigView("TableData");
    var TableDataCustomConfig = new ConfigView("TableDataCustom");
    var ColumnsConfig = new ConfigView("Columns");
    
   // ---- Controler ----------------------------------------


    
    
    var TablesControler = function(token) {
        var database = "";
        var showing = false;
        var pnlTable;


        var cTables = new TableList();

        this.reset = function() {
            cTables.reset();
        }
        this.add = function(p) {
            cTables.add(p);
        }
        this.getDatabaseName = function() {
            return database;
        }
        this.model_GetSelectedTable = function() {
            return cTables.where({ selected: true });
        }
        this.model_SetSelectedTable = function(nombre, value) {
            cTables.get(nombre).set("selected", value);
        }
        this.TableNavigate = function(pData) {
            database = pData.database;
            this.AjaxCall(this.Url + '/TableNavigate', table_Navigate_callback, pData);
        }
        this.TableGetAll = function(aCallback, pData) {
            database = pData.database;
            this.AjaxCall(this.Url + '/TableGetAll', aCallback, pData);
        }
        this.TableFilter = function(tableNameFilter) {
            this.AjaxCall(this.Url + '/TableFilter', tables_filter_callback, tableNameFilter);
        }
        this.SelectTables = function(pData) {
            this.AjaxCall(this.Url + '/TableSelectQuery', tables_select_Query_callback, pData);
        }
        this.TableSelectData = function(aCallback, pData) {
            this.AjaxCall(this.Url + '/TableSelectData', aCallback, pData);
        }
        this.SaveUser = function(pData) {
            this.AjaxCall(this.Url + '/SaveUser', SaveUser_callback, pData);
        }
        this.HideAjaxSpin = function() {
            $(this.getAjaxSpin()).hide();
        }
        this.ShowPanel = function() {
            this.HideAjaxSpin();
            if (showing == false) {
                pnlTable = new PanelView({ el: TablesConfig.Panel(), template: TablesConfig.Template(), swip: TablesConfig.Swip(), model: cTables, title: this.getDatabaseName() });
                pnlTable.setView(TablesConfig.View());
                showing = true;
            } else {
                pnlTable.refreshView();
            }
        }
        this.ShowPanelText = function(pTitulo, pdata) {
            this.HideAjaxSpin();
            pnlTableText = new PanelView({ el: TextConfig.Panel(), template: TextConfig.Template(), swip: TextConfig.Swip(), title: pTitulo });
            pnlTableText.setView_Model(TextConfig.View(), { data: pdata });
        }
    };
        
    TablesControler.prototype = new AjaxCaller; // AjaxCaller => Pages/Common.js

    var ctrlTables = new TablesControler();
        ctrlTables.setAjaxSpin("#Loading");
    var ctrlColumns = new ColumnsControler();
    var ctrTablesDataCustom = new TablesControler();
        ctrTablesDataCustom.setAjaxSpin("#Loading");
    
    // - Menu -
    
    var table_menu = new MenuControl();
        table_menu.addFilter('Filter', 'Filter', "filter_click(this);", "filterRemove(this);");
        table_menu.add('Select', 'Select', "Select();");
        table_menu.add('CreateUser', 'Crear Usuario', "CreateUser();");

    var form_Filter;
    function filter_click(e) {
            var form = new FormMaker("Filtrar Tablas");
            form.addInputHidden("id", "id", $(e).data("cid"));
            form.addInputHidden("schema", "schema", "dbo");
            form.addInputText("filter", "Filtro", table_menu.getItem($(e).data("cid"), "filter"));
            form_Filter = new FormView({ el: "TableFilterPanel", Form: form.getForm() });
            form_Filter.SetSubmit(filterTables_submit);
        }
        function filterTables_submit(p) {
            ctrlTables.TableFilter(p);
            table_menu.setItem(p.id, "filter", p.filter);
        }

        function filterRemove(e) {
            var vfilter = table_menu.getItem($(e).data("cid"), "filter"); 
            if (vfilter != "") {
                form_Filter.hide();
                table_menu.setItem($(e).data("cid"), "filter", "");
                ctrlTables.TableFilter({ schema: "", filter: "" });
            } 
        }

    function CreateUser(e) {
        var form = new FormMaker("Datos del usuario");
        form.addInputText("Nombre", "Ingresar Nombre");
        form.addInputText("Email", "Email");
        pnlFormUser = new FormView({ el: "TableFilterPanel", Form: form.getForm() });
        pnlFormUser.SetSubmit(createUser_submit);
    }

    function createUser_submit(p) {
        console.log("createUser_submit parameters", p);
        ctrlTables.SaveUser(p);
    }

    function Select(e) {
        if (app_storage.get("table") == null) {
            alert("Debe selecionar una tabla.");
            return;
        }
        ctrlTables.SelectTables({ schema: app_storage.get("schema"), table: app_storage.get("table"), alias: '' });
    }
    
//- TablesView -
    TableView = Backbone.View.extend({
        initialize: function(options) {
            this.options = options || {};
            this.el = this.options.el;
            this.render();
        },
        render: function() {
            try {
                var menu = new TableMenu({ el: $("#" + this.options.ParentID + "_MenuContent"), model: table_menu.getMenu() });
                this.refreshView();
                return this;
            } catch (err) {
                console.log("View: " + err.message);
            }
        },
        events: {
            "click .item": "click_SelectItem",
            "click .TableColumns": "click_TableColumns",
            "click .tableData": "click_TableData",
            "click .tableNavigate": "click_tableNavigate"
        },
        click_SelectItem: function(e) {
            if ($(e.currentTarget).hasClass("selected")) {
                $(e.currentTarget).removeClass("selected");
                app_storage.remove("schema");
                app_storage.remove("table");
            } else {
                $(".item").removeClass("selected");
                $(e.currentTarget).addClass("selected");
                app_storage.set("schema", $(e.currentTarget).data("schema"));
                app_storage.set("table", $(e.currentTarget).data("name"));
            }
            console.log("click_SelectItem", $(e.currentTarget).data("schema"), $(e.currentTarget).data("name")); 
            e.preventDefault();
        },
        click_TableColumns: function(e) {
            app_storage.set("schema", $(e.currentTarget).data("schema"));
            app_storage.set("table", $(e.currentTarget).data("name"));
            COLUMN_CONTROL.ColumnsGetByTable({ schema: app_storage.get("schema"), table: app_storage.get("table") }, Columns_callback);
            e.stopPropagation();
        },
        click_TableData: function(e) {
            app_storage.set("schema", $(e.currentTarget).data("schema"));
            app_storage.set("table", $(e.currentTarget).data("name"));
            ctrlTables.TableSelectData(tables_selectData_callback, { schema: app_storage.get("schema"), table: app_storage.get("table"), alias: "", filter: APP_TABLE_FILTER });
            e.stopPropagation();
        },
        click_tableNavigate: function(e) {
            ctrTablesDataCustom.TableNavigate({ schema: $(e.currentTarget).data("schema"), table: $(e.currentTarget).data("name"), alias: "" });
            lstSelecDataTree.reset();
            lstSelecDataTree.add(new Table({ schema_name: $(e.currentTarget).data("schema"), name: $(e.currentTarget).data("name") }));
            e.stopPropagation();
        },


        refreshView: function() {
            $("#" + this.options.ParentID + "_TemplateContentPanel").remove();
            var template = _.template($("#" + this.options.template).html());
            this.$el.append(template({ models: this.model.models, ParentID: this.options.ParentID }));
            var tableScroll = new iScroll(this.options.ParentID + "_TemplateContentPanel");
        }
    });
// ***********************************************
    //- TablesView -
    TableDataCustomView = Backbone.View.extend({
        data: '',
        initialize: function(options) {
            this.options = options || {};
            this.el = this.options.el;
            this.render();
        },
        render: function() {
        alert("TableDataCustomView");
            this.unbind();
            try {
                // var data = { schema: this.model.data[0].schema, table: this.model.data[0].table, pk: this.model.data[0].pk };

                this.refreshView();
                return this;
            } catch (err) {
                console.log("View: " + err.message);
            }
        },
        events: {
            "click .item": "click_SelectItem"
        },
        click_SelectItem: function(e) {
            var item = lstSelecDataTree.first();
            var pk = this.data.pk;
            $(e.currentTarget).children().each(function() {
                var c = $(this)[0];
                if ($(c).data("name") == pk) {
                    APP_TABLE_FILTER = $(c).data("name") + '=' + $(c).text().trim();
                    console.log("APP_TABLE_FILTER", APP_TABLE_FILTER);
                    ctrlTables.TableSelectData(tables_selectData_callback, { schema: item.get("schema_name"), table: item.get("name"), alias: "", filter: APP_TABLE_FILTER });
                }
            });
            e.stopPropagation();
            e.preventDefault();
        },
        refreshView: function(p) {
            this.unbind();
            if (typeof p !== "undefined") {
                this.model = p;
            }
            this.data = { schema: this.model.data[0].schema, table: this.model.data[0].table, pk: this.model.data[0].pk };
            this.$(".pageTitleContent").html(this.model.data[0].schema + "." + this.model.data[0].table);

            $("#" + this.options.ParentID + "_TemplateContentPanel").remove();
            this.template = _.template($("#" + this.options.template).html());
            this.$el.append(this.template({ ParentID: this.options.ParentID }));
            $("#" + this.options.ParentID).css("display", "block");
            $("#" + this.options.ParentID).parent().show();
        }
    });



// ***********************************************
    TableListView = Backbone.View.extend({
        data: '',
        initialize: function(options) {
            this.options = options || {};
            this.el = this.options.el;
            this.render();
        },
        render: function() {
            try {
                this.refreshView();
                return this;
            } catch (err) {
                console.log("View: " + err.message);
            }
        },
        events: { "click .item": "click_SelectItem"
        },
        click_SelectItem: function(e) {
            if ($(e.currentTarget).hasClass("selected")) {
                $(e.currentTarget).removeClass("selected");
            } else {
                $(".item").removeClass("selected");
                $(e.currentTarget).addClass("selected");
            }
            lstSelecDataTree.add(new Table({ schema_name: $(e.currentTarget).data("schema"), name: $(e.currentTarget).data("name") }));
            ctrTablesDataCustom.TableNavigate({ schema: $(e.currentTarget).data("schema"), table: $(e.currentTarget).data("name"), alias: "" });
            e.preventDefault();
        },
        refreshView: function(p) {
        console.log("TableListView refreshView", p);
            this.unbind();
            if (typeof p !== "undefined") {
                this.model = p;
            }
            $("#" + this.options.ParentID + "_TemplateContentPanel").remove();
            this.template = _.template($("#" + this.options.template).html());
            this.$el.append(this.template({ ParentID: this.options.ParentID }));
            $("#" + this.options.ParentID).css("display", "block");
            $("#" + this.options.ParentID).parent().show();
        }
    });
    

//- Callbacks -
    var tables_get_callback = function (response) {
        $.each(response, function (i, value) {
            var p = new Table({ _id: i,
                object_id: value.object_id,
                name: value.name,
                schema_id: value.schema_id,
                schema_name: value.schema_name,
                create_date: new Date(parseInt(value.create_date.substr(6))).yyyymmdd(),
                modify_date: new Date(parseInt(value.modify_date.substr(6))).yyyymmdd() ,
                selected: false
            });
            ctrlTables.add(p);
        });
        ctrlTables.ShowPanel();
    }


    var table_Navigate_callback = function(response) {
        var ctrNavigation = new TableNavigationList();

        if (response[0].type == "List") {
            console.log("TableNavigate", "LIST", response[0].schema + "." + response[0].table, response);
            $.each(response[1].datos, function(i, value) {
                var p = new TableNavigation({ _id: i,
                    type: response[0].type,
                    schema: value.schema_name,
                    table: value.table
                });
                ctrNavigation.add(p);
            });

            pnlTableList = new PanelView({ el: TableListConfig.Panel(),
                template: TableListConfig.Template(),
                title: response[0].schema + "." + response[0].table
            });
            pnlTableList.setView_Model(TableListConfig.View(), ctrNavigation);

        } else {
            console.log("TableNavigate", "DATA", response);
            if (response[1].datos.length == 0) {
                ctrTablesDataCustom.HideAjaxSpin();
                alert("La tabla no tiene datos.");
            } else {

                if (typeof pnlTableDataCustomPanel == "undefined") {

                    pnlTableDataCustomPanel = new PanelView({ el: TableDataCustomConfig.Panel(),
                        template: TableDataCustomConfig.Template(),
                        title: response[0].schema + "." + response[0].table
                    });
                    pnlTableDataCustomPanel.setView_Model(TableDataCustomConfig.View(), { data: response });
                } else {
                    pnlTableDataCustomPanel.refreshView({ data: response });
                }
                ctrTablesDataCustom.HideAjaxSpin();
            }
        }
        ctrTablesDataCustom.HideAjaxSpin();
    }

 
    //  
    


    var tables_filter_callback = function (response) {
        console.log("this.TableFilter", response);
        ctrlTables.reset();
        $.each(response, function(i, value) {
            var p = new Table({ _id: i,
                object_id: value.object_id,
                name: value.name,
                schema_id: value.schema_id,
                schema_name: value.schema_name,
                create_date: new Date(parseInt(value.create_date.substr(6))).yyyymmdd(),
                modify_date: new Date(parseInt(value.modify_date.substr(6))).yyyymmdd() 
            });
            ctrlTables.add(p);
        });
        ctrlTables.ShowPanel();
    }
    var tables_select_Query_callback = function(response) {
        ctrlTables.ShowPanelText(response[0].table, response[0].query);
    }

    var tables_selectData_callback = function(response) {

        console.log("tables_selectData_callback ", response);
        if (response[0].result == -1) {
            alert(response[0].message);
            ctrlTables.HideAjaxSpin();
            return;
        }
        if (response[2].datos.length == 0) {
            ctrlTables.HideAjaxSpin();
            alert("La tabla no tiene datos.");
        } else {
            console.log("PRE pnlTableData ", pnlTableDataPanel);
            if (typeof pnlTableDataPanel == "undefined") {
                pnlTableDataPanel = new PanelView({ el: TableDataConfig.Panel(), template: TableDataConfig.Template(), title: response[1].schema + "." + response[1].table });
                pnlTableDataPanel.setView_Model(TableDataConfig.View(), { data: response });
            } else {
                pnlTableDataPanel.setView_Model(TableDataConfig.View(), { data: response });
            }
            ctrlTables.HideAjaxSpin();
        }
    }
   
    var SaveUser_callback = function(response) {
        if (response.value == 1) {
            pnlFormUser.hide();
        } else {
                alert(response.message);
            }
       ctrlTables.HideAjaxSpin();
    }

   // ----------------------------------------------------
   // -- Columns callback
   // ----------------------------------------------------

    var Columns_callback = function(response) {
        lstColumns.reset();
        $.each(response[1].datos, function(i, value) {
            var p = new Columns({ _id: i,
                object_id: value.object_id,
                name: value.name,
                type_name: value.type_name,
                max_length: value.max_length,
                Islink:value.Islink,
                LinkText: value.LinkText
            });
            lstColumns.add(p);
        });
        
        COLUMN_CONTROL.hideSpin();
        var p = new PanelView({ model: lstColumns,
            el: TablesConfig.Panel(),
            template: TablesConfig.Template(),
            title: response[0].schema + "." + response[0].table
        });
        p.setView("Columns");
    }

   
/*

Mostrar una pantalla:

1. Cargar datos con el controlador (Llamada Ajax)

    a. Instanciar controlador y hacer la llamada al metodo que trae los datos
    
        var ctrlTables = new TablesControler();
            ctrlTables.TableGetAll({ database: "Northwind" });

    b. El metodo TableGetAll ya tiene predefinida la funcion que va a recibir 
        el callback de la llamada ajax.
        
        1. Se muestra una ventana con el spining de llamada ajax
        
        2. Se hace la llamada
            AjaxCall(Url, fn_callback, data);
            
            url: Direccion a donde se hace la llamada ajax
            fn_callback: funcion que recibe la respuesta de la llamada.
            data:   Son los datos que se envian en la llamada 
                    con formato json ej:    {data: val}
                    
        3. Se oculta el panel con el spin de la llamada ajax.
                    
    c. Al recibir los datos se los cargan en la coleccion y se llama al metodo del controlador 
        para instanciar el panel (PanelView) para mostrar los datos.     
        
        ctrlTables.ShowPanel();
        
        En este caso PanelView instancia la vista Tables que finalmente muestra el resultado
        
        
    d. Template, View
        
2.

    var p = new PanelView({ el: "TablePanel", title: this.getDatabaseName() });
        p.setView("Tables");
                
                    
Panel{
    template:"PanelTemplate", // Template de la vista
    element: "TablePanel",    // HTML Donde se va a cargar la vista
    view:    "TablesView"     // Vista a cargar en el panel  
}    

Tables{
    SwipPanel:"#TablesSwip",
    temlate: "TablesTemplate"   
}

*/


   