var SaveFile = function(pSandbox) {

    var url = "";
    var fileName;
    var directory;
    var fullPath;
    var localFolder = "";
    var blob;
    var data;
    var id;

    window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem;


    this.setLocalFolder = function(aFolder) {
        localFolder = aFolder;
    }

    this.setCallBack = function(aCallback) {
        fn_Callback = aCallback;
    }

    function gotFs(fs) {
        console.log("SaveFile gotFs", fullPath);
        fs.root.getFile(fullPath, { create: true }, gotFile, errorHandler);
    }

    function gotFile(fileEntry) {
        fileEntry.createWriter(gotWriter, errorHandler);
    }

    function gotWriter(fileWriter) {
        fileWriter.onerror = errorHandler;
        fileWriter.write(blob);
    }

    this.saveXMLHttpRequest = function(pUrl, pName) {
        fileName = pName;

        var xhr = new XMLHttpRequest();
        xhr.open('GET', pUrl, true);
        xhr.responseType = 'blob';
        xhr.onload = function(e) {
        if (this.status == 200) {
        blob = new Blob([this.response], { type: 'image/png' });
        window.webkitRequestFileSystem(PERSISTENT, 1024 * 1024, gotFs, errorHandler);
        }
        };
        xhr.send();
    }


 
    this.directoryExists = function(pDirectory, callback) {
        window.requestFileSystem(PERSISTENT, 1024 * 1024,
                    function(fs) {
                        fs.root.getDirectory(pDirectory,
                                           { create: false },
                                            function() {
                                                callback(true);
                                            },
                                            function() {
                                                createDirectory(fs, pDirectory); // callback(false);
                                            }

                                            );

                    }, errorHandler);
    }


    createDirectory = function(fs, pDirectory) {
        createDir(fs.root, pDirectory.split('/'));
    }



    function createDir(rootDirEntry, folders) {
        if (folders[0] == '.' || folders[0] == '') {
            folders = folders.slice(1);
        }

        if (folders.length != 0) {
            rootDirEntry.getDirectory(folders[0], { create: true }, function(dirEntry) {
                if (folders.length) {
                    createDir(dirEntry, folders.slice(1));
                }
            }, errorHandler);
        } else {
            fn_saveImageData();
        }
    };

    var fn_callback;

    function fn_saveImageData(p) {
        if (p == true) {
            fn_saveImageData();
        }
    }

    function fn_saveImageData() {
        blob = new Blob([data], { type: 'image/png' });
        window.webkitRequestFileSystem(PERSISTENT, 1024 * 1024, gotFs, errorHandler);
        console.log("fn_saveImageData  ", fullPath);
        fn_Callback(id, fullPath);
    }

    this.save = function(pImageData, pName, pId) {
        id = pId;
        fullPath = pName;
        fileName = this.getFileName(pName);
        data = pImageData;
        directory = this.getFileDirectory(pName);
        directory = directory.toString().replace(/,/g, '/');
        this.directoryExists(directory, fn_saveImageData);
    }





    this.getFileName = function(pFile) {
        var names = pFile.split("/");
        return names.splice(names.length - 1, 1).join();
    }
    this.getFileDirectory = function(pFile) {
        var names = pFile.split("/");
        return names.splice(0, names.length - 1).join();
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
                msg = 'Unknown Error' + e.code;
                break;
        };

        console.log('FS_0584: ' + msg);
    }



};
 

