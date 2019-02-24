// toggle password visibility
$(document).on('turbolinks:load', function() 
      {
         $("#showhide").click(function() 
         {
            if ($(this).data('val') == "1") 
            {
               $("#pwd").prop('type','text');
               $("#eye").attr("class","glyphicon glyphicon-eye-close");
               $(this).data('val','0');
            }
            else
            {
               $("#pwd").prop('type', 'password');
               $("#eye").attr("class","glyphicon glyphicon-eye-open");
               $(this).data('val','1');
            }
         });
      });
      
$(document).on('turbolinks:load', function() 
      {
         $("#showhide1").click(function() 
         {
            if ($(this).data('val') == "1") 
            {
               $("#pwd1").prop('type','text');
               $("#eye1").attr("class","glyphicon glyphicon-eye-close");
               $(this).data('val','0');
            }
            else
            {
               $("#pwd1").prop('type', 'password');
               $("#eye1").attr("class","glyphicon glyphicon-eye-open");
               $(this).data('val','1');
            }
         });
      });