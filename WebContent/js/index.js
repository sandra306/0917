$(document).ready(function(){
    
    var a = $('a');

    $(".slideshow").each(function(){
			var $slides = $(this).find("img");
			var slideCount = $slides.length;		//현재 이미지 개수
			//alert(slideCount);
			
			var currentIndex = 0;
			$slides.eq(currentIndex).fadeIn();		//현재 이미지
			
			function showNext(){
				var nextIndex = (currentIndex + 1) % slideCount;	//다음 이미지
				$slides.eq(currentIndex).fadeOut();	//현재 이미지를 안보이게 함
				$slides.eq(nextIndex).fadeIn();		//다음 이미지를 보이게 함
				currentIndex = nextIndex;
				console.log(currentIndex);
				console.log(nextIndex);
			}
			setInterval(showNext, 4000);			//2초에 한번씩 실행
		});
       
    

});