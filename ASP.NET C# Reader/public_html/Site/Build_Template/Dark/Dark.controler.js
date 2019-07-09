
var pnlDark;
var lstDark= new DarkList();


var DarkControlConfig = {    Name: 'Dark',
                                Template:  "DarkTemplate",
                                Content: "DarkPanel"
                                };

                                                        
var DarkControler = function (token) {
    
    var url = DB_SRV.url + DB_SRV.servicio.databases;

    this.AjaxCall = function (pUrl, pCallback, data) {
        $.ajax({ url: pUrl,
            dataType: 'jsonp',
            type: 'POST',
            data: data,
            async: false,
            timeout: 10000,
            success: pCallback,
            error: function (x, t, m) {
                if (t == 'timeout') {
                    alert('Timeout');
                } else {
                    alert(x.responseText);
                }
            }
        });
    }

    this.DarkGetByTable = function (pData) {
        var vUrl = url + '/DarkGetByTable';
        this.AjaxCall(vUrl, Dark_callback, pData);
    }
     
};

var Dark_callback = function (response) {
    $.each(response, function (i, value) {
        var p = new Dark({ _id: i,
            
			gordon:'',
			and:'',
			harvey:'',
			dent:'',
			launch:'',
			an:'',
			assault:''
        });
        lstDark.add(p);
    });

    
     pnlDark= new DarkView({ el: $('#Dark'+ControlConfig.Content),
        model: lstDark
    });
 
}
