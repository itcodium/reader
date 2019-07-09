PanelMessageView = Backbone.View.extend({
    initialize: function(options) {
        this.options = options || {};
        this.el = this.options.el;
        if (typeof this.options.time === 'undefined') {
            this.options.time = 1000;
        };
        this.render();
    },
    events: { "click .vItemMenu": "click_vItemMenu"
    },
    click_vItemMenu: function(e) {
        e.preventDefault();

    },
    click_close_panel: function(event) {
        $("#" + $(event.currentTarget).data("id")).fadeOut("slow", function() {
            $(this).remove();
        });
    },
    render: function() {
        try {
            this.template = _.template('<div id="<%=this.cid%>" style="text-align:center;line-height:2em;font-size:1em;padding:0.5em;background-color:#eee;border-bottom:solid 1px #dfdfdf;display:none;"><%= message%></div>');
            $('#MessagePanel').prepend(this.template({ message: this.options.message }));
            $("#" + this.cid).css("color", this.options.color);
            if (this.options.bold == true) {
                $("#" + this.cid).css("font-weight", "bold");
            }
            $("#" + this.cid).fadeIn(500).animate({ opacity: 1.0 }, this.options.time).fadeOut(1000, function() { $(this).remove(); });
            return this;
        } catch (err) {
            console.log("View: " + err.message);
        }
    },
    updateView: function() {
        this.undelegateEvents();
        this.$el.html("");
    }
});