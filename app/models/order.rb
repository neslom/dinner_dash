class Order < ActiveRecord::Base
  belongs_to :user
  enum status: %w(ordered paid completed cancelled)
  scope :ordered, -> { where(status: 0)}
  scope :paid, -> { where(status: 1) }
  scope :completed, -> { where(status: 2) }
  scope :cancelled, -> { where(status: 3) }

  def open?
    status == "ordered" || status == "paid"
  end

  def unpaid?
    status == "ordered" && status != "paid"
  end

  def paid?
    status == "paid"
  end

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

  def self.generate_order(user, cart)
    create(user_id: user.id, cart: cart)
  end

  def self.sort_by_status(status)
    case status
    when nil
      Order.all
    when '0'
      Order.ordered
    when '1'
      Order.paid
    when '2'
      Order.completed
    when '3'
      ORder.cancelled
    end
  end

  private

  def format_quantity
    cart.each { |item, quantity| cart[item] = quantity.to_i }
  end

end
