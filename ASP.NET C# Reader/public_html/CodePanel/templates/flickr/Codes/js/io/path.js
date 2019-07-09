var Path  = function () {
    
    this.GetFileName = function (parameter) {
			var file=parameter.split("/");
                file= file.splice(file.length-1,1).join().toString().replace(/,/g ,'/');
				
	return file;
    }
	this.GetDirectoryName = function (parameter) {
		var dir= parameter.split("/");
                  dir=dir.splice(0,dir.length-1).join().toString().replace(/,/g ,'/');
				  
	return dir;
    }
};
 
				
				
              
				  

