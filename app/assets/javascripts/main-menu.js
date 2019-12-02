$(document).on('turbolinks:load', function() {
  $(function(){
    $("#main-menu-icon").on("click",function(){
      $('.menu-box').fadeIn('fast');
    });
  });
  
  $(function(){
    $("#close-btn").on("click",function(){
      $(".menu-box").fadeOut('fast');
    });
  });
  $(function(){
    $(".menu-box").on("mouseleave",function(){
      $(".menu-box").fadeOut('fast');
    });
  });
});