function showPasswordForm(){
    
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        //$('.modal-title').html('Change Password');
       
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}
function showProfileForm(){
    
    $('#myprofile .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast'); 
            
        });
        
        //$('.modal-title').html('My Profile');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openProfileModal(){
    showProfileForm();
    setTimeout(function(){
        $('#myprofile').modal('show');    
    }, 230);
    
}
function openPasswordModal(){
    showPasswordForm();
    setTimeout(function(){
        $('#myprofile').modal('show');
        
    }, 230);
    
}


   