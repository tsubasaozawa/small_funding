$(document).on('turbolinks:load', function() {
  $(function(){
    $('#like-icon').on('mouseenter', function(){
      $('#liked-users').animate({ height: 'show'}, 'fast' );
    })
    $('#like-icon').on('mouseleave', function(){
      $('#liked-users').animate({ height: 'hide'}, 'fast' );
    })
  })
});