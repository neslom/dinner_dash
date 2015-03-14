class Item < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  has_many :item_categories
  has_many :categories, through: :item_categories
end
