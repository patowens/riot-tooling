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
		      <!--<li class="dropdown">
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">Action</a></li>
		          <li><a href="#">Another action</a></li>
		          <li><a href="#">Something else here</a></li>
		          <li role="separator" class="divider"></li>
		          <li><a href="#">Separated link</a></li>
		        </ul>
		      </li>
		      -->
		    </ul>
		  </div>
		</div>
  </nav>

	this.links = [
		{ title: 'Todos', href: '#/1'},
		{ title: 'Riot + Famo.us', href: '#/2'},
		{ title: 'Coverflow', href: '#/3'}
	]

	this.activeLink = '#/2'

	isActiveLink(href) {
		return this.activeLink === href;
	}

	handleClickedLink(e) {
		this.activeLink = e.item.link.href
	}

</navbar>