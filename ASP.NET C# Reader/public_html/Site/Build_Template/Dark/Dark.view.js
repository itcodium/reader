 
DarkView = Backbone.View.extend({
    initialize: function () {
        this.render();
    },
    render: function () {

        var variables = {};

        try {

            this.cancel();
            this.updateView();

            this.template = _.template($("#" + DarkControlConfig.Template).html());

            console.log("this.model", $("#" + DarkControlConfig.Template).html());
            $("#" + DarkControlConfig.Content).empty();
            $(this.el).html(this.template({
                lstDark: this.model.toJSON()
            }));

            $("#" + DarkControlConfig.Content).removeClass("content-spin");
            $("#" + DarkControlConfig.Name+ "Box").slideDown();
            return this;
        } catch (err) {
            console.log("View: " + err.message);
        }
    }
    ,
    events: {
    //"click .item": "click_SelectItem",
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
    this.$el.html("");
},
click_download: function (e) {
}

});

