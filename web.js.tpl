var express = require('express');
var app = express.createServer(express.logger());

app.get('/', function(request, response) {
        response.send('Hello.  Please give me a Norwegian postal ' +
                      'code (postnummer) and I will give you the place');
});

app.get('/:pc', function(request, response) {
	if (p.hasOwnProperty(request.params.pc)) {
		response.send(p[request.params.pc]);
	}
	else {
		response.send('Invalid postal code (postnummer)',404);
	}
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
	console.log("Listening on " + port);
});

// add data here

