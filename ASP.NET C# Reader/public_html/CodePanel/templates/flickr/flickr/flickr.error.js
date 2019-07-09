var vOpenTokenPage='<a id="openTokenPage" class="appOffline" >';
    vOpenTokenPage+='   <div class="online">';
    vOpenTokenPage+='    <div style="height: 100%;font-size: 17px;background:url(assets/images/icons/flickr_icon.png) no-repeat; background-position: 8% 50%;">';
    vOpenTokenPage+='    <div style="line-height: 30px;padding-top: 10px; padding-left: 15px;color: #fff;text-align:center;">Obtener codigo de autorizacion</div>';
    vOpenTokenPage+='    </div>';
    vOpenTokenPage+='   </div>';
    vOpenTokenPage+='</a>';
 

var FlickrError = function () {

    this.processError = function (rsp, panel) {
        console.log(rsp);
        switch (rsp.code) {
            case 98: //"Invalid auth token"
                this.InvalidAuthToken(panel);
                break;
            default:
                console.log(rsp);
                break;
        }
    }

    this.InvalidAuthToken = function (panel) {
        panel.html(vOpenTokenPage);
        $("#openTokenPage").click(openTokenPage);
        $.ajax({
            type: 'GET',
            url: "viuphoAuth.html",
            success: function (data) {
                panel.append(data);
                $("#getToken").click(getToken);
            },
            cache: false
        });

        panel.show();
    }



};

//'  <div class="button" style="width:100%;display:block" id="openTokenPage">' + "Obtener codigo de autorizacion." + '</div>'
