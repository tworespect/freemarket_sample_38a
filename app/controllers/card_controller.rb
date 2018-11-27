class CardController < ApplicationController

include Card

  def index
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @mycard = Payjp::Customer.retrieve(current_user.payments.first.payjp_customer_id).cards.data[0] if current_user.payments.present?
  end

  def new

  end

  def create
    unless current_user.payments.present?
      customer_id = create_customer
      @payment = Payment.find_or_initialize_by(user_id: current_user.id)
      @payment.payjp_customer_id = customer_id

      if @payment.save
        render :index
      else
        render :new
      end
    else
      render :index
    end

  end

  private
  def payment_params
    params.permit(:payment).permit(:user_id, :customer_id)
  end

end
