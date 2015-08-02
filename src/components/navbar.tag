<navbar>
	<nav class="navbar">
		<div class="container">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">
		        Area 51
		      </a>
		    </div>

		    <ul class="nav navbar-nav navbar-right">
		      <li each={ link, i in links } class={ is-active: parent.isActiveLink(link.href) }>
		      		<a href={ link.href } onclick={ parent.handleClickedLink }>{ link.title }</a>
		      </li>
		    </ul>
		  </div>
		</div>
  </nav>

	this.links = [
		{ title: 'Todos', href: '#/todo'},
		{ title: 'Riot + Famo.us', href: '#/famous'}
	]

	this.activeLink = '#/2'

	isActiveLink(href) {
		return this.activeLink === href;
	}

	handleClickedLink(e) {
		app.route(e.item.link.href);
		this.activeLink = e.item.link.href
	}

</navbar>