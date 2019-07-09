
var TextConfig = new ConfigView("Text");
var lstTableColumn= new MenuList();
    lstTableColumn.add(new Menu({ name: 'Filter c', label: 'Filter', onClick: "filter_col();" }));

    function filter_col() {
        alert("filter_col");
    }
    
    TextView = Backbone.View.extend({
        initialize: function(options) {
            this.options = options || {};
            this.el = this.options.el;

            this.render();
        },
        render: function() {
            try {
                console.log(" TextView this.options", this.options);
                var menuee = new TableMenu({ el: $("#" + this.options.ParentID + "_MenuContent"), model: lstTableColumn });
                var template = _.template($("#" + this.options.template).html());
                this.$el.append(template({ text: this.model.data ,ParentID:this.options.ParentID}));
                $("#" + this.options.ParentID).parent().show();
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
 