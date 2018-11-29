$(function(){

  var input    = $(".medium_box__text").val();
  var search   = $('.block--product_detail--right__brand__candidate');
  var register = $('.block--product_detail--right__brand');


  function appendName(brand){
    var html = `<div class="block--product_detail--right__brand__candidate__list" id="candidate${ brand.id }">
                  <a class="brand-search-add${ brand.id } block--product_detail--right__brand__candidate__list__each" data-brand-id="${ brand.id }">
                    ${ brand.name }
                  </a>
                </div>`
    search.append(html);
  }

  function appendNoName(text){
    var html = `<div class="block--product_detail--right__brand__candidate__list">
                  <a class="brand-search-add block--product_detail--right__brand__candidate__list__each">
                    ${ text }
                  </a>
                </div>`
    search.append(html);
  }

  function registerName(brand){
    var brand_name = $(`.brand-search-add${ brand.id }`).text()
    var brand_id   = $(`.brand-search-add${ brand.id }`).attr('data-brand-id')

    $('.medium_box__text').val('');
    $('.medium_box__text').val( brand_name )
    $('.medium_box__input').val( brand_id )
    $('.block--product_detail--right__brand__candidate').css('display','none');
  }


  $(".medium_box__text").on('keyup', function(brand){
    $('.medium_box--brand__input').val('')
    var input = $(".medium_box__text").val();

    $.ajax({
      type: 'GET',
      url: ('/brands/index'),
      data: { keyword: input },
      dataType: 'json',
    })

    .done(function(brands){
      $('.block--product_detail--right__brand__candidate').css('display','inherit');
      $(`.block--product_detail--right__brand__candidate__list`).remove();
      if ( brands.length !== 0 ) {
        brands.forEach(function(brand){
          appendName(brand);
          $(`#candidate${ brand.id }`).on('mouseover', function(){
            $(`.brand-search-add${ brand.id }`).css('font-weight','bold').css('color','white')
            $(`#candidate${ brand.id }`).css('background-color','#0099e8')
            $(`#candidate${ brand.id }`).on('mouseout', function(){
              $(`.brand-search-add${ brand.id }`).css('font-weight','normal').css('color','black')
              $(`#candidate${ brand.id }`).css('background-color','white')
            })
          })
          $(`#candidate${ brand.id }`).on('click', function(){
            registerName(brand)
          })
        })
      } else {
        appendNoName("一致するブランドはありません");
      }
    })
    .fail(function() {
      alert('ブランド検索に失敗しました');
    })
  })
})
