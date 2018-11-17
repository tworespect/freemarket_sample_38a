class Brand < ApplicationRecord
  has_many :product_brands

  validates :name, presence: true
end
