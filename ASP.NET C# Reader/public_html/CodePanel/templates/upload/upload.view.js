
PhotoUploadView = Backbone.View.extend({

    initialize: function(options) {
        this.options = options || {};
        this.el = '#' + this.options.el;
        this.render();
    },
    render: function() {
        try {
            this.template = _.template($("#" + this.options.template).html());
            $(this.el).append(this.template());

            var dropbox = $("#PanelUploadFiles")[0];
            dropbox.addEventListener("dragenter", this.cancel, false);
            dropbox.addEventListener("dragexit", this.cancel, false);
            dropbox.addEventListener("dragover", this.cancel, false);
            dropbox.addEventListener("drop", this.drop, false);
            $("#InputFilePicker").show();
        } catch (err) { alert(err.message); }
    },
    events: {
},
updateView: function() {
    this.undelegateEvents();
    this.$el.html("");
},
drop: function(e) {
    e.stopPropagation();
    e.preventDefault();

    var files = e.dataTransfer.files;
    var count = files.length;

    if (count > 0) {
        console.log(this);
        handleFiles(files);
    }
},
cancel: function(e) {
    e.stopPropagation();
    e.preventDefault();
},

UploadFiles: function() {
    var files = document.getElementById('InputFilePicker').files;
    for (var i = 0, file; file = files[i]; i++) {
        var iReader = new ImageReader();
        iReader.setId(new Date().getTime() + makeid());
        iReader.setFile(file);
        var fr = new FileReader();
        fr.onloadend = iReader.changeimg;
        fr.readAsDataURL(file);
    }
}
});


function handleReaderProgress(evt) {
    if (evt.lengthComputable) {
        var loaded = (evt.loaded / evt.total);
    }
}
 function handleReaderLoadEnd(evt) {
     $("#PanelUploadFiles").append('<img width=100px src="' + evt.target.result + '"/>');
}


function handleFiles(files) {
    $("#CenterText").hide();
    for (var i = 0, file; file = files[i]; i++) {
        var reader = new FileReader();
        console.log("file.name: ", file.name);
        reader.onprogress = handleReaderProgress;
        reader.onloadend = handleReaderLoadEnd;
        reader.readAsDataURL(file);
    }
}



// http://www.html5rocks.com/en/tutorials/file/filesystem-sync/

 


function makeid() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < 5; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}



function errorHandler(e) {
    var msg = '';
    switch (e.code) {
        case FileError.QUOTA_EXCEEDED_ERR:
            msg = 'QUOTA_EXCEEDED_ERR';
            break;
        case FileError.NOT_FOUND_ERR:
            msg = 'NOT_FOUND_ERR';
            break;
        case FileError.SECURITY_ERR:
            msg = 'SECURITY_ERR';
            break;
        case FileError.INVALID_MODIFICATION_ERR:
            msg = 'INVALID_MODIFICATION_ERR';
            break;
        case FileError.INVALID_STATE_ERR:
            msg = 'INVALID_STATE_ERR';
            break;
        default:
            msg = 'Unknown Error';
            break;
    };

    alert('File: ' + msg);
}




var ImageReader = function() {
    var id = "";
    var idImage = "";
    var panelList = "#imageListFiles";
    var file;

    this.setFile = function(pFile) {
        file = pFile;
    }
    this.setId = function(pId) {
        id = pId;

        var upload = '<li class="uploadLine" id=uploadItem_' + id + '>';
        upload += '              <div class="uploadImageContent">';
        upload += '                    <div class="uploadProgress">';
        upload += '                         <div class="progressBar">';
        upload += '                               <div class="progressGreen" style="width:0%;" id="progress_' + id + '">&nbsp;</div>';
        upload += '                         </div>';
        upload += '                    </div>';
        upload += '                   <div class="uploadImage" style="z-index:7000;">&nbsp;</div>';
        upload += '              </div>';
        upload += '              <div class="uploadImageContentStatus" >';
        upload += '                   <div class="uploadCancel">&nbsp;</div>';
        upload += '                   <div class="uploadAbort"></div>';
        upload += '                   <div class="uploadResponse">&nbsp;</div>';
        upload += '              </div>';
        upload += '              <div class="clear"></div>';
        upload += '      </li>';

        $(upload).appendTo(panelList);
    }


    this.getId = function() { return id; }

    this.changeimg = function(str) {
        console.log("str", str);

        if (typeof str === "object") {
            try {
                var img = new Image();
                img.onload = function() {
                    if (typeof str === "object") {
                        try {
                            Resample(str.target.result, null, 100, resampled);
                        } catch (e) {
                            alert("changeimg: " + e.message);
                        }
                    }
                };
                img.src = str.target.result;
            } catch (e) {
                alert("changeimg" + e.message);
            }
        }
    }



    function resampled(data) {
        var content = '#uploadItem_' + id + ' div.uploadImageContent .uploadImage';
        var pnlUpload = '#uploadItem_' + id;
        var up = new Upload();
        up.setPnlUpload(pnlUpload);
        up.uploadFile(file);
        $(content).css('background-image', 'url(' + data + ')');
        $(content).removeClass("spin");
    }

    function abort(e) {
        alert("operation aborted");
    }

    function error(e) {
        $message.innerHTML = "Error: " + (this.result || e);
    }
}






