class Brand < ApplicationRecord
  has_many :product_brands, dependent: :destroy
  has_many :products, through: :product_brands
end
