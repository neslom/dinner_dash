class OrdersController < ApplicationController
  before_action :logged_out?, only: [:index]

  def index
    @orders = current_user.orders
  end

  def create
    order_cart = @cart.content
    current_user.orders.create(cart: order_cart)
    session[:cart]={}
    redirect_to cart_path,
      notice: "Order successfully submitted!"
  end


  private

  def logged_out?
    if current_user.nil?
      flash[:notice] = "You must be logged in to view this page"
      redirect_to login_path
    end
  end
end