var Upload = function() {
    var id = "";
    var pnlUpload = "";
    var token = "";
    var xhr;
    this.setPnlUpload = function(pPnlUpload) {
        pnlUpload = pPnlUpload;
        $(pnlUpload + " .uploadCancel").click(function() {
            xhr.abort();
        });
    }
    this.setToken = function(pToken) { token = pToken; }
    this.getToken = function() { return token; }

    this.uploadFile = function(file) {
        id = new Date().getTime() + makeid();
        try {
            var formData = new FormData();
            formData.append("photo", file);
            formData.append('api_key', flickr.api_key);
            formData.append('auth_token', $(".auth_token").val());
            formData.append('api_sig', $(".api_sig").val());



            xhr = new XMLHttpRequest();
            xhr.upload.addEventListener("progress", function(evt) { uploadProgress(evt, pnlUpload); }, false);
            xhr.addEventListener("load", this.uploadComplete, false);
            xhr.addEventListener("error", this.uploadFailed, false);
            xhr.addEventListener("abort", this.uploadCanceled, false);
            xhr.open("POST", "https://api.flickr.com/services/upload/", true);
            $(pnlUpload + " .uploadCancel").fadeIn();
        } catch (e) {
            console.log("e.message", e.message);
            jQuery.noticeAdd({ text: e.message, stay: false, styleClass: "stickyRed" });
            $(pnlUpload + " .uploadCancel").fadeOut();
        }
    }

    this.uploadFailed = function(evt) {

        $(pnlUpload + " .uploadCancel").fadeOut();
        $("#reloadContent").append("<div>There was an error attempting to upload the file.</div>").show();
    }


    this.uploadComplete = function(evt) {


        $(pnlUpload + " .uploadResponse").fadeIn();
        var xmlDoc = $.parseXML(evt.target.responseText);
        var $xml = $(xmlDoc);
        var stat = $xml.find("rsp").attr("stat");
        $(pnlUpload + " .uploadResponse").removeClass("spin");
        jQuery.noticeAdd({ text: 'La imagen se subio correctamente.', stay: false });

        if (stat == "ok") {
            $(pnlUpload + " .uploadResponse").addClass("success").fadeIn();
        } else {

            jQuery.noticeAdd({ text: evt.target.responseText, stay: false, styleClass: "stickyRed" });
            $(pnlUpload + " .uploadResponse").append("Error").addClass("error");
        }

    }

    function uploadProgress(evt, pnlUpload) {

        if (evt.lengthComputable) {
            var percentComplete = Math.round(evt.loaded * 100 / evt.total);
            if (percentComplete == 100) {
                $(pnlUpload + " .uploadCancel").hide();
                $(pnlUpload + " .uploadResponse").html("&nbsp;").addClass("spin").fadeIn();
            }
            $(pnlUpload + " .uploadImageContent .uploadProgress .progressBar .progressGreen").css("width", percentComplete.toString() + "%");

            console.log("pnlUpload: ", pnlUpload, 'ID -- >> #progress_' + id, percentComplete.toString() + "%");

        }
        else {
            $(pnlUpload + " .uploadProgress").html('#');
        }
    }

    this.uploadCanceled = function(evt) {

        console.log("uploadCanceled: ", id);

        $(pnlUpload + " .uploadCancel").hide();
        $(pnlUpload + " .uploadAbort").append("<div>The upload has been canceled.</div>").fadeIn();
    }
}





/*

function onInvokeSuccess() {
console.log("onInvokeSuccess");
}
function onInvokeError() {
console.log("onInvokeError");
}

*/
 