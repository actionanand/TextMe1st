// toggle password visibility
$( document ).ready(function() {

  $(".reveal").on('click',function() {
    
    var $pwd = $(".pwd");
    
    $(this).find('i').toggleClass('glyphicon-eye-open').toggleClass('glyphicon-eye-close');
    if ($pwd.attr('type') === 'password')
      {
      $pwd.attr('type', 'text');
      } 
    else {
      $pwd.attr('type', 'password');
    }
    
  })

});