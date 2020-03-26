const express = require('express');
var session = require('express-session');
var pg = require('pg');
const bodyParser = require('body-parser');
var path = require('path');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

app.use(express.static('public'));

app.get('/', function(request, response) {
	response.sendFile(path.join(__dirname + '/index.html'));
});

app.post('/auth', function(request, response) {
	var username = request.body.name;
	var password = request.body.password;
  console.log(username);
  console.log(password);

	if (username && password) {
		// connection.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			// if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				response.redirect('/home');
			// } else {
				// response.send('Incorrect Username and/or Password!');
			// }			
			response.end();
		// });
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	} 
});

app.get('/home', function(request, response) {
	if (request.session.loggedin) {
	  response.sendFile(path.join(__dirname + '/public/home.html'));
	} else {
		response.send('Please login to view this page!');
	}
});

app.post('/actions', function(request, response) {
  console.log('test');
  if (request.body.adduser) {
    response.sendFile(path.join(__dirname + '/public/adduser.html'));
  } else if (request.body.deleteuser) {
    response.sendFile(path.join(__dirname + '/public/deleteuser.html'));
  } else if (request.body.edituser) {
    response.sendFile(path.join(__dirname + '/public/edituser.html'));
  } else if (request.body.showusers) {
    response.sendFile(path.join(__dirname + '/public/showuser.html'));
  }
});

app.post('/logout', function(request, response) {
  if (request.session.loggedin) {
    request.session.loggedin = false;
    request.session.name = "";
    request.logout;
    response.redirect('/');
  }
});

app.listen(3000, () => console.log('server started'));