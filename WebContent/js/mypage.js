$(function(){
    $('.img a img:eq(0)').mouseover(function(){
            $(this).attr('src','./img/modify_text.png');
        });
    $('.img a img:eq(0)').mouseout(function(){
            $(this).attr('src','./img/modify.png');
        });
});
$(function(){
    $('.img a img:eq(1)').mouseover(function(){
            $(this).attr('src','./img/letter_text.png');
        });
    $('.img a img:eq(1)').mouseout(function(){
            $(this).attr('src','./img/letter.png');
        });
});
$(function(){
    $('.img a img:eq(2)').mouseover(function(){
            $(this).attr('src','./img/order_text.png');
        });
    $('.img a img:eq(2)').mouseout(function(){
            $(this).attr('src','./img/order.png');
        });
});
$(function(){
    $('.img a img:eq(3)').mouseover(function(){
            $(this).attr('src','./img/cart_icon_text.png');
        });
    $('.img a img:eq(3)').mouseout(function(){
            $(this).attr('src','./img/cart_icon.png');
        });
});
$(function(){
    $('.img a img:eq(4)').mouseover(function(){
            $(this).attr('src','./img/address_text.png');
        });
    $('.img a img:eq(4)').mouseout(function(){
            $(this).attr('src','./img/address.png');
        });
});
$(function(){
    $('.img a img:eq(5)').mouseover(function(){
            $(this).attr('src','./img/withdrawal_text.png');
        });
    $('.img a img:eq(5)').mouseout(function(){
            $(this).attr('src','./img/withdrawal.png');
        });
});
$(function(){
    var duration = 300;
    
    //aside-----------
    var $aside = $('.page-main > aside');
    var $asideButton = $aside.find('button')
     .on('click', function(){
         $aside.toggleClass('open');
         if($aside.hasClass('open')) {
             $aside.stop(true).animate({
                 left: '-70px'
             }, duration, 'easeOutBack');
             $asideButton.find('img')
             .attr('src', 'img/btn_close.png');
         } else {
             $aside.stop(true).animate({
                 left: '-350px'
             }, duration, 'easeInBack');
             $asideButton.find('img')
             .attr('src', 'img/btn_open.png');
         };
     });
});