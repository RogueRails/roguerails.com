$(function(){

  // Sticky Navbar
  var $window = $(window),
    $stickyEl = $('.main-navigation'),
    elTop = 388; // $stickyEl.offset().top;

  $window.scroll(function() {
    $stickyEl.toggleClass('sticky', $window.scrollTop() > elTop);
    if ($window.scrollTop() > elTop && document.body.offsetWidth > 1170) {
      $('.floating-logo').fadeIn(800);
    } else {
      $('.floating-logo').fadeOut(400);
    }
    if ($window.scrollTop() > 824 && document.body.offsetWidth > 1283) {
      $('.floating-cta').fadeIn(800);
    } else {
      $('.floating-cta').fadeOut(800);
    }
  });

  // Navigation Click to Scroll
  $('.main-navigation nav ul li a').on('click', function(e) {
    e.preventDefault();
    $('html, body').animate({ scrollTop: ($(this.hash).offset().top - 80) }, 600);
    $('.main-navigation nav ul li a').removeClass('selected');
    $(this).addClass('selected');
  });

  // Headline Word Rotator
  var allDescriptors = $('.the-descriptors span'),
      currId = 0,
      allWidths = $('.the-descriptors span').map(function(){
        return $(this).width();
      }).get();
  function rotateDescriptors() {
    var nextDescriptor = $(allDescriptors[currId]).html(),
        nextWidth = allWidths[currId];
    $('#greeting h2 strong').fadeOut(300, function(){
      $('#greeting h2 span').animate({width: nextWidth}, 400);
      $(this).delay(500).html(nextDescriptor).fadeIn(300);
    });
    if (currId == (allDescriptors.length - 1)) {
      currId = 0;
    } else {
      currId++;
    }
  }
  setInterval(rotateDescriptors, 4000);

  $.fn.et_animation_delay = function( options ) {
    var settings = $.extend( {
        elements : 'li',
        speed    : 0.3
      }, options );

    return this.each( function() {
      var $this = $(this),
        delay = 0;

      $this.find( settings.elements ).each( function() {
        // Animates elements one at a time
        $(this).css( {
          '-webkit-transition-delay' : delay + 's',
          '-moz-transition-delay'    : delay + 's',
          '-ms-transition-delay'     : delay + 's',
          '-o-transition-delay'      : delay + 's',
          'transition-delay'         : delay + 's'
        } );

        delay += settings.speed;
      } );
    } );
  }

});