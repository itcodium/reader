    var NewsPaperConfig = new ConfigView("NewsPaper");
    
   // ---- Controler ----------------------------------------
    var NewsPaperControler = function(ControlName) {
        var showing = false;
        var panel;
        var title = "";
        var config = new ConfigView(ControlName);

        this.NewsPaperGetAll = function(aCallback, pData) {
            this.AjaxCall(this.url + '/NewsPaperGetAll', aCallback, pData);
        }
        this.NewsGetByNewsPaper = function(aCallback, pData) {
            this.AjaxCall(this.url + '/NewsGetByNewsPaper', aCallback, pData);
        }
        this.Title = function(p) {
            title = p;
            if (typeof panel != "undefined") {
                panel.panel.Title(p);
            }
        },
        this.ShowPanel = function(p) {

            this.hideSpin();
            if (showing == false) {

                panel = new PanelView({ el: config.Panel(), template: config.Template(), swip: config.Swip(), model: p, title: title });
                panel.setView(config.View());
                showing = true;
            } else {
                panel.refreshView(p);
            }
        }
    };

    var url = SERVICE_NEWS.url + SERVICE_NEWS.service;
    NewsPaperControler.prototype = new AjaxCaller(url); // AjaxCaller => Pages/Common.js

        
//- TablesView -
    NewsPaperView = Backbone.View.extend({
        tableScroll: '',
        title: '',
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
        events: {
            "click .item": "click_SelectItem"
        },
        click_SelectItem: function(e) {
            if ($(e.currentTarget).hasClass("selected")) {
                $(e.currentTarget).removeClass("selected");
            } else {
                $(".item").removeClass("selected");
                $(e.currentTarget).addClass("selected");
            }
            console.log("click_SelectItem", $(e.currentTarget).data("cid"), $(e.currentTarget).data("id"));
            ctrNews.NewsGetByNewsPaper(newsGetByNewsPaper_Callback, { IdNewsPaper: $(e.currentTarget).data("id") });
            e.preventDefault();
        },
        refreshView: function() {
        $("#" + this.options.ParentID + "_TemplateContentPanel").remove();
            var template = _.template($("#" + this.options.template).html());
            this.$el.append(template({ models: this.model.models, ParentID: this.options.ParentID }));
            var tableScroll = new iScroll(this.options.ParentID + "_TemplateContentPanel");
        },
        Title: function(pTitle) {
            this.$(".pageTitleContent").html(pTitle);
        }
    });



    NewsView = Backbone.View.extend({
        title: '',
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
        events: {},
        refreshView: function(p) {
            if (typeof p != "undefined") {
                this.model = p;
            }
            $("#" + this.options.ParentID + "_TemplateContentPanel").remove();
            $("#" + this.options.ParentID).show();
            var template = _.template($("#" + this.options.template).html());
            this.$el.append(template({ models: this.model.models, ParentID: this.options.ParentID }));
            this.tableScroll = new iScroll(this.options.ParentID + "_TemplateContentPanel");
        }, Title: function(pTitle) {
            this.$(".pageTitleContent").html(pTitle);
        }
    });
 
 
 
    //- Callbacks -
        var newsPaperGetAll_Callback = function(response) {
            var lstNewsPaper = new NewsPaperList();
            $.each(response, function(i, value) {
                var p = new NewsPaper({ _id: i,
                    IdNewsPaper: value.IdNewsPaper,
                    Codigo: value.Codigo,
                    Nombre: value.Nombre
                });
                lstNewsPaper.add(p);
            });
            ctrNewsPaper.ShowPanel(lstNewsPaper);
            ctrNewsPaper.hideSpin();
        }



        var newsGetByNewsPaper_Callback = function(response) {

            var lstNews = new NewsList();
            $.each(response[1].data, function(i, value) {
                var c2 = new Date(parseInt(value.PublishDate.toString().replace("/Date(", "").replace(")/", "")));
                var c2 = c2.toString().substr(16, 5);
                var p = new News({ _id: i,
                    IdNewsPaper: value.IdNewsPaper,
                    IdNew: value.IdNew,
                    IdNewsPaper: value.IdNewsPaper,
                    IdChannel: value.IdChannel,
                    Title: value.Title,
                    Description: value.Description,
                    PublishDate: new Date(parseInt(value.PublishDate.substr(6))).yyyymmdd() + " " + c2,
                    Link: value.Link,
                    Author: value.Author
                });
                lstNews.add(p);
            });
            ctrNews.Title(response[0].NewsPaper);
            ctrNews.ShowPanel(lstNews);
            ctrNews.hideSpin();
        }

       