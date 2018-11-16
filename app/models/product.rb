class Product < ApplicationRecord
  belongs_to :product_detail
  belongs_to :order
  belongs_to :user
  belongs_to :delivery
  belongs_to :image
  belongs_to :product_size
  belongs_to :product_brand
  belongs_to :product_category
  has_many :transaction_comments
  has_many :product_page_comments
  has_many :likes

  validates :user_id, presence: true
  validates :name,    presence: true
  validates :price,   presence: true
  validates :status,  presence: true
end
