var FeedsPhotos = function() {
    var content = "";
    var cAjax= new AjaxCaller();


    this.content = function(p) {
        content = p;
        cAjax.ajaxCallerContent(p);
    }
    this.ajaxSpin = function(p) {
        cAjax.ajaxCallerSpin(p);
    }
    this.panel = function(p) {
        cAjax.ajaxCallerOverPanel(p);
    }

    this.GetPhotos = function(purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_getphothos);
    }

    this.callback_getphothos = function(data) {
        $.each(data.items, function(i, item) {
            $(content).append('<img src="' + item.media.m + '" />');
            if (i == 10) return false;
        });
    }
};

//FeedsPhotos.prototype = new AjaxCaller;
 