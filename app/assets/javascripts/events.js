$(document).on('turbolinks:load', function () {
  $('.list-group-flush').hide();
  $('.card-img-top h3').click(function () {
    let index = $('.card-img-top h3').index($(this));
    $('.list-group-flush').eq(index).slideToggle();
  });
});