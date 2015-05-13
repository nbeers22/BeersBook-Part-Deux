// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	hideWelcomeButtons();
	rotateCarets();
});

$(document).on('page:change', function () {
	rotateCarets();
});

var hideWelcomeButtons = function(){
	$('#register, #login').on('click', function(e){
		e.preventDefault();
		$('#welcome-buttons').fadeOut('slow')
	});
};

var rotateCarets = function(){
	var element = $('span.caret').parent();
	var rotated = false;
	element.on('click', function(){
		if (rotated == false) {
			$(this).find($('span.caret')).addClass('rotate');
			rotated = true;
		}else{
			$(this).find($('span.caret')).removeClass('rotate');
			rotated = false;
		}
		
	});
};

