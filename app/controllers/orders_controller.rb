class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    # @line_item_total = Cart.line_item_total#item price * quantity
  end

  def create
    order_cart = @cart.content
    current_user.orders.create(cart: order_cart)
    session[:cart]={}
    redirect_to cart_path,
    notice: "Order successfully submitted!"
  end

end
