var database= {
				Name: 'Viupho Mono',
				Version: '1',
				Description: 'Viupho Mono'
};

var flickr= {
		api_key: "e46c7740bb76c066ccdc938e9dc04bd2",
		secreto: "ba36c6a81afc73a0",
		miniTokenUrl: 'https://www.flickr.com/auth-72157629895209011',
		aplication:"Viupho flickr",
		photoUrl: "http://www.flickr.com/photos"
	};
	
	
var flickrUser= {
        moduleId:"FLICKR",
		user_id:"",
		user_name:"",
        perms: "",
		token: ""
	};
 

common_aplication_sandbox = true;

var ApplicationRoot = function () {

    var application_directory = "/viuphoBox";
    var localurl = "filesystem:http://localhost/temporary/rippleFileSystem/undefined/sandbox";

    this.getAppFolder = function (folder) {
        var localFolder = blackberry.io.sharedFolder + "/downloads" + application_directory + folder;
        
        if (localFolder == "/webworksBB10/sharedFolder/downloads" + application_directory+ folder) {
            localFolder = "" + application_directory;
        }
     //   console.log("ApplicationRoot localFolder",localFolder);
        return localFolder;
    }

    this.getLocalUrl = function () {
        return localurl;
    }
};


var appRoot = new ApplicationRoot();
 





