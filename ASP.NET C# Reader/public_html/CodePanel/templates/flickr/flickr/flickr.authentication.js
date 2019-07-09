var flickr_authorize = "http://www.flickr.com/services/oauth/authorize?oauth_token=";

var FlickrAuthentication = function (token) {
 

    this.request_token = function (callback) {
     getFlickrAuthorizeUrl("");
    }

    this.access_token = function (callback) {
        message = { method: "GET",
            action: "http://www.flickr.com/services/oauth/access_token",
            parameters: OAuth.decodeForm("")
        };

        oauth_nonce = OAuth.nonce(32);
        oauth_timestamp = OAuth.timestamp();
           }

};


function getFlickrAuthorizeUrl(data) {
    console.log("getFlickrAuthorizeUrl", data,"vFlickrModel.getModel()", "http://www.flickr.com/auth-72157629895209011");
   //     var vFlickrModel=new FlickrTextLangModel();
     //   var flickrView = new FlickrView({ el: $("#FlickrAuthorize"), panel: "FlickrAuthorize", variables: vFlickrModel.getModel(), flickrAuthorizeUrl: "http://www.flickr.com/auth-72157629895209011"});
}

function tokenDB2(results) {
    console.log("results",results);
}

function test() {
    alert("test");
}

   
