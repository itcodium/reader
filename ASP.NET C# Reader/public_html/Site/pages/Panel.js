

PanelView = Backbone.View.extend({
    panel: '',
    title: '',
    test_panel: 'FUNCIONA!!!',
    initialize: function(options) {
        this.options = options || {};
        this.el = '#' + this.options.el;
        this.render();
    },
    render: function() {
        try {
            //console.log("PanelView", "#" + this.cid);
            this.template = _.template($("#PanelTemplate").html());
            $(this.el).append(this.template({ title: this.options.title }));
            $("#" + this.cid).show();
            $('#' + this.cid + '_Close').click(this.click_close);
            $('#' + this.cid + '_Menu').click(this.click_OpenMenu);
            return this;
        } catch (err) {
            console.log("View: " + err.message);
        }
    },
    events: {
    //"click .closeBox": "click_close"
},
click_close: function(event) {
    $("#" + $(event.currentTarget).data("id")).fadeOut("slow", function() {
        // $(this).remove();
    });
},
click_OpenMenu: function(event) {
    var height = $("#" + $(event.currentTarget).data("id") + "_MenuContent").css("height").replace("px", "");
    if ($("#" + $(event.currentTarget).data("id") + "_MenuContent").css("display") != "block") {
        var next_height = $("#" + $(event.currentTarget).data("id") + "_MenuContent").next().css("height").replace("px", "");
        $("#" + $(event.currentTarget).data("id") + "_MenuContent").next().css("height", parseInt(next_height) - parseInt(height) + "px");
    }
    $("#" + $(event.currentTarget).data("id") + "_MenuContent").slideToggle(function() {
        var height = $("#" + $(event.currentTarget).data("id") + "_MenuContent").css("height").replace("px", "");
        if ($("#" + $(event.currentTarget).data("id") + "_MenuContent").css("display") != "block") {
            var next_height = $("#" + $(event.currentTarget).data("id") + "_MenuContent").next().css("height").replace("px", "");
            $("#" + $(event.currentTarget).data("id") + "_MenuContent").next().css("height", parseInt(next_height) + parseInt(height) + "px");
        }
    });

},
updateView: function() {
    this.undelegateEvents();
    this.$el.html("");
},
click_item: function(p) {
    console.log("Default Submit PanelView", p);
},
set_ClickItem: function(p) {
    this.click_item = p;
},
getTitle: function() {
    eval("this.panel.getTitle();");
},
refreshView: function(p) {
    if (typeof p != "undefined") {
        this.model = p;
    }
    eval("this.panel.refreshView(this.model);");

}, Title: function(p) {
    if (typeof this.panel != "undefined") {
        eval('this.panel.Title("test");');
    }
}, setView: function(pName) {
    var createView = 'this.panel =new ' + pName + "View" + '({ el: $("#' + this.cid + '_Content")'
                                     + ',model: this.model'
                                     + ',template: this.options.template'
                                     + ',swip: this.options.swip'
                                     + ',click_item: this.click_item'
                                     + ',parent: "' + '#' + this.cid + '_Content"'
                                     + ',ParentID: "' + this.cid + '"' + '});';
    eval(createView);
}, setView_Model: function(pName, data) {
    var createView = 'this.panel=new ' + pName + "View" + '({ el: $("#' + this.cid + '_Content")'
                                        + ',template: this.options.template'
                                        + ',swip: this.options.swip'
                                        + ',click_item: this.click_item'
                                        + ',parent: "' + '#' + this.cid + '_Content"'
                                        + ',ParentID: "' + this.cid + '"'
                                        + ',model:' + JSON.stringify(data) + '});';
    eval(createView);
}
});
 

// 

/*

Ejemplo de uso:

    - JS:
        var p = new PanelView({ name: "Panel 1", el: "TablePanel", template: "PanelTemplate" });

    - el (HTML): "TablePanel"
        <div id="TablePanel" class="content"></div>

    - template: "PanelTemplate"
        <script type="text/x-underscore-template" id="PanelTemplate"></script> 

    - Agregar Vista al template;

            p.setView("FormView", "FormTemplate");


*/
     // $(this.el).undelegate('#btnDownload', 'click');