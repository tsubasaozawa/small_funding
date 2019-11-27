$(document).on('turbolinks:load', function() {
  $(function(){
    $('#liked-users').on('mouseenter', function(){
      $('.like-users-list').animate({ height: 'show'}, 'fast' );
    })
    $('#liked-users').on('mouseleave', function(){
      $('.like-users-list').animate({ height: 'hide'}, 'fast' );
    })
  })
});