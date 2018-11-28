class ProductsController < ApplicationController
include Charge
  before_action :set_product, only: [:show, :destroy, :completion]

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order("id DESC").includes(:images, :categories)
  end

  def new
    @product = Product.new
    @product.product_sizes.build
    @product.product_brands.build
    @product.product_categories.build
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
    # if @product.save
    #   redirect_to products_path
    # else
    #   redirect_to new_product_path
    # end
  end

  def show
    @pre_product = Product.order("RAND()").limit(1)
    @post_product = Product.order("RAND()").limit(1)
  end

  def edit
    @product_categories = @product.product_categories
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      redirect_to edit_product_path
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path
    else
      redirect_to product_path
    end
  end

  def buy
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @mycard = Payjp::Customer.retrieve(current_user.payments.first.payjp_customer_id).cards.data[0] if current_user.payments.present?
  end

  def pay
    @product = Product.find(params[:product_id])
    @payment = Payment.find_by(user_id: current_user.id)
    create_charge(@product.price, @payment.payjp_customer_id)
    @product.update(status: 1)
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :freight, :state_of_goods, :description, :ship_method, :ship_from_location, :ship_day, product_sizes_attributes:[:id, :size_id], product_brands_attributes:[], product_categories_attributes:[:id, :category_id], images_attributes:[:id, :first_image, :second_image, :third_image, :forth_image]).merge(product_brands_attributes:[], status: 0, user_id: current_user.id)
  end


  def set_product
    @product = Product.find(params[:id])
  end

end
