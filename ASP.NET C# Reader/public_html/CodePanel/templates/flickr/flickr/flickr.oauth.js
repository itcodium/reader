	var url="http://www.flickr.com/services/oauth/request_token";
	//var format='xml';
	var oauth_callback="http://www.example.com";
	var oauth_consumer_key="5fb09b31dffe2b80f92bfa681110c893";
	var oauth_nonce="";
	var oauth_signature="";
	var oauth_timestamp="";
	var oauth_version="1.0";
	var oauth_signature_method="HMAC-SHA1";
	
	var key="4429ed0a36299c3e&";
	         
	var accessor= {consumerSecret: "4429ed0a36299c3e",tokenSecret: ""};
 	var message = { method: "POST",
 				    action: "http://www.flickr.com/services/oauth/request_token",
 				    parameters:  OAuth.decodeForm("")
                  };
 	
	var base="";
	var token="";

	function showError(result) {
		if(result.status!=200){
			console.log("ERROR " + result.status + ' ' + result.statusText);
		}
	}
	/*
	$.ajaxPrefilter( function( options, originalOptions, jqXHR ) {
	 	oauth_nonce=OAuth.nonce(32);
		oauth_timestamp=OAuth.timestamp();
	 
		var QueryString = options.url.substring ( options.url.indexOf ( "?" )+1 );
		var callBackValue=options.url.substring ( options.url.indexOf ( "=" )+1);

		message.parameters.push(["oauth_callback", oauth_callback]);
		message.parameters.push(["oauth_consumer_key",oauth_consumer_key ]);
		message.parameters.push(["oauth_nonce", oauth_nonce]);
		message.parameters.push(["oauth_signature_method", oauth_signature_method]);
    	message.parameters.push(["oauth_timestamp", oauth_timestamp]);
    	message.parameters.push(["oauth_version", oauth_version]);
     
    	OAuth.SignatureMethod.sign(message, accessor);
    	OAuth.SignatureMethod.getBaseString(message);
  	
		var part1=message.method+'&'+OAuth.percentEncode(message.action);

		var urlEncode="";
		urlEncode+='oauth_callback='+OAuth.percentEncode(oauth_callback);
		urlEncode+='&oauth_consumer_key='+oauth_consumer_key;
		urlEncode+='&oauth_nonce='+oauth_nonce;
		urlEncode+='&oauth_signature_method='+oauth_signature_method;
		urlEncode+='&oauth_timestamp='+oauth_timestamp;
		urlEncode+='&oauth_version='+oauth_version;
		
		urlEncode=OAuth.percentEncode(urlEncode);

		var base=part1+'&'+urlEncode;
		
		oauth_signature=b64_hmac_sha1(key,base);
		oauth_signature=OAuth.percentEncode(oauth_signature);

		var pSingature='';
		pSingature+='?oauth_callback='+OAuth.percentEncode(oauth_callback);
		pSingature+='&oauth_consumer_key='+oauth_consumer_key;
		pSingature+='&oauth_nonce='+oauth_nonce;
		pSingature+='&oauth_timestamp='+oauth_timestamp;
		pSingature+='&oauth_signature_method='+oauth_signature_method;
		pSingature+='&oauth_version='+oauth_version;
		pSingature+='&oauth_signature='+oauth_signature ;
	 
	 	options.url=message.action+pSingature;

	});
*/
	function alertResponse(text) {
		alert( "Data Saved: " + text );
		}

	
	function solicitudToken(){
		
		oauth_nonce=OAuth.nonce(32);
		oauth_timestamp=OAuth.timestamp();
 

		message.parameters.push(["oauth_callback", oauth_callback]);
		message.parameters.push(["oauth_consumer_key",oauth_consumer_key ]);
		message.parameters.push(["oauth_nonce", oauth_nonce]);
		message.parameters.push(["oauth_signature_method", oauth_signature_method]);
    	message.parameters.push(["oauth_timestamp", oauth_timestamp]);
    	message.parameters.push(["oauth_version", oauth_version]);
     
    	OAuth.SignatureMethod.sign(message, accessor);
    	OAuth.SignatureMethod.getBaseString(message);
  	
		var part1=message.method+'&'+OAuth.percentEncode(message.action);

		var urlEncode="";
		urlEncode+='oauth_callback='+OAuth.percentEncode(oauth_callback);
		urlEncode+='&oauth_consumer_key='+oauth_consumer_key;
		urlEncode+='&oauth_nonce='+oauth_nonce;
		urlEncode+='&oauth_signature_method='+oauth_signature_method;
		urlEncode+='&oauth_timestamp='+oauth_timestamp;
		urlEncode+='&oauth_version='+oauth_version;
		
		urlEncode=OAuth.percentEncode(urlEncode);

		var base=part1+'&'+urlEncode;
		
		oauth_signature=hex_md5(base);
		oauth_signature=OAuth.percentEncode(oauth_signature);

		var pSingature='';
		pSingature+='?oauth_callback='+OAuth.percentEncode(oauth_callback);
		pSingature+='&oauth_consumer_key='+oauth_consumer_key;
		pSingature+='&oauth_nonce='+oauth_nonce;
		pSingature+='&oauth_timestamp='+oauth_timestamp;
		pSingature+='&oauth_signature_method='+oauth_signature_method;
		pSingature+='&oauth_version='+oauth_version;
		pSingature+='&oauth_signature='+oauth_signature ;

		$("#frmToken").attr("action",message.action+pSingature);
	 
		  
		/*
	  	$.jsonp({
		  	url: ,
          	cache: true,
        	dataType: "jsonp",
        	callback: "alertResponse"
        	, success: function (data, textStatus, jqXHR) {
   		            console.log("success: ",data);
   		    }
		}); 
		*/
	  
	 	$.ajax({
	 		 	url: message.action+pSingature
		        ,cache:true 
		         ,dataType: "jsonp"
                  , type: "post"
		         ,error: function(datos){
		        	 alert("Error");
			     }
		        , jsonpCallback: 'alertResponse'
		        , success: function (data, textStatus, jqXHR) {
		            console.log("success: ",data);
		        }
		        ,complete: function(response, exito){
		        	  console.log("Complete",response);
		            if(exito=="success"){
		                alert("Y con éxito");
		            }
		        }
		   }) ;  
	}
	
 
	function jsonFlickrApi(rsp){
		if (rsp.stat != "ok"){
			alert(rsp.stat+' - '+ rsp.code+ ' - '+ rsp.message);
		}else{
			alert(rsp.auth.token._content);
			alert(rsp.auth.perms._content);
			alert(rsp.auth.user.nsid);
			alert(rsp.auth.user.username);
			alert(rsp.auth.user.fullname);
			token=rsp.auth.token._content;
		}
	}  