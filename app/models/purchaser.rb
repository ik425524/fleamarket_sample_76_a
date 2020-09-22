class Purchaser < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :product_id,:user_id, presence: true
end
