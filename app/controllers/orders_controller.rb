class OrdersController < ApplicationController
  def index
    if current_user.nil?
      flash[:notice] = "You must log in to view this page"
      redirect_to login_path
    else
      @orders = current_user.orders
    end
  end

  def create
    order_cart = @cart.content
    current_user.orders.create(cart: order_cart)
    session[:cart]={}
    redirect_to cart_path,
      notice: "Order successfully submitted!"
  end

end
