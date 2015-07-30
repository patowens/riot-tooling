var riot = require('riot');
var app = require('./components/app.tag'); // bring in a riot custom tag
// --------- all components ----------
var navbar = require('./components/navbar.tag');

// mount riot tags
riot.mount('div#main', 'app', { title: 'Riot App'});