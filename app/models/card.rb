class Card < ApplicationRecord
  validates :user_id, :customer_id, :card_id, presence: true
end
