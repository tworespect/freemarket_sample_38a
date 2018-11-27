class Product < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  has_many :images,                dependent: :destroy
  has_many :product_sizes,         dependent: :destroy
  has_many :product_brands,        dependent: :destroy
  has_many :product_categories,    dependent: :destroy
  has_many :product_page_comments, dependent: :destroy
  has_many :sizes,      through: :product_sizes
  has_many :brands,     through: :product_brands
  has_many :categories, through: :product_categories

  accepts_nested_attributes_for :images,             allow_destroy: true
  accepts_nested_attributes_for :product_sizes,      allow_destroy: true
  accepts_nested_attributes_for :product_brands,     allow_destroy: true
  accepts_nested_attributes_for :product_categories, allow_destroy: true

  validates :user_id,            presence: true
  validates :name,               presence: true, length: { maximum: 40 }
  validates :price,              presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :status,             presence: true
  validates :freight,            presence: true
  validates :state_of_goods,     presence: true
  validates :description,        presence: true, length: { maximum: 1000 }
  validates :ship_method,        presence: true
  validates :ship_from_location, presence: true
  validates :ship_day,           presence: true
end
