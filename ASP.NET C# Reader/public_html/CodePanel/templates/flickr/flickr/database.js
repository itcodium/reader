 

if (typeof this.viupho == 'undefined') {
    	this.viupho = {};
}
//viupho.db=null;

var DataBase = function () {
    if (window.openDatabase) {
        try {
            viupho.db = window.openDatabase(database.Name, '', database.Name, 5 * 1024 * 1024, onDBCreate);
            console.log("(Database) Open Successfully");
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert("This device does not have HTML5 Database support");
    }

};  // Fin DataToken
  
 
function onDBCreate() {
     try{
	     viupho.db.transaction(
		            function (tx) {
		                tx.executeSql('CREATE TABLE IF NOT EXISTS AplicationModule (ModuleID text unique ,user_id text,user_name text,perms text,token text,secret text)',
		                [], function (tx, res) {
		                    console.log("AplicationModule -> onDBCreate --> Tabla AplicationModule creada");
		                },
		                function (tx, err) {
		                    console.log("ERROR - Table creation failed - code: " + err.code + ", message: " + err.message);
		                });


		            }
		        );

	  
           viupho.db.transaction(
		            function (tx) {
		            	tx.executeSql('CREATE TABLE IF NOT EXISTS Flickr (IdFlickr INTEGER PRIMARY KEY,farm INT, id INTEGER ,isfamily BIT ,isfriend BIT,ispublic BIT,owner text,secret text,server text,title text,dir text,path text,localPath text,root text,localThumbnail text,localImage text,created DATETIME,originalsecret text,originalformat text)',
		                [], function (tx, res) {
		                    console.log("AplicationModule -> onDBCreate --> Tabla Dropbox creada");
		                },
		                function (tx, err) {
		                    console.log("ERROR - Table creation failed - code: " + err.code + ", message: " + err.message);
		                });

		                
		            }
		        );
	 }
	 catch(err){
	  console.log("onDBCreate: "+err.message);
 	}
} 
 
function onDataBaseError(tx, error) {
	console.log(error.message);
 }


 