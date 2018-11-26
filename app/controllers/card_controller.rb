class CardController < ApplicationController

include Card

  def index
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @mycard = Payjp::Customer.retrieve(current_user.payments.first.payjp_customer_id).cards.data[0] if current_user.payments.present?
  end

  def new

  end


  private
  def payment_params
    params.permit(:payment).permit(:user_id, :customer_id)
  end

end
