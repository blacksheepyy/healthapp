$(document).on('turbolinks:load', function() {
    


 $('img').hover(function(){
   $('.hover').removeClass('hover'); // removes the previous selected class
   $(this).addClass('hover'); // adds the class to the clicked image
});
$('img').mouseleave(function(){
   $('.hover').removeClass('hover'); // removes the previous selected class
   
});
  $('img').click(function(){
   $('.selected').removeClass('selected'); // removes the previous selected class
   $(this).addClass('selected')
   .animate({
            opacity: '1.0',
            height: '110px',
            width: '110px'
        })
        .animate({
            opacity: '1.0',
            height: '100px',
            width: '100px'
        });
        
});
})

