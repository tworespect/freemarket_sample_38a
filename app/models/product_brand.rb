class ProductBrand < ApplicationRecord
  belongs_to :product
  belongs_to :brand

  validates :product_id, presence: true
  validates :brand_id,   presence: true
end
