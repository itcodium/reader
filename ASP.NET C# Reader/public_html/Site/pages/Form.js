



var FormMaker = function(pTitle) {
    var strTemplate = '';
    var strControls = '';
    this.title = pTitle;
    var max_leg = 0;
    var STR_MAX_WIDTH = "[STR_MAX_WIDTH]"
    this.addInputText = function(pName, pLabel, pvalue) {
        if (pvalue == undefined) {
            pvalue = "";
        }
        var strInput = '         <div class="LineTransparent">';
        strInput += '             <span class="label"  style="display:inline-block;width:' + STR_MAX_WIDTH + '">' + pLabel + '</span> <input name="' + pName + '" class="TextBox" type="text" value="' + pvalue + '" />';
        strInput += '         </div>';
        strControls += strInput;
        if (max_leg < pLabel.length) {
            max_leg = pLabel.length;
        }
    }
    this.addInputHidden = function(pName, pLabel, pvalue) {
        var strInput = '         <div class="LineTransparent" style="display:none;">';
        strInput += '             <input name="' + pName + '" type="hidden"  value="' + pvalue + '" />';
        strInput += '         </div>';
        strControls += strInput;
    }

    this.getForm = function() {
        var width = max_leg * (100 / 15) + 10;
        strTemplate += '<div class="Form">';
        strTemplate += '   <div class="move">' + this.title + '</div>';
        strTemplate += '     <form class="FormContent">';
        strTemplate += strControls.replace(STR_MAX_WIDTH, width + "px;");
        strTemplate += '         <div class="LineSubmit">';
        strTemplate += '             <input id="frmSubmit"  class="black" type="button" value="Enviar" />';
        strTemplate += '             <input id="frmCancel"  class="black" type="button" value="Cancelar" />';
        strTemplate += '             <input id="frmClear"   class="black" type="button" value="Limpiar" />';
        strTemplate += '         </div>';
        strTemplate += '     </form>';
        strTemplate += ' </div>';
        var form = strTemplate.replace(STR_MAX_WIDTH, width + "px");
        return (form);
    }

};




FormView = Backbone.View.extend({
    initialize: function(options) {
        this.options = options || {};
        this.$el = $('#' + this.options.el);
        this.render();
    },
    render: function() {
        try {
            this.updateView();
            var template = _.template(this.options.Form, {});
            this.$el.html(template);
            $('#' + this.options.el + " .Form").draggable();
            $('#' + this.options.el + " .Form").fadeIn();
            return this;
        } catch (err) {
            console.log("View: " + err.message);
        }
    },
    events: {
        'click #frmSubmit': "doSearch",
        'click #frmCancel': "doCancel",
        'click #frmClear': "doClear"
    },
    doSearch: function(event) {
        var form = $('#' + this.options.el + " form").serializeArray();
        var data = "{"
        jQuery.each(form, function(i, val) {
            data += '"' + val.name + '": "' + val.value + '",';
        });
        data = data.slice(0, -1) + "}";

        var obj = jQuery.parseJSON(data);
        this.submit(obj);
        var element = '#' + this.options.el + " form #frmSubmit";
        $(event.currentTarget).attr("disabled", "disabled");
        habilitarBoton(element);
        event.stopPropagation();
        event.preventDefault();
    },
    doCancel: function(event) {
    console.log("doCancel", '#' + this.options.el + " .Form");
        $('#' + this.options.el + " .Form").fadeOut();
    },
    doClear: function(event) {
        $('#' + this.options.el + " form")[0].reset()
    },
    updateView: function() {
        $(this.$el).undelegate('#frmSubmit', 'click');
        $(this.$el).undelegate('#frmCancel', 'click');
        $(this.$el).undelegate('#frmClear', 'click');
        this.$el.html("");
    },
    submit: function() {
        alert("Default Submit");
    },
    SetSubmit: function(p) {
        this.submit = p;
    },
    hide: function() {
        this.doClear();
        this.doCancel();
    }
});


function habilitarBoton(p) {
    setTimeout('$("' + p + '").attr("disabled", false);', 1000);
}


