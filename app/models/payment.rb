class Payment < ApplicationRecord

  belongs_to :user

  validates :payjp_customer_id, uniqueness: true, presence: true
end
