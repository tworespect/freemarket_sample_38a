$(function(){
  $(".App").on("mouseover", function(){
    $(this).css('opacity','0.5');
    $(this).on("mouseout", function(){
      $(this).css('opacity','1');
    });
  });
  $(".google").on("mouseover", function(){
    $(this).css('opacity','0.5');
    $(this).on("mouseout", function(){
      $(this).css('opacity','1');
    });
  });
  $(".footer_mark__top_page_link").on("mouseover", function(){
    $(this).css('opacity','0.5');
    $(this).on("mouseout", function(){
      $(this).css('opacity','1');
    });
  });
  $(".footer_border").on("mouseover", function(){
    $(this).css('border-bottom','1px solid white');
    $(this).css('opacity','0.5');
    $(this).on("mouseout", function(){
      $(this).css('border-bottom','none');
      $(this).css('opacity','1');
    });
  });

  $(".header_bottom__category_search").on("mouseover", function(){
    $(this).css('color','#0099e8');
    $(".header_category").css('color','#212121');
    $(".header_bottom__category_search").on("mouseout", function(){
      $(this).css('color','#212121');
    });
  });
  $(".header_bottom__brand_search").on("mouseover", function(){
    $(this).css('color','#0099e8');
    $(this).on("mouseout", function(){
      $(this).css('color','#212121');
    });
  });
  $(".header_bottom__right__my_page_link--right").on("mouseover", function(){
    $(this).css('color','#0099e8');
    $(this).on("mouseout", function(){
      $(this).css('color','#212121');
    });
  });
  $(".header_bottom__right__notices").on("mouseover", function(){
    $(this).css('color','#0099e8');
    $(this).on("mouseout", function(){
      $(this).css('color','#212121');
    });
  });
  $(".header_bottom__right__todo_lists").on("mouseover", function(){
    $(this).css('color','#0099e8');
    $(this).on("mouseout", function(){
      $(this).css('color','#212121');
    });
  });
  $(".header_bottom__right__users_new_btn").on("mouseover", function(){
    $(this).css('color','white');
    $(this).css('background-color','#0099e8');
    $(this).on("mouseout", function(){
      $(this).css('color','#0099e8');
      $(this).css('background-color','white');
    });
  });
});
