module Card
  extend ActiveSupport::Concern

  def create_customer
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
    Payjp::Customer.create(card: token.id).id
  end

end
