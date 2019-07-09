var FeedsPhotos = function() {
    var content = "";
    var cAjax = new AjaxCaller();
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
        cAjax.AjaxCall(purl, pdata, this.callback);
    }

    this.callback = function(data) {
        $.each(data.items, function(i, item) {
            var p = new Photo({ _id: i,
                src: item.media.m
            });
            vPhotoList.add(p);
        });
 
    }
};





 