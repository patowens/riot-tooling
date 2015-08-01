<todos>

		<ul class="nav nav-tabs" style="margin-bottom:25px;">
			<li each={ tabs } class={ active: isTabActive(ref) } onclick={ handleTabClick }><a>{ title }</a></li>
		</ul>

		<div class="tab-content">
			
			<div role="tabpanel" class="tab-pane { active: isTabActive(1) }">
				
				<form name="todo-input" class="form-horizontal" onsubmit={ handleFormSubmit }>
					<div class="input-group">
			      <input name="input" type="text" class="form-control" placeholder="Something need doing?" onkeyup={ handleInputEdit }>
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="submit">Add</button>
			      </span>
				  </div>
				</form>

				<hr />

				<ul class="list-group">
					<li each={ items.filter(filterByActive).sort(this.sortByEnd) } class="list-group-item { done: done }">
						<div class="checkbox">
					    <label>
					      <input type="checkbox" checked={ done } onchange={ handleCheckboxToggle }> { title }
					    </label>
					    <i class="todo-action-icon glyphicon glyphicon-remove-sign fright" onclick={ handleClickRemoveTodo }></i>
					  </div>
					</li>
				</ul>

				<div class="empty-message { hide: hideEmptyMessage() }" >
					<h4>A clean slate, well done.</h4>
				</div>
				
				<a onclick={ handleClickClearComplete } class={ hide: hideClearComplete() }><i class="glyphicon glyphicon-trash"></i>Clear Completed</a>
			
			</div>

			<div role="tabpanel" class="tab-pane { active: isTabActive(2) }">
				<ul class="list-group">
					<li each={ items.filter(filterByArchived) } class="list-group-item done">
						<div class="checkbox">
					    <label>
					      <input type="checkbox" disabled checked={ done } class="done"> { title }
					    </label>
					  </div>
					</li>
				</ul>
			</div>
			
		</div>

	var RiotControl = require('riotcontrol');

	this.on('mount', function() {
		console.log('mounted');
		// Trigger init event when component is mounted to page.
		// Any store could respond to this.
		RiotControl.trigger('todo_init');
	});

	this.items = [];
	this.disabled = false;
	this.tabs = [
		{ title: 'To do', ref: 1 },
		{ title: 'Archive', ref: 2 },
	]
	this.activeTab = 1;

	// Register a listener for store change events.
  RiotControl.on('todos_changed', function(items) {
    this.items = items
    this.update()
  }.bind(this)); 

	handleInputEdit(e) {
		this.text = e.target.value;
	}

	handleFormSubmit(e) {
		e.preventDefault();
		if (this.text) {
			// Trigger an event to all stores that are registered in the central dispatch.
			// Why? This allows loosely coupled stores/components to respond to the same events.
			RiotControl.trigger('todo_add', { title : this.text, done: false, archived: false });
			this.text = this.input.value = "";
		}
	}

	handleCheckboxToggle(e) {
		var item = e.item
    item.done = !item.done
    return true
	}

	handleClickRemoveTodo(e) {
		RiotControl.trigger('todo_remove', e.item);
	}

	handleClickClearComplete() {
		this.items.filter(function(item) { 
			return item.done == true;
		})
		.map(function(item) {
			item.archived = true;
		});
	}

	handleTabClick(e) {
		this.activeTab = e.item.ref;
	}

	isTabActive(ref) {
		return this.activeTab === ref;
	}

	hideClearComplete() {
		var count = this.items.filter(function(item) {
			if (item.done == true && item.archived == false)
				return true
		}).length;
		return !count;
	}

	hideEmptyMessage() {
		return this.items.filter(this.filterByActive).length > 0
	}

	// Quick sorts
	sortByStart(a,b) {return a.id - b.id; }
	sortByEnd(a,b) {return b.id - a.id; }
	// Quick filters
	filterByActive(item) { return item.archived == false; }
	filterByComplete(item) { return item.done == true; }
	filterByArchived(item) { return item.archived == true; }


</todos>