$(function(){

  // $('.block--bottom__btns__confirm').on('mouseover', function(e){
  //   e.preventDefault();
  //   if($('#product_images_attributes_0_first_image').val() == "" ){
  //     $('.block--images__error--1').css('display','inherit');
  //   }
  //   if($('#product_name').val() == "" ){
  //     $('.block--product__name__error').css('display','inherit');
  //   }
  //   if($('#product_description').val() == "" ){
  //     $('.block--product__description__error').css('display','inherit');
  //   }
  //   if($('#product_product_categories_attributes_0_category_id').val() == "0" || $('#product_product_categories_attributes_1_category_id').val() == "0" ||
  //      $('#product_product_categories_attributes_2_category_id').val() == "0" ){
  //     $('.medium_box_error--category').css('display','inherit');
  //   }
  //   if($('#product_product_sizes_attributes_0_size_id').val() == "0" ){
  //     $('.medium_box_error--size').css('display','inherit');
  //   }
  //   if($('#product_state_of_goods').val() == "0" ){
  //     $('.medium_box_error--state_of_goods').css('display','inherit');
  //   }
  //   if($('#product_freight').val() == "0" ){
  //     $('.medium_box_error--freight').css('display','inherit');
  //   }
  //   if($('#product_ship_method').val() == "0" ){
  //     $('.medium_box_error--ship_method').css('display','inherit');
  //   }
  //   if($('#product_ship_from_location').val() == "0" ){
  //     $('.medium_box_error--ship_from_location').css('display','inherit');
  //   }
  //   if($('#product_ship_day').val() == "0" ){
  //     $('.medium_box_error--ship_day').css('display','inherit');
  //   }
  //   var num = $('#product_price').val();
  //   if( num == "" || num < 300 || num >= 10000000 ){
  //     $('.block--price--right__input__bottom_error').css('display','inherit');
  //   }
  //   $(".js-form").removeAttr("disabled");
  // })

  $('.block--product_detail--right__categories--first').on('change', function(){
    $('.block--product_detail--right__categories--second').css('display','inherit');
    if($('#product_product_categories_attributes_0_category_id').val() == "0" ){
      $('.block--product_detail--right__categories--second').css('display','none');
      $('.block--product_detail--right__categories--third').css('display','none');
      $('.block--product_detail--right__size').css('display','none');
      $('.block--product_detail--right__brand').css('display','none');
    }

    $('.block--product_detail--right__categories--second').on('change', function(){
      $('.block--product_detail--right__categories--third').css('display','inherit');
      if($('#product_product_categories_attributes_1_category_id').val() == "0" ){
        $('.block--product_detail--right__categories--third').css('display','none');
        $('.block--product_detail--right__size').css('display','none');
        $('.block--product_detail--right__brand').css('display','none');
      }

      $('.block--product_detail--right__categories--third').on('change', function(){
        $('.block--product_detail--right__size').css('display','inherit');
        $('.block--product_detail--right__brand').css('display','inherit');
        if($('#product_product_categories_attributes_2_category_id').val() == "0" ){
          $('.block--product_detail--right__size').css('display','none');
          $('.block--product_detail--right__brand').css('display','none');
        }
      });
    });
  });



  $('#product_freight').on('change', function(){
    $('.block--about_ship--right__method').css('display','inherit');
    if($('#product_freight').val() == "0"){
      $(".block--about_ship--right__method").css('display','none');
    }
  });
})
