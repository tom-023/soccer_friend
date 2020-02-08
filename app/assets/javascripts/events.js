$(document).on('turbolinks:load', function () {
  $('.list-group-toggle').hide();
  $('.card-img h3').click(function () {
    let index = $('.card-img h3').index($(this));
    $('.list-group-toggle').eq(index).slideToggle();
  });
});