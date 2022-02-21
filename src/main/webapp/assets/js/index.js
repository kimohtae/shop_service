$(function(){

    const swiper = new Swiper('.swiper', {
        direction:'horizontal',
        autoplay:true,
        loop:true,
        navigation: {
            nextEl: '.slide-next',
            prevEl: '.slide-prev',
        }
    });
})