$(document).ready(function(){

	var menu = $('#main-menu');
	// Set up the position at load.
	menu.css('top',$(window).scrollTop());

	// On scroll, update position
	$(window).scroll(function(){
		menu.css('top',$(window).scrollTop());
	});

});