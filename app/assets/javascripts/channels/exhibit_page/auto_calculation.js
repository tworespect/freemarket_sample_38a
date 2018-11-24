$(function(){
  function getOthers(num){
    if ( num >= 300 && num < 10000000){
      num_01 = Number(num * 0.1)
      num_01_floor = Math.floor( num_01 )

      num_09 = Number( num - num_01_floor )
      num_09_floor = Math.floor( num_09 )

      $('.block--price--right__commissions--right').empty();
      $('.block--price--right__commissions--right').prepend("¥").append(num_01_floor.toLocaleString());
      $('.block--price--right__proceeds--right').empty();
      $('.block--price--right__proceeds--right').prepend("¥").append(num_09_floor.toLocaleString());
    }

    if ( num < 300 || num >= 10000000){
      $('.block--price--right__commissions--right').empty();
      $('.block--price--right__commissions--right').append("-");
      $('.block--price--right__proceeds--right').empty();
      $('.block--price--right__proceeds--right').append("-");
    }
  }

  $('#product_price').on('keyup', function(){
    var num = $('#product_price').val();
    getOthers(num)
  })

  $('#product_price').on('blur', function(){
    var num = $('#product_price').val();
    num = num.replace( /[０-９]/g, function(s) {
      return String.fromCharCode(s.charCodeAt(0) - 65248);
    });
    $('#product_price').val(num);
    getOthers(num)
  }).change();
})
