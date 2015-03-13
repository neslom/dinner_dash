class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    @cart.content = {}
    @cart_content = @cart.content
    redirect_to cart_path(session[:cart]={}),
    notice: "Order successfully submitted!"
  end

end
