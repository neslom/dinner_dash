class Order < ActiveRecord::Base
  belongs_to :user
  enum status: %w(ordered paid completed cancelled)
  before_create :format_time

  def format_time
    self.updated_at.to_formatted_s(:long)
  end

  # def items
  #   ids = cart.keys
  #   ids.map { |id| Item.find(id) }
  # end

  def line_item_total(id, quantity)
    total = Item.find(id).price * quantity.to_i
    ActionController::Base.helpers.number_to_currency(total)
  end



end
