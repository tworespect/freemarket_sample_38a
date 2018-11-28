$(function() {

  var list =  $('li').text();

  if(list.includes("Name can't be blank")){
      $('.name-error').css('display','inherit');
  }
  if(list.includes("Email can't be blank")){
      $('.email-error').css('display','inherit');
  }
  if(list.includes("Password can't be blank")){
      $('.password-error').css('display','inherit');
      $('.password-error-message').css('display','inherit');
  }
  if(list.includes("Password is too short (minimum is 6 characters)")){
      $('.password-error-message').css('display','inherit');
  }
  if(list.includes("Password confirmation can't be blank")){
      $('.password_confirmation-error').css('display','inherit');
  }
  if(list.includes("Password confirmation doesn't match Password")){
      $('.no-match-error').css('display','inherit');
  }
  if(list.includes("Email has already been taken")){
      $('.already-taken').css('display','inherit');
  }
  if(list.includes("Password is invalid")){
      $('.no-number-only').css('display','inherit');
  }

  if($('div').hasClass('email-pass-error')){
    $('.email-login-error').css('display','inherit');
    $('.password-login-error').css('display','inherit');
    $('.password-login-error-message').css('display','inherit');
  }
});

