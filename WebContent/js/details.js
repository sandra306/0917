
$(function(){ 
    $('#item_info_write a:eq(0)').click(function(){ 
        $('html, body').animate({scrollTop: 1300}, 500); 
    });
})
$(function(){ 
    $('#item_info_write a:eq(1)').click(function(){ 
        $('html, body').animate({scrollTop: 3400}, 500); 
    });
})
$(function(){ 
    $('#item_info_write a:eq(2)').click(function(){ 
        $('html, body').animate({scrollTop: 3700}, 500); 
    });
})
$(function(){ 
    $('#item_info_write a:eq(3)').click(function(){ 
        $('html, body').animate({scrollTop: 4300}, 500); 
    });
})
$(function () {
    $('#item_info_write').each(function () {

        var $window = $(window),
            $header = $(this),
            headerOffsetTop = $header.offset().top;

        $window.on('scroll', function () {
            if ($window.scrollTop() > headerOffsetTop) {
                $header.addClass('sticky');
            } else {
                $header.removeClass('sticky');
            }
        });
        $window.trigger('scroll');
    });
});
