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
//= require jquery-ui
//= require best_in_place
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on('ready page:load', function(){

  /* Enable delete funcution for bookmarks */
  $(document).on('ajax:success', '.delete', function() {
    $(this).closest('.article_bookmarks').fadeOut();
  });

  /* Sort bookmarks */
  $(".board").sortable({
    update: function() {
      $.post($(this).data('update-url'),
      $(this).sortable('serialize'));
    }
  });


  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();

  /* Nav bar */
  $('.js-menu-trigger').on('click touchstart', function(e){
    $('.js-menu').toggleClass('is-visible');
    $('.js-menu-screen').toggleClass('is-visible');
    e.preventDefault();
  });

  $('.js-menu-screen').on('click touchstart', function(e){
    $('.js-menu').toggleClass('is-visible');
    $('.js-menu-screen').toggleClass('is-visible');
    e.preventDefault();
  });
});
