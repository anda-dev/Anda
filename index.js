const express = require('express');
var session = require('express-session');
var pg = require('pg');
const bodyParser = require('body-parser');
var path = require('path');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static('public'));

app.get('/', function(request, response) {
	response.sendFile(path.join(__dirname + '/login.html'));
});

app.post('/auth', function(request, response) {
	var username = request.body.name;
	var password = request.body.password;
  console.log(username);
  console.log(password);

	/* if (username && password) {
		connection.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				response.redirect('/home');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	} */
});

/* app.get('/', (req, res) => {
  res.sendFile('public/index.html');
}); */

app.listen(3000, () => console.log('server started'));