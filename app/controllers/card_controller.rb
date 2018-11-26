class CardController < ApplicationController

  def index
    @mycard = Payjp::Customer.retrieve(current_user.payments.first.payjp_customer_id).cards.data[0] if current_user.payments.present?
  end

  def new

  end

  def create
    unless current_user.payments.present?
      Payjp.api_key = PAYJP_SECRET_KEY

      year = "20" + params[:exp_year]
      token = Payjp::Token.create({
        card: {
          number: params[:number],
          cvc: params[:cvc],
          exp_month: params[:exp_month],
          exp_year: year,
          name: params[:name]
        }},
        {
          'X-Payjp-Direct-Token-Generate': 'true'
        }
      )
      customer_id = Payjp::Customer.create(card: token.id).id
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
