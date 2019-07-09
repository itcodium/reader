
var ReadDirectory = function() {
    var path = "";
    var pathReader;
    var callback;

    window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem;

    this.getFiles = function() {
        return files;
    }

    var errorHandler = function errorHandler(e) {
        console.log('RDIR -> ', e.code, e.message, e.name);
    }
    
    function readDirectory(directoryEntry) {
        var reader = directoryEntry.createReader();
        reader.readEntries(callback, errorHandler);
    }

    this.getDirectory = function(fs) {
        fs.root.getDirectory(path, { create: true }, readDirectory, errorHandler);
    }


    this.read = function(aPath, pCallback) {
        path = aPath;
        callback = pCallback
        window.requestFileSystem(window.TEMPORARY, 1024 * 1024, this.getDirectory);
    }

    

    this.setError = function(callback) {
        errorHandler = callback;
    }


};




