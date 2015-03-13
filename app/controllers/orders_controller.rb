class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    # binding.pry
    order_cart = @cart.content
    current_user.orders.create(cart: order_cart)
    redirect_to cart_path(session[:cart]={}),
    notice: "Order successfully submitted!"
  end

end
