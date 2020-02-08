$(document).on('turbolinks:load', function () {
  $('.list-group-toggle').hide();
  $('.slideToggle').click(function () {
    let index = $('.slideToggle').index($(this));
    $('.list-group-toggle').eq(index).slideToggle();
  });
});