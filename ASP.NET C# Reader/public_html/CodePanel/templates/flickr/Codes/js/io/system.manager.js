var FileSystemManagerApi = function () {
    var path = "";
    var pathReader;
    var callback;

    blackberry.io.sandbox = common_aplication_sandbox;

    window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem;

    if (typeof blackberry == 'undefined') {
        alert('blackberry is undefined');
    }

    this.getFiles = function () {
        return files;
    }

    function readDirectory(directoryEntry) {
        var reader = directoryEntry.createReader();
        reader.readEntries(callback, errorHandler);
    }

    this.getDirectory = function (fs) {
        fs.root.getDirectory(path, { create: true }, readDirectory, errorHandler);
    }


    this.read = function (aPath, pCallback) {
        path = aPath;
        callback = pCallback
        window.requestFileSystem(window.TEMPORARY, 1024 * 1024, this.getDirectory);
    }


    this.createFolder = function (folder) {
        console.log("folder: ",folder);
        window.requestFileSystem(window.TEMPORARY, 1024 * 1024,
            function (fs) {
                fs.root.getDirectory(folder, { create: true }, function (dirEntry) {
                    console.log('You have just created the ' + dirEntry.name + ' directory.');
                }, errorHandler);
            }
        );



    };


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

        console.log('RDIR -> ' + msg);

    }
};
 

