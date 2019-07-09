 
 self.onmessage = function(e) {
    getData(e.data.url) 
};

 

 var xhr;
function getData(url, params) {
    try {
    /*
        var data = new FormData();
        data.append('user', 'person');
        data.append('pwd', 'password');
        data.append('organization', 'place');
        data.append('requiredkey', 'key');
           xhr.send(data);
        
        */
        xhr = new XMLHttpRequest();
        xhr.open('POST', url & 'callback=insertReply', false);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    postMessage(xhr.responseText);
                }
            }
        };
        xhr.send(null);
    } catch (e) {
        postMessage('Error occured');
    } 
}
 