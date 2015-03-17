class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :redirect_to_login_if_not_logged_in
  before_action :is_admin?
  before_action :set_order, only: [:show, :update]

  def index
    @orders = Order.all
    @orders = Order.ordered if params[:status] == '0'
    @orders = Order.paid if params[:status] == '1'
    @orders = Order.completed if params[:status] == '2'
    @orders = Order.cancelled if params[:status] == '3'
  end

  def show
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Success"
      redirect_to(:back)
    else
      redirect_to(:back)
      flash[:notice] = "Not a success"
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :cart, :user_id)
  end
end
