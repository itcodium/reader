
var AjaxCaller = function() {
    var ajaxSpinContent = "";
    var ajaxSpinClass = "";
    var ajaxContent = "";
    var ajaxContentToShow = "";
    var overPanel = "";
    var ajaxSpinAbortContent;
    var Url = "";

    var xhr;

    this.setUrl = function(p) {
        Url = p;
    }
    this.spin = function(p) {
        ajaxSpinContent = p;
        ajaxSpinAbortContent = ajaxSpinContent + " h1 span";
    }
    this.content = function(p) {
        ajaxContent = p;

    }

    this.panel = function(p) {
        overPanel = p;
    }


    this.getAjaxSpin = function() {
        return ajaxSpinContent;
    }
    this.hideSpin = function() {
        $(ajaxSpinContent).hide();
    }

    this.showSpin = function() {
        if (overPanel == "") {
            ajaxSpinClass = "loadingContent";
            ajaxContentToShow = ajaxSpinContent;
        } else {
            ajaxSpinClass = "loading";
            ajaxContentToShow = overPanel;
        }
        $(ajaxSpinContent).addClass(ajaxSpinClass);
        $(ajaxSpinContent).show();
    }
    this.AjaxCall = function(pUrl, data, pCallback) {
        this.showSpin();
        $(ajaxSpinAbortContent).click(function() {
            xhr.abort();
        });

        xhr = $.ajax({
            url: pUrl,
            data: data,
            timeout: 5000,
            jsonp: "jsoncallback",
            dataType: "jsonp",
            success: function(data) {
                $(ajaxSpinAbortContent).unbind("click");
                pCallback(data);
                $(ajaxSpinContent).removeClass(ajaxSpinClass).hide();
                $(ajaxContentToShow).show();
            },
            error: function(x, t, m) {
                $(ajaxSpinAbortContent).unbind("click");
                $(ajaxSpinContent).removeClass(ajaxSpinClass).hide();
                new PanelMessageView({ message: "Request " + m,
                    color: "red",
                    backGroundColor:"#ffffcc",
                    bold: true,
                    time:3500
                });
                //console.log("x, t, m", x, t, m);
            }
        });
    }
} 