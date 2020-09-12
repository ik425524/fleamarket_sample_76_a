class Product < ApplicationRecord
  enum situation: { published: 0, sold_out: 1}

  has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, presence: true, length: {maximum: 40}
  validates :description,:price,:category,:region,:state,:period,:cost,:size, presence: true 
  validates :images, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  belongs_to_active_hash :state
  belongs_to_active_hash :period
  belongs_to_active_hash :cost
  belongs_to_active_hash :size
end