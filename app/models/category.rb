class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :item_categories
  validates :name, uniqueness: true
  validates :name, format: { without: /[\d\W]/, message: " cannot contain number or non digit" }
  has_many :items, through: :item_categories
end
