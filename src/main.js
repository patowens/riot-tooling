var Riot = require('riot');
var RiotControl = require('riotcontrol');

// declare data stores
var TodoStore = require('./stores/todo-store');
var todoStore = new TodoStore();
RiotControl.addStore(todoStore);

// declare riot tags
var app = require('./components/app.tag');
var navbar = require('./components/navbar.tag');
var todos = require('./components/todos.tag');

// mount riot app
Riot.mount('div#main', 'app', { title: 'Riot App'});