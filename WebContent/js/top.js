$( window ).scroll( function() {
  if ( $( this ).scrollTop() > 200 ) {
    $( '.top-button img' ).fadeIn();
  } else {
    $( '.top-button img' ).fadeOut();
  }
} );
$( '.top-button img' ).click( function() {
  $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
  return false;
} );
$(function(){ 
    $('.top-button img').click(function(){ 
        $('html, body').animate({scrollTop: 0}, 500); 
    });
})