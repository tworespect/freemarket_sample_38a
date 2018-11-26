$(function(){

  function appendName(brand){
    var html = `<a class="brand-search-add${ brand.id }">
                  <div class="block--product_detail--right__brand__candidate__list">
                    <p>${ brand.name }</p>
                  </div>
                </a>`
    $('.block--product_detail--right__brand__candidate').append(html);
  }

  function appendNoName(text){
    var html = `<a class="brand-search-add11">
                  <div class="block--product_detail--right__brand__candidate__list">
                    <p>${ text }</p>
                  </div>
                </a>`
    $('.block--product_detail--right__brand__candidate').append(html);
  }

  function registerName(brand){
    var html = `<div class="medium_box--brand">
                  <% if user_signed_in? %>
                    <div>a</div>
                  <% end %>
                </div>`
    $('.block--product_detail--right__brand').append(html);
  }



  $(".medium_box__text").on('keyup', function(e){
    var input = $(".medium_box__text").val();

    $.ajax({
      type: 'GET',
      url: ('/brands/index'),
      data: { keyword: input },
      dataType: 'json',
    })

    .done(function(brands){
      $('.block--product_detail--right__brand__candidate').css('display','inherit');
      $('.block--product_detail--right__brand__candidate__list').remove();
      if ( brands.length !== 0 ) {
        brands.forEach(function(brand){
          appendName(brand);
          $(`.brand-search-add${ brand.id }`).on('mouseover', function(){
            $(`.brand-search-add${ brand.id }`).css('font-weight','600px')
          })
          $(`.brand-search-add${ brand.id }`).on('click', function(){
            $('.medium_box--brand, .block--product_detail--right__brand__candidate').remove();
            registerName(brand)
            // $('.medium_box__text').val(${ brand.name });
            // $('.medium_box__text').val().replace('${ brand.id }', '${ brand.id }')
          })
        })
      } else {
        appendNoName("その他");
      }
    })

    .fail(function() {
      alert('ブランド検索に失敗しました');
    })
  })
})
