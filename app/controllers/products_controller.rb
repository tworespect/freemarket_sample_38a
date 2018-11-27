class ProductsController < ApplicationController

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
    if @product.save
      redirect_to ''
    else
      redirect_to 'products/new'
    end
  end

  def show
  end

  def edit
    @product_categories = @product.product_categories
  end

  def update
    if @product.update(product_params)
      redirect_to ''
    else
      redirect_to 'products/edit'
    end
  end

  def destroy
    product.destroy
    redirect_to ''
  end

  def buy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :freight, :state_of_goods, :description, :ship_method, :ship_from_location, :ship_day, product_sizes_attributes:[:id, :size_id], product_brands_attributes:[], product_categories_attributes:[:id, :category_id], images_attributes:[:id, :first_image, :second_image, :third_image, :forth_image]).merge(status: 0, user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
