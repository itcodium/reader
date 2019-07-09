
var ImageReader = function() {

    this.read = function(ob) {
        if (file) {
            try {
    		     var fr = new FileReader;
    		     fr.onloadend = changeimg;
    		     fr.readAsDataURL(file)	
    		} catch (e) {
    		alert("Error createImage: " + e.message);
    		}
    	 } else {
    	    changeimg(file);
    	 }
    }
}


function changeimg(str) {
 	   if(typeof str === "object") {
 	       try {
 	           Resample(str.target.result,100, null,   resampled  );
				} catch (e) {
					alert("changeimg: "+e.message);
				}
 	   }
}


function resampled(data) {
    var oImg = document.createElement("img");
    oImg.src = data;
    oImg.height = '100';
    document.body.appendChild(oImg);
}

 function abort(e) {
   alert("operation aborted");
  }
  
  function error(e) {
   $message.innerHTML = "Error: " + (this.result || e);
  }