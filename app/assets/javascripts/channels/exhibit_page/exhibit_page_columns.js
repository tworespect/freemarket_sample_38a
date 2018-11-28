$(function(){

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
