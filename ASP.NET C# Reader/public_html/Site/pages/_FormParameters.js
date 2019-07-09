


var FormParameters = function() {

    this.things = new Object();
    this.clear = function() {
        this.things = new Object();
    }


    this.getParameters = function() {
        this.parameters = "";
        var keys = [];

        for (var key in this.things) {
            if (this.things.hasOwnProperty(key)) {
                keys.push(key);
            }
        }
        keys.sort();

        var data = new FormData();


        var flag = true;
        
        for (i in keys) {
            var key = keys[i];
            var value = this.things[key].value;
            data.append(key, value);


        }
        return (data);
    }

    this.getBase = function() {

        var keys = [];

        for (var key in this.things) {
            if (this.things.hasOwnProperty(key)) {
                keys.push(key);
            }
        }
        keys.sort();

        var base = flickr.secreto;

        var flag = true;
        for (i in keys) {
            var key = keys[i];
            var value = this.things[key].value;
            base += key + value;
        }
        return base;
    }

    this.addParameter = function(pName, pValue) {
        this.things[pName] = { "value": pValue, "number": 0 };
    }

};
