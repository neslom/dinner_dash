class Order < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :user
  enum status: %w(ordered paid completed cancelled)
  before_create :format_time

  def format_time
    self.updated_at.to_formatted_s(:long)
  end

  def format_currency(total)
    helpers.number_to_currency(total)
  end

  def line_item_total(id, quantity)
    total = Item.find(id).price * quantity.to_i
    format_currency(total)
  end

  def items
    self.cart.keys.map { |id| Item.find(id)}
  end

  def total
    line_totals = items.map { |item| item.price }
    total = line_totals.reduce(:+)
    format_currency(total)
  end

end
