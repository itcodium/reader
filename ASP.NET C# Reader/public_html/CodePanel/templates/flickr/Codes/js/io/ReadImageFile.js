var ReadImageFile = function (pSanbox) {
    url = "";
    var imageFileReader;
    blackberry.io.sandbox = pSanbox;
    window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem;

 

    function readFile(fileEntry) {
        fileEntry.file(imageFileReader, errorHandler);
    }

    this.getFile = function (fs) {
        fs.root.getFile(url, { create: false }, readFile, errorHandler);
    }


    this.read = function (pUrl, pImageFileReader) {
        url = pUrl;
        imageFileReader = pImageFileReader;
        window.requestFileSystem(window.TEMPORARY, 1024 * 1024, this.getFile);
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

        alert('Read File: ' + msg);
    }
};
 

