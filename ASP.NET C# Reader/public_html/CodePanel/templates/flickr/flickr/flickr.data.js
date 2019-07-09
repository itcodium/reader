var FlickrData = function () {
    if (window.openDatabase) {
        try {
            viupho.db = window.openDatabase(database.Name, '', database.Name, 5 * 1024 * 1024, onDBCreate);
            console.log("Database Open Successfully");
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert("This device does not have HTML5 Database support");
    }


    this.getToken = function (callback) {
        try {
            viupho.db.transaction(function (tx) {
                console.log("Database -> viupho.db.transaction");
                tx.executeSql('SELECT * FROM AplicationModule where ModuleID="FLICKR"', [], function (tx, results) { callback(results); }, onDataBaseError);
            });
        } catch (err) {
            console.log("Tratar el error aqui!!" + err.message);
        }
    }

    this.deleteUserToken = function (id, callback) {
        viupho.db.transaction(function (tx) {
            tx.executeSql("DELETE FROM AplicationModule WHERE ModuleID=?", [id],
                    function (tx, result) {
                        callback(result);
                    },
         onDataBaseError);
        });
    }
    this.AplicationModuleDelete = function () {
        viupho.db.transaction(function (tx) {
            tx.executeSql("DELETE FROM AplicationModule WHERE ModuleID=?", "FLICKR",
                    function (tx, result) {
                        console.log("********",result);
                      return;
                    },
         onDataBaseError);
        });
    }

    this.setToken = function (user, callback) {
        console.log("**** setToken **** ", user,callback);
        viupho.db.transaction(function (tx) {
            tx.executeSql('INSERT INTO AplicationModule (ModuleID, user_id,user_name, perms, token) VALUES (?,?,?,?,?)', [user.moduleId, user.user_id, user.user_name, user.perms, user.token]
		            			, function (tx, results) {
		            			    tx.executeSql('SELECT * FROM AplicationModule where ModuleID="FLICKR"', [], function (tx, results) {
		            			        if (results.rows.length == 0 || results.rows.item(0).token == "") {
		            			            var vgetToken = new FlickrError();
		            			            vgetToken.InvalidAuthToken($("#log"));
		            			        }else{
                                            console.log("Token Results -->",user,results.rows);
                                            callback(results);  
                                        }
		            			    }, onDataBaseError);

		            			}, onDataBaseError);
        });
    }
    
     this.InsertItem = function (pFlickr, callback) {
                viupho.db.transaction(function (tx) {
                    tx.executeSql('SELECT id FROM Flickr WHERE  id=?',[pFlickr.id]
                                        , function (tx, results) {
                                            //callback(results);
                                            if (results.rows.length == 0) {
                                                    viupho.db.transaction(function (tx) {
                                                    tx.executeSql('INSERT INTO Flickr (farm,id,isfamily,isfriend,ispublic,owner,secret,server,title,originalsecret,originalformat) VALUES (?,?,?,?,?,?,?,?,?,?,?)',
                                                     [pFlickr.farm,pFlickr.id,pFlickr.isfamily,pFlickr.isfriend,pFlickr.ispublic,pFlickr.owner,pFlickr.secret,pFlickr.server,pFlickr.title,pFlickr.originalsecret,pFlickr.originalformat]
                                                                        , function (tx, results) {
                                                                            callback(results);
                                                                        }, onDataBaseError);
                                                });
                                             }
                                        }, onDataBaseError);
                });
    }
    

    this.deleteFlickrTable = function () {
        viupho.db.transaction(function (tx) {
            tx.executeSql("DELETE FROM Flickr", [],
                    function (tx, result) {
                        console.log("DeleteFile -->",result);
                    },
         onDataBaseError);
        });
    }

    this.GetAllPictures = function (callback) {
        try {
            viupho.db.transaction(function (tx) {
                tx.executeSql('SELECT * FROM Flickr', [], function (tx, results) {callback(results); }, onDataBaseError);
            });
        } catch (err) {
            console.log("Tratar el error aqui!!" + err.message);
        }        
    }
    
    
    this.CountFlickrImages= function (callback) {
        try {
            viupho.db.transaction(function (tx) {
                tx.executeSql('SELECT count(*) rows FROM Flickr', [], function (tx, results) {callback(results); }, onDataBaseError);
            });
        } catch (err) {
            console.log("Tratar el error aqui!!" + err.message);
        }
    }


    this.updateLocalImage = function (callback,data) {
        console.log("this.updateLocalImage",data);
        viupho.db.transaction(function (tx) {
            tx.executeSql("UPDATE Flickr SET localImage=? where IdFlickr=?", [data.path,data.id],
                    function (tx, results) {
                       callback(results,data);
                    },
         onDataBaseError);
        });
    }

    this.deleteImage = function (callback,data) {
        viupho.db.transaction(function (tx) {
            tx.executeSql("DELETE FROM Flickr where Id=? AND secret=?", [data.id,data.secret],
                    function (tx, results) {
                       callback(results,data);
                    },
         onDataBaseError);
        });
    }

    this.updateLocalThumbnail = function (callback,data) {
        console.log("this.updateLocalThumbnail",data);
        viupho.db.transaction(function (tx) {
            tx.executeSql("UPDATE Flickr SET localThumbnail=? where IdFlickr=?", [data.path,data.id],
                    function (tx, results) {callback(results,data); },
         onDataBaseError);
        });
    }
    this.resetLocalImage = function () {

        viupho.db.transaction(function (tx) {
            tx.executeSql("UPDATE Flickr SET localImage=?,localThumbnail=?", [null,null],
                    function (tx, result) {
                        console.log("update localImage -->",result);
                    },
         onDataBaseError);
        });
    }
    
};       // Fin DataToken
  
 
 
 FlickrData.prototype = new DataBase;
 
 



 /*
 
					   
	this.updateToken=function (callback,user){
	    console.log("Database -> this.updateToken");
	    	try{
	      		viupho.db.transaction(function (tx) {
	      	    	   tx.executeSql('UPDATE Flickr SET user_id=?, user_name=?, perms=?, token=? where flickrID="APP_USER"',[user.user_id,user.user_name,user.perms,user.token],
	      	 				   function (tx, user){ callback();},onDataBaseError);
	      	 		});
	      	  }catch(err){
	      		alert("updateToken",err.message );
	      	  }
	} 

 */