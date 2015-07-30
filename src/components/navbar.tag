<navbar>

	<span class="float-left">{ opts.title }</span>

	<ul class="float-right">
		<li each={ link, i in links } class={ is-active: parent.isActiveLink(link.href) }><a href={ link.href } onclick={ parent.handleClickedLink }>{ link.title }</a></li>
	</ul>

	this.links = [
		{ title: 'Link 1', href: '#/1'},
		{ title: 'Link 2', href: '#/2'},
		{ title: 'Link 3', href: '#/3'}
	]

	this.activeLink = '#/2'

	isActiveLink(href) {
		return this.activeLink === href;
	}

	handleClickedLink(e) {
		this.activeLink = e.item.link.href
	}

</navbar>