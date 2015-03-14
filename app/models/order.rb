class Order < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :user
  enum status: %w(ordered paid completed cancelled)

  def line_item_total(item, quantity)
    format_currency(item.price * quantity)
  end

  def items_with_quantity
    format_quantity
    items = {}
    cart.each { |id, quantity| items[Item.find(id)] = quantity }
    items
  end

  def total
    totals = items_with_quantity.map do |item, quantity|
      item.price * quantity
    end
    format_currency(totals.reduce(:+))
  end

  def format_currency(float)
    helpers.number_to_currency(float)
  end
  private


  def format_quantity
    cart.each { |item, quantity| cart[item] = quantity.to_i }
  end
end
