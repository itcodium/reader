if (typeof this.data== 'undefined') {
    this.data = {};
}

data.db = null;

var DataBase = function() {
    if (window.openDatabase) {
        try {
            data.db = window.openDatabase('TestDB', '1.0', 'Descripcion de la base de datos', 5 * 1024 * 1024, onDBCreate);
            $("#PagePanel").append("<li>DataBase (database.js): Open database Successfully</li>");
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert("This device does not have HTML5 Database support");
    }
};   
  
 
function onDBCreate() {
     try{
         data.db.transaction(
		            function (tx) {
		                tx.executeSql('CREATE TABLE IF NOT EXISTS Test (IdTest text unique ,descripcion text)',
		                [], function (tx, res) {

		                $("#PagePanel").append("AplicationModule -> onDBCreate --> Tabla AplicationModule creada");
		                },
		                function (tx, err) {
		                    $("#PagePanel").append("ERROR - Table creation failed - code: " + err.code + ", message: " + err.message);
		                });
		            }
		        );
	 }
	 catch(err){
	  $("#PagePanel").append("onDBCreate: "+err.message);
 	}
} 
 
function onDataBaseError(tx, error) {
	$("#PagePanel").append("onDataBaseError: "+error.message);
 }


 