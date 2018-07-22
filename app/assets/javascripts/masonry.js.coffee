$ ->
  $('#masonry-container').masonry
    itemSelector: '.mas-box',
    gutterWidth: 5, 
    isAnimated: true,
    animationOptions: {
      duration: 500,
      easing: 'swing'
    }
$ ->
  $('.mas-box').hide();
  $('.mas-box').each((i) ->
    $(this).delay(i * 100).fadeIn(1000))