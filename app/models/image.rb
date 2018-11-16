class Image < ApplicationRecord
  belongs_to :product

  validates :product_id,  presence: true
  validates :first_image, presence: true
end
