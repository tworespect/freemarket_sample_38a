class ChargesController < ApplicationController

  def index
  end

  def pay
    Payjp.api_key = 'sk_test_3871c6e667911cdbe934fffb'
    charge = Payjp::Charge.create(
    :amount => 3500,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end



end


