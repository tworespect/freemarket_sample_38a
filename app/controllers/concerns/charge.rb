module Charge
  extend ActiveSupport::Concern

  def create_charge(price, customer_id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
    :amount => price,
    :customer => customer_id,
    :currency => 'jpy',
  )
  end

end
