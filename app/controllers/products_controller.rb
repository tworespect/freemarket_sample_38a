class ProductsController < ApplicationController

  def new
    @product  = Product.new
    # @size     = Size.new
    # @image    = Image.new
    # @brand    = Brand.new
    # @category = Category.new
    @product.product_sizes.build
    @product.product_brands.build
    @product.product_categories.build
    @product.images.build
  end

  def create
    @product  = Product.new(product_params)
    binding.pry
    @product.save
    redirect_to ''
  end

  def buy
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :price, :freight, :state_of_goods, :description, :ship_method, :ship_from_location, :ship_day, product_sizes_attributes:[:id, :size_id], product_brands_attributes:[], product_categories_attributes:[:id, :category_id], product_images_attributes:[:id, :image_id]).merge(status: 0, user_id: current_user.id)
  end

  # def size_params
  #   params.require(:size).permit(:first_image, :second_image, :third_image, :forth_image)
  # end

  # def image_params
  #   params.require(:image).permit(:first_image, :second_image, :third_image, :forth_image)
  # end
end
