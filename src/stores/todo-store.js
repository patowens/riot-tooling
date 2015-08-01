var Riot = require('riot');

module.exports = function TodoStore() {

	Riot.observable(this)
	
	this.todos = [
		{ id: 1, title: 'Take out the trash', done: false, archived: false },
		{ id: 2, title: 'Unpack the dishwasher', done: false, archived: false },
		{ id: 3, title: 'Mow the lawn', done: false, archived: false },
		{ id: 4, title: 'Wash the car', done: true, archived: false },
		{ id: 5, title: 'Clean the barbeque', done: true, archived: true }
	]

	// Our store's event handlers / API.
  // This is where we would use AJAX calls to interface with the server.
  // Any number of views can emit actions/events without knowing the specifics of the back-end.
  // This store can easily be swapped for another, while the view components remain untouched.

	this.on('todo_add', function(newTodo) {
		var highest = 0;
		for(var i = 0; i < this.todos.length; i++) {
	    var id= parseInt(this.todos[i].id);
	    if(id > highest) {
	    	highest = id;
	    }
    }
    newTodo.id = highest + 1;
		this.todos.push(newTodo)
		this.trigger('todos_changed', this.todos)
	}.bind(this));

	this.on('todo_remove', function(todo) {
		var index;
		for (var i = 0; i < this.todos.length; i++) {
			if (this.todos[i].id == todo.id) {
				index = i;
			}
		}
		this.todos.splice(index, 1);
		this.trigger('todos_changed', this.todos)
	}.bind(this));

	this.on('todo_init', function() {
		this.trigger('todos_changed', this.todos)
	}.bind(this));

	// The store emits change events to any listening views, so that they may react and redraw themselves.

}