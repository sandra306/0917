$(document).ready(function(){
   
    var section = $('section');
    var li =$('li');
    
    function pageAni(target){
        $('html,body').stop().animate({scrollTop:target});
    }
    
    
    section.height($(window).height());
    $(window).resize(function(){
        section.height($(this).height());
    });
    
    /*마우스 휠을 돌렸을 때 배경이미지가 자연스럽게 변경되도록 적용하기*/
    section.mousewheel(function(event,delta){
        if(delta>0){
            //올리기
            var prev = $(this).prev().offset().top;
            pageAni(prev);
        }else if(delta<0) {
            //내리기
            var next = $(this).next().offset().top;
            pageAni(next);
        }
    });
    
    $(window).scroll(function(){
        var ht = $(this).height();
        var scrolllT = $(this).scrollTop();
        for(var i=0; i<4; i++){
            if (scrolllT >= ht*i && scrolllT < ht*(i+1)){
                li.find('a').blur();
                li.removeClass('on');
                li.eq(i).addClass('on');
            }
        }
    });
    
    /*메뉴 클릭했을 때 뒷배경 변경되기*/
    li.click(function(b){
        b.preventDefault();
        var ht = $(window).height();
        var thisHr = $(this).index();
        var thisTop = ht*thisHr;
        pageAni(thisTop);
    });
});