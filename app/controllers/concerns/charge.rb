module Charge
  extend ActiveSupport::Concern

  private

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
    :amount => 3000,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end



end
