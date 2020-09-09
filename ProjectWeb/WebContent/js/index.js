$('.open').click(function () {
 $(this).toggleClass('clicked active');
 $(this).find('span').toggleClass('actived');
});