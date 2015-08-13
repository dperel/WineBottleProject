function hideStuff(){
  $('.gallery-description').parent().mouseenter(function(){
    $(this).children().not('.' + 'gallery').css('visibility','visible');
 })
  $('.gallery-description').parent().mouseleave(function(){
    $(this).children().not('.' + 'gallery').css('visibility','hidden');
  })
};


$(document).ready(function(){
  hideStuff();
})


 


