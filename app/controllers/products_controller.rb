class ProductsController < ApplicationController

  def index
    @products = Product.order("id DESC").includes(:images, :categories)
  end

  def new
    @product  = Product.new
    @product.product_sizes.build
    @product.product_brands.build
    @product.product_categories.build
    @product.images.build
  end

  def create
    @product  = Product.new(product_params)
    # if @product.save
    #   respond_to do |format|
    #     format.js
    #   end
    # else
    #   render :new
    # end
    @product.save
    render :new
  end

  def buy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :freight, :state_of_goods, :description, :ship_method, :ship_from_location, :ship_day, product_sizes_attributes:[:id, :size_id], product_brands_attributes:[], product_categories_attributes:[:id, :category_id], images_attributes:[:id, :first_image, :second_image, :third_image, :forth_image]).merge(status: 0, user_id: current_user.id)
  end

end
