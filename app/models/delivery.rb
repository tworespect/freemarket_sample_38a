class Delivery < ApplicationRecord
  belongs_to :product

  validates :product_id,         presence: true
  validates :ship_method,        presence: true
  validates :ship_from_location, presence: true
  validates :ship_day,           presence: true
end
