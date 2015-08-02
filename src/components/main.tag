<main>
	<navbar></navbar>
	<div class="container">
		<div class="row">
			<todos class="col-md-6" style="padding-left:30px;"></todos>

			<div class="col-md-6">
				<p>I&apos;m a famo.us surface</p>
				<div id="target"></div>
			</div>
		</div>
	</div>


	var FamousEngine = require('famous/core/FamousEngine');
	var DOMElement = require('famous/dom-renderables/DOMElement');
	var Position = require('famous/components/Position');

	var scene = FamousEngine.createScene("#target");
	var rootNode = scene.addChild();

	var element = new DOMElement(rootNode, {
		content: '<span class="circle"></span>',
		properties: {
			'text-align': 'center'
		}
	});

	var position = new Position(rootNode);

	(function springMe() {
		position.set(0, 200, 0, { duration: 1250, curve: 'spring' });
		window.setTimeout(function() {
			position.set(0, 0, 0, { duration: 1250, curve: 'spring' });
		}, 2000)
		setTimeout(springMe, 4000)
	})();
		
</main>

