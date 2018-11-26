module Card
  extend ActiveSupport::Concern

  private

  def create
    unless current_user.payments.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

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



end
