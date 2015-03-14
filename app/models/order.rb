class Order < ActiveRecord::Base
  # include ApplicationHelper

  belongs_to :user
  enum status: %w(ordered paid completed cancelled)

  def line_item_total(item, quantity)
    item.price * quantity
  end

  def items_with_quantity
    format_quantity
    items = {}
    cart.each { |id, quantity| items[Item.find(id)] = quantity }
    items
  end

  def total
    totals = items_with_quantity.map do |item, quantity|
      line_item_total(item, quantity)
    end
    totals.reduce(:+)
  end

  private

  def format_quantity
    cart.each { |item, quantity| cart[item] = quantity.to_i }
  end
end
