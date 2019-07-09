

 

var FlickrCaller = function (token) {
    var p = new ApiCall();
    this.token = token;
    this.setToken = function (pToken) { this.token = pToken; }
    this.getToken = function () { return this.token; }

    this.getPhotosetsList = function (callback) {
        p.setMethod("flickr.photosets.getList");
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }

    
    this.getAccessToken= function (auth_token,callback) {
        p.setMethod("flickr.auth.oauth.getAccessToken");
        p.addParameter("auth_token", auth_token);
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }
    
    this.checkToken = function (callback) {
        p.setMethod("flickr.auth.checkToken");
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }
    this.getPhotoset = function (idPhotoset, callback) {
        p.setMethod("flickr.photosets.getPhotos");
        p.addParameter("photoset_id", idPhotoset);
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }
    this.getPhotosetPager = function (idPhotoset, ppage, page, callback) {
        p.setMethod("flickr.photosets.getPhotos");
        p.addParameter("photoset_id", idPhotoset);
        p.addParameter("per_page", ppage);
        p.addParameter("page", page);
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }
    this.getPhotoInfo = function (idPhoto, callback) {
        p.setMethod("flickr.photos.getInfo");
        p.addParameter("photo_id", idPhoto);
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }
    this.photosetsCreate = function (title, description, primary_photo_id, callback) {
        p.setMethod("flickr.photosets.create");
        p.addParameter("title", title);
        p.addParameter("description", description);
        p.addParameter("primary_photo_id", primary_photo_id);
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }
    this.photosetsEditMeta= function (photoset_id,title, description) {
        p.setMethod("flickr.photosets.editMeta");
        p.addParameter("photoset_id", photoset_id);
        p.addParameter("title", title);
        p.addParameter("description", description);
        p.addParameter("format", "json");
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }

    this.photos_Search= function (user_id,callback) {
        p.setMethod("flickr.photos.search");
        p.addParameter("user_id", user_id);
        p.addParameter("extras", "original_format");
        p.addParameter("format", "json");
        p.setCallbackName(callback);
        p.setToken(this.token);
        p.call();
    }

};
 