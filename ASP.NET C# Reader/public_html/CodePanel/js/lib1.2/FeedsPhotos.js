Photo= Backbone.Model.extend({
    src: ''
});

PhotoList = Backbone.Collection.extend({
    model: Photo
});

var PhotoConfig = new ConfigView("Photo");
/*
    PhotoTemplate -- Template de la vista
    PhotoPanel    -- Panel donde va el contenido
    
*/


var FeedsPhotos = function() {
    var content = "";
    var cAjax = new AjaxCaller();
    var vPhotoList = new PhotoList();
    var pnlTablePhoto;
    this.content = function(p) {
        content = p;
        cAjax.content(p);
    }

    this.ajaxSpin = function(p) {
        cAjax.spin(p);
    }
    this.panel = function(p) {
        cAjax.panel(p);
    }

    this.GetPhotos = function(purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_getphothos);
    }

    this.callback_getphothos = function(data) {
        $.each(data.items, function(i, item) {
            var p = new Photo({ _id: i,
                src: item.media.m
            });
            vPhotoList.add(p);
        });
        
        pnlPhoto = new PanelView({
            el: PhotoConfig.Panel(),
            template: PhotoConfig.Template(),
            swip: PhotoConfig.Swip(),
            parameters: [{ multiSelect: true}],
            model: vPhotoList,
            title: "Fotos de flicker"
        });
        pnlPhoto.setView(PhotoConfig.View());
    }
};







PhotoView = Backbone.View.extend({
    multiSelect: '',
    initialize: function(options) {
        this.options = options || {};
        this.el = this.options.el;

        if (typeof this.options.parameters !== 'undefined') {
            this.multiSelect = this.options.parameters[0].multiSelect;
        }

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
                 if (!this.multiSelect) {
                        $(".item").removeClass("selected");
                    }
            $(e.currentTarget).addClass("selected");
        }
        e.preventDefault();
    },
    refreshView: function() {
        $("#" + this.options.ParentID + "_TemplateContentPanel").remove();
        var template = _.template($("#" + this.options.template).html());
        this.$el.append(template({ models: this.model.models, ParentID: this.options.ParentID }));
        var tableScroll = new iScroll(this.options.ParentID + "_Content");
    }
});