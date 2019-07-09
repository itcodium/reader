 
var ApiCall = function (){
	this.url= "https://api.flickr.com/services/rest/?";
	this.method= "";
	this.format="json";
	this.token="";
	this.callbackName="jsonFlickrApi";
	this.setUrl = function(url){this.url = url;}
	this.getUrl = function(){return this.url;}
	this.setToken = function(token){this.token= token;}
	this.getToken = function(){return this.token;}
	this.setMethod = function(method){this.method = method;}
	this.getMethod = function(){return this.method;}
	this.setCallbackName = function(callbackName){this.callbackName = callbackName;}
	this.getCallbackName = function(){return this.callbackName;}
	this.parameters="";
	this.things = new Object ();
	this.clear=	function (){
		this.things = new Object ();	
	}
	
	this.clearParameters=	function (){
		this.parameters = "";	
	}
	this.getParameters=	function (){
		this.parameters="";
		var keys = [];

		for (var key in this.things) {
	      if (this.things.hasOwnProperty(key)) {
	    	  keys.push(key);
	      }
	    }
	    keys.sort();
	    var flag=true;
	    for (i in keys) {
	      var key = keys[i];
	      var value = this.things[key].value;
	      if(flag){
	    	  this.parameters+=key+"="+value;
	    	  flag=false;
	      }else{
	    	  this.parameters+='&'+key+"="+value;  
	      }
	      
	    }
	    return(this.parameters);
	}
 
	this.getBase=	function (){
		
		var keys = [];

		for (var key in this.things) {
	      if (this.things.hasOwnProperty(key)) {
	    	  keys.push(key);
	      }
	    }
	    keys.sort();
	    
	    var base=flickr.secreto;
	    
	    var flag=true;
	    for (i in keys) {
	      var key = keys[i];
	      var value = this.things[key].value;
	    	  base+=key+value;
	    }
	    return base;
	}
 
	this.addParameter=	function (pName, pValue){
		this.things[pName] = {"value" : pValue, "number" : 0};
	}
	
	this.getApiSign=function(base){
		if(this.api_sig!=""){
			this.api_sig=hex_md5(this.getBase());
		}
		return this.api_sig;
	}
	this.call=function(){
				this.parameters="";
				var vUrl="";
				var vCallback="";
				var vCallbackParam="";
				
				if(this.callbackName!="jsonFlickrApi"){
					vCallback='jsoncallback'+this.callbackName;
					this.addParameter("jsoncallback",this.callbackName);
				}
				
				this.addParameter("method",this.method);
				this.addParameter("api_key",flickr.api_key);
				this.addParameter("format",this.format);
				this.addParameter("auth_token",this.token);
				vUrl=this.url+this.getParameters()+'&api_sig='+this.getApiSign();
				//console.log("*** ",vUrl);
				 
						$.ajax({
						    url:vUrl 
						   ,cache:true 
						   ,dataType: "jsonp"
						   ,error: this.showError
						}); 	
		}
 
  
	
 
};




	$.ajaxPrefilter( function( options ) {
		var u=options.url.substring(0,options.url.indexOf('&callback'));
		if(u!=""){
			options.url=options.url.substring(0,options.url.indexOf('&callback'));
		}	
	});

	
		
function jsonFlickrApi(rsp){
	alert("jsonFlickrApi");
	console.log(rsp);
}
 