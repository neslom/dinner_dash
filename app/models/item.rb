class Item < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0},
  with: /\A\d+(.\d{2})\z/, on: create
  has_many :item_categories
  has_many :categories, through: :item_categories
end
