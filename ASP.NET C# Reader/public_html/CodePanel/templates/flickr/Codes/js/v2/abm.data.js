if (typeof this.data == 'undefined') {
    this.data = {};
}

var AbmData = function() {
    if (window.openDatabase) {
        try {
            data.db = window.openDatabase('DATE01', '1.0', 'Descripcion de la base de datos', 5 * 1024 * 1024, onDBCreate);
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert("This device does not have HTML5 Database support");
    }

    this.insertItem = function(description, callback) {
        data.db.transaction(function(tx) {
            tx.executeSql('INSERT INTO Items (description) VALUES (?)', [description]
		            			, function(tx, results) {
		            			    callback(results);
		            			}, onDataBaseError);
        });
    }

    this.GetAllItems = function(callback) {
        try {
            data.db.transaction(function(tx) {
                tx.executeSql("SELECT * FROM Items", [], function(tx, results) {
                    callback(results);
                }, onDataBaseError);
            });
        } catch (err) {
            console.log("Tratar el error aqui!!" + err.message);
        }
    }



    this.updateItem = function(callback, p) {
        try {

            data.db.transaction(function(tx) {
                tx.executeSql("UPDATE Items SET description=? where IdItem=?", [p.description, p.IdItem],
                function(tx, results) {
                    callback(results);
                },onDataBaseError);
            });
        } catch (err) {
            console.log("Tratar el error aqui!!" + err.message);
        }
    }

    this.deleteItem = function(callback, id) {
        data.db.transaction(function(tx) {
            tx.executeSql("DELETE FROM Items where IdItem=? ", [id],
            function(tx, results) {
                callback(results);
            },
            onDataBaseError);
        });
    }

};


    function onDBCreate() {
        try {
            data.db.transaction(
		                function(tx) {
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Items (IdItem integer primary key autoincrement ,description text)',
		                    [], function(tx, res) {

		                        alert("AplicationModule -> onDBCreate --> Tabla AplicationModule creada");
		                    },
		                    function(tx, err) {
		                        alert("ERROR - Table creation failed - code: " + err.code + ", message: " + err.message);
		                    });
		                }
		            );
        }
        catch (err) {
            alert("onDBCreate: " + err.message);
        }
    }

    function onDataBaseError(tx, error) {
        alert("onDataBaseError: " + error.message);
    } 