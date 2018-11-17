class ProductDetail < ApplicationRecord
  belongs_to :product

  validates :product_id,     presence: true
  validates :freight,        presence: true
  validates :state_of_goods, presence: true
  validates :description,    presence: true
end
