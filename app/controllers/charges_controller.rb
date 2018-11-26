class ChargesController < ApplicationController

  def index
  end

  def pay
    Payjp.api_key = 'PAYJP_PRIVATE_KEY'
    charge = Payjp::Charge.create(
    :amount => 3500,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end



end


