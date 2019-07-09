
var ImageReader = function () {
    var id = "";
    var idImage = "";
    var panelList = "#imageListFiles";
    var file;

    this.setFile = function (pFile) {
        file = pFile;
    }
    this.setId = function (pId) {
        id = pId;

        var upload = '<li class="uploadLine" id=uploadItem_' + id + '>';
        upload += '              <div class="uploadImageContent">';
        upload += '                    <div class="uploadProgress">';
        upload += '                         <div class="progressBar">';
        upload += '                               <div class="progressGreen" style="width:0%;" id="progress_'+id+'">&nbsp;</div>';
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


    this.getId = function () { return id; }

    this.changeimg = function (str) {

        if (typeof str === "object") {
            try {
                var img = new Image();
                img.onload = function () {
                    if (typeof str === "object") {
                        try {
                            Resample(str.target.result, 100, null, resampled);
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
        var oImg = document.createElement("img");
        oImg.src = data;

        var content = '#uploadItem_' + id + ' div.uploadImageContent .uploadImage';
        var pnlUpload = '#uploadItem_' + id;
        //uploadImageContentStatus
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


//http://www.html5rocks.com/en/tutorials/file/xhr2/

var Upload = function () {
    var id = "";
    var pnlUpload = "";
    var token = "";
    var xhr;
    this.setPnlUpload = function (pPnlUpload) {
        pnlUpload = pPnlUpload;
        $(pnlUpload + " .uploadCancel").click(function () {
            xhr.abort();
        });
    }
    this.setToken = function (pToken) { token = pToken; }
    this.getToken = function () { return token; }

    this.uploadFile = function (file) {
        id = new Date().getTime() + makeid();
        try {
            var formData = new FormData();
            formData.append("photo", file);
            formData.append('api_key', flickr.api_key);
            formData.append('auth_token', auth_token);
            formData.append('api_sig', $(".api_sig").val());

            xhr = new XMLHttpRequest();
            xhr.upload.addEventListener("progress", function (evt) { uploadProgress(evt, pnlUpload); }, false);
            xhr.addEventListener("load", this.uploadComplete, false);
            xhr.addEventListener("error", this.uploadFailed, false);
            xhr.addEventListener("abort", this.uploadCanceled, false);
            xhr.open("POST", "http://api.flickr.com/services/upload/", true);
            xhr.send(formData);
            $(pnlUpload + " .uploadCancel").fadeIn();
        } catch (e) {
            jQuery.noticeAdd({ text: e.message, stay: false, styleClass: "stickyRed" });
            $(pnlUpload + " .uploadCancel").fadeOut();
        }
    }

    this.uploadFailed = function (evt) {

        $(pnlUpload + " .uploadCancel").fadeOut();
        $("#reloadContent").append("<div>There was an error attempting to upload the file.</div>").show();
    }


    this.uploadComplete = function (evt) {


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

            console.log("pnlUpload: ",pnlUpload , 'ID -- >> #progress_'+id, percentComplete.toString()+"%");

        }
        else {
            $(pnlUpload + " .uploadProgress").html('#');
        }
    }

    this.uploadCanceled = function (evt) {

        console.log("uploadCanceled: ", id);

        $(pnlUpload + " .uploadCancel").hide();
        $(pnlUpload + " .uploadAbort").append("<div>The upload has been canceled.</div>").fadeIn();
    }
}



function createImage(path){
      
    	 try {
			 
			  	for(var i = 0; i < path.length; i++) {
                        var index = path[i].lastIndexOf('shared/')+7;

                        var p=blackberry.io.sharedFolder +"/"+ path[i].substring(index);
                        console.log(p);
                        read_fs(p);
                        
				}
				
		} catch (e) {
				alert("createImage: "+e.message);
		}
	 
}


function read_fs(path) {
      setTimeout(function () {
               var i = new ProcessImages(path);
                        i.process();
         }, 5);
}



var ProcessImages= function (pUrl) {
    var url = pUrl;
    this.process = function () { 
        window.webkitRequestFileSystem(window.TEMPORARY, 1024 * 1024, this.processfs);
    }
    this.processfs = function (fs) {
        fs.root.getFile(url, { create: false }, function (fileEntry) {
            fileEntry.file(function (file) {
              var iReader=new ImageReader();
			      iReader.setId(new Date().getTime()+makeid());
			      iReader.setFile(file);
		      var fr = new FileReader();
			      fr.onloadend = iReader.changeimg;
			      fr.readAsDataURL(file);

            }, errorHandler);
        }, errorHandler);
    }
} 



 

function makeid()
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 5; i++ )
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