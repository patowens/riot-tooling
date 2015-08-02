var Riot = require('riot');
var RiotControl = require('riotcontrol');
var FamousEngine = require('famous/core/FamousEngine');
app = Object.create(Riot);
var Routes = require('./routes.js')(app);

// declare data stores
var TodoStore = require('./stores/todo-store');
var todoStore = new TodoStore();
RiotControl.addStore(todoStore);

// declare riot tags
var main = require('./components/main.tag');
var navbar = require('./components/navbar.tag');
var todos = require('./components/todos.tag');

// mount riot app
app.mount('div#main', 'main', { title: 'Riot App'});

// get the router going
app.route.start() // start again

// boot up famous
FamousEngine.init();