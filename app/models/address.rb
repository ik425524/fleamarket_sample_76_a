class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  
  validates :post_code, :prefecture_id, :city, :address, presence: true
  validates :post_code, format: {with: /\A[0-9-]{,8}\z/}
end
