$(function() {
	//分类
    var swiper2 = new Swiper('.swiper2', {
        pagination: '.pagination2',
        loop: true,
        grabCursor: true
    });
    $('.pagination2 .swiper-pagination-switch').click(function() {
        swiper2.swipeTo($(this).index());
    });
		//banner
    var swiper = new Swiper('.swiper1', {
        pagination: '.pagination1',
        loop: true,
        grabCursor: true
    });
    $('.pagination1 .swiper-pagination-switch').click(function() {
        swiper.swipeTo($(this).index());
    });
})
