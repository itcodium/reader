AuthenticationView = Backbone.View.extend({
    url: '',
    initialize: function(options) {
        this.options = options || {};
        this.el = this.options.el;
        this.url = this.options.parameters[0].url;
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
        "click #flickr_authorize": "click_authorize",
        "click #btnGetToken": "click_getToken"
    }, click_getToken: function(e) {

        var miniToken = $("#miniToken-1").val() + "-" + $("#miniToken-2").val() + "-" + $("#miniToken-3").val();
        var p = new ApiCall();
            p.setMethod("flickr.auth.getFullToken");
            p.addParameter("mini_token", miniToken);
            p.setCallbackName("saveToken");
            p.call();

        e.preventDefault();
    },
    click_authorize: function(e) {
        $("#AuthenticationCode").show();
        $(e.currentTarget).hide();
        e.preventDefault();
    },
    refreshView: function() {
        var template = _.template($("#" + this.options.template).html());
        this.$el.append(template({ ParentID: this.options.ParentID, url: this.url }));

    }
});

function saveToken(rsp) {
    if (rsp.stat != "ok") {
        var r="<br><h2>SaveToken</h2>  Stat: "+  + rsp.stat + ' - ' + rsp.code + ' - ' + rsp.message+"<br>";
        $("#FlickrResponse").html(r);
    } else {

    var r="<h2>SaveToken</h2> auth.token: "+  rsp.auth.token._content+"<br>";
            r = r + "auth.perms._content" + "<br>";
            r = r + "nsid: " + rsp.auth.user.nsid + "<br>";
            r = r +"username: "+rsp.auth.user.username+"<br>";
            $("#FlickrResponse").html(r);
    }

}
 