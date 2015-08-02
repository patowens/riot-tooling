var Riot = require('riot');

module.exports = function(app) {
	app.route(function() {	
		
		// eg ["#", "hello", "world"]
		var args = Array.prototype.slice.call(arguments);

		// eg ["#", "hello", "world"] => ["hello", "world"]
		args.shift()

		// eg ["hello", "world"] => app.routes.hello("world")
	  var method = app.routes[args.shift()]

	  // if exists, call the method
	  var handled = method && method.apply(app, args) !== false
	  
	  // else, go home.
	  if(!handled) app.route('/')

	});

	app.routes = {}

	app.routes.todo = function() {
		console.log('todo route');
	},

	app.routes.famous = function() {
		console.log('famous route');
	},

	app.routes.coverflow = function(foo, bar) {
		console.log('coverflow route', foo, bar);
	}

}