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
  $('form').on('submit', function() {
    if($("#user_email").val() == "") {
      $('.email-login-error').css('display','inherit');
    }else{
      $('.email-login-error').css('display','none');
    }
  });
  // $('.btn').hover(function(){
  //   $(this).prop( "disabled", false );
  //   });
  // $('.field-input__sign').hover(function(){
  //   $('.btn').removeAttr( "disabled");
  //   });


    // console.log(login_pass);

  // $('form').on('submit', function(e) {
  //   e.preventDefault();
  //   if (login_pass == "" )  {
  //     $('.password-login-error').css('display','inherit');
  //     $('.password-login-error-message').css('display','inherit');
  //   }else{
  //     $('.password-login-error').css('display','none');
  //     $('.password-login-error-message').css('display','none');
  //   }
  // });

  // $('form').on('submit', function(e) {
  //   e.preventDefault();
  //   if (login_pass == "" )  {
  //     $('.password-login-error').css('display','inherit');
  //     $('.password-login-error-message').css('display','inherit');
  //   }else{
  //     $('.password-login-error').css('display','none');
  //     $('.password-login-error-message').css('display','none');
  //   }
  // });
  // // $('form').on('submit', function(e) {
  // //   e.preventDefault();
  // //   if (login_pass.length() < 6 ) {
  // //     $('.password-login-error-message').css('display','inherit');
  // //   }else{
  // //     $('.password-login-error-message').css('display','none');
  // //   }
  // // });
  // $('.btn').hover(function(){
  //   $(this).prop( "disabled", false );
  //   });
  // $('.field-input__sign').hover(function(){
  //   $('.btn').removeAttr( "disabled");
  //   });
  // $('.field-input').hover(function(){
  //   $('.btn').removeAttr( "disabled");
  //   });
});

