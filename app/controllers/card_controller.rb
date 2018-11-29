class CardController < ApplicationController

include Card

  def index
    @payment = Payment.find_by(user_id: current_user.id)
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
        redirect_to user_path(current_user.id)
      else
        render :new
      end
    else
      render :index
    end

  end

  def destroy
    @payment = Payment.find_by(user_id: current_user.id)
    @payment.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def payment_params
    params.permit(:payment).permit(:user_id, :customer_id)
  end

end
