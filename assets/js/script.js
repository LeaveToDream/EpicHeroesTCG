
$(document).ready(function(e) {
	/* Common JS executed when document is loaded  */
	$('.with-hover-text, .regular-link').click(function(e){
		e.stopPropagation();
	});

	$('#LegacyDisplayButton').click(function(){
		$('#LegacyToggle').toggleClass('LThidden');
		$.ajax({
			url: 'events/events.php',
			data: 'event=toggleDisplay',
			type: "POST",
			error: function(e){
			 alert('Error processing your request: '+e.responseText);
		 },
			success: function(json) {
				/* alert("toggleDisplay succed");/**/
			}
		});
	});
	$('#LegacySwitch').click(function(){
		$('#LegacySwitch').toggleClass('checked');
		$('#LegacySwitchScreen').fadeIn(500);
		setTimeout(function(){$('.legMod, .liveMod').toggle();}, 600);
		setTimeout(function(){$('#LegacySwitchScreen').fadeOut(500);}, 2000);
		$.ajax({
			url: 'events/events.php',
			data: 'event=toggleLegacy',
			type: "POST",
			error: function(e){
			 alert('Error processing your request: '+e.responseText);
		 },
			success: function(json) {
				/* alert("toggleLegacy succed");/**/
			}
		});
	});


  var lis = $('.nav > li');
  menu_focus( lis[0], 1 );

  $(function() {
    var pause = 10;
    $(document).scroll(function(e) {
      delay(function() {
        var tops = [];
        $('.story').each(function(index, element) {
          tops.push( $(element).offset().top - 100 );
        });

        var scroll_top = $(this).scrollTop();

        var lis = $('.nav > li');

        for ( var i=tops.length-1; i>=0; i-- ) {
          if ( scroll_top >= tops[i] ) {
            menu_focus( lis[i], i+1 );
            break;
          }
        }
      },
      pause);
    });
    $(document).scroll();
  });
});

var delay = (function(){
	var timer = 0;
	return function(callback, ms){
		clearTimeout (timer);
		timer = setTimeout(callback, ms);
	};
})();

function menu_focus( element, i ) {
	if ( $(element).hasClass('active') ) {
		if ( i == 6 ) {
			if ( $('.navbar').hasClass('inv') == false )
				return;
		} else {
			return;
		}
	}

	enable_arrows( i );

	if ( i == 1 || i == 6 )
		$('.navbar').removeClass('inv');
	else
		$('.navbar').addClass('inv');

	$('.nav > li').removeClass('active');
	$(element).addClass('active');

	var icon = $(element).find('.icon');

	var left_pos = icon.offset().left - $('.nav').offset().left;
	var el_width = icon.width() + $(element).find('.text').width() + 10;

	$('.active-menu').stop(false, false).animate(
		{
			left: left_pos,
			width: el_width
		},
		1500,
		'easeInOutQuart'
	);
}

function enable_arrows( dataslide ) {
	$('#arrows div').addClass('disabled');
	if ( dataslide != 1 ) {
		$('#arrow-up').removeClass('disabled');
	}
	if ( dataslide != 6 ) {
		$('#arrow-down').removeClass('disabled');
	}
}

/*************
* = Parallax *
*************/
jQuery(document).ready(function ($) {
	//Cache some variables
	var links = $('.nav').find('li');
	slide = $('.story');
	button = $('.button');
	mywindow = $(window);
	htmlbody = $('html,body');

	//Create a function that will be passed a slide number and then will scroll to that slide using jquerys animate. The Jquery
	//easing plugin is also used, so we passed in the easing method of 'easeInOutQuint' which is available throught the plugin.
	function goToByScroll(dataslide) {
		var offset_top = ( dataslide == 1 ) ? '0px' : $('.story[data-slide="' + dataslide + '"]').offset().top;

		htmlbody.stop(false, false).animate({
			scrollTop: offset_top
		}, 1500, 'easeInOutQuart');
	}


	//When the user clicks on the navigation links, get the data-slide attribute value of the link and pass that variable to the goToByScroll function
	links.click(function (e) {
		e.preventDefault();
		dataslide = $(this).attr('data-slide');
		goToByScroll(dataslide);
		$(".nav-collapse").collapse('hide');
	});

	//When the user clicks on the navigation links, get the data-slide attribute value of the link and pass that variable to the goToByScroll function
	$('.navigation-slide').click(function (e) {
		e.preventDefault();
		dataslide = $(this).attr('data-slide');
		goToByScroll(dataslide);
		$(".nav-collapse").collapse('hide');
	});
});

/***************
* = Menu hover *
***************/
jQuery(document).ready(function ($) {
	//Cache some variables
	var menu_item = $('.nav').find('li');

	menu_item.hover(
		function(e) {
			var icon = $(this).find('.icon');

			var left_pos = icon.offset().left - $('.nav').offset().left;
			var el_width = icon.width() + $(this).find('.text').width() + 10;

			var hover_bar = $('<div class="active-menu special-active-menu"></div>')
				.css('left', left_pos)
				.css('width', el_width)
				.attr('id', 'special-active-menu-' + $(this).data('slide') );

			$('.active-menu').after( hover_bar );
		},
		function(e) {
			$('.special-active-menu').remove();
		}
	);
});


/******************
* = Arrows click  *
******************/
jQuery(document).ready(function ($) {
	//Cache some variables
	var arrows = $('#arrows div');

	arrows.click(function(e) {
		e.preventDefault();

		if ( $(this).hasClass('disabled') )
			return;

		var slide = null;
		var datasheet = $('.nav > li.active').data('slide');
		var offset_top = false;


		switch( $(this).attr('id') ) {
			case 'arrow-up':
				offset_top = ( datasheet - 1 == 1 ) ? '0px' : $('.story[data-slide="' + (datasheet-1) + '"]').offset().top;
				break;
			case 'arrow-down':
				offset_top = $('.story[data-slide="' + (datasheet+1) + '"]').offset().top;
				break;
		}
		if ( offset_top != false ) {
			htmlbody.stop(false, false).animate({
				scrollTop: offset_top
			}, 1500, 'easeInOutQuart');
		}
	});
});
