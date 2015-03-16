class Admin::OrdersController < ApplicationController
  layout "admin"

  def index
    @orders = Order.all
    @orders = Order.ordered if params[:status] == '0'
    @orders = Order.paid if params[:status] == '1'
    @orders = Order.completed if params[:status] == '2'
    @orders = Order.cancelled if params[:status] == '3'
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Success"
      redirect_to(:back)
    else
      redirect_to(:back)
      flash[:notice] = "Not a success"
    end
  end

  private

  def order_params
    params.require(:order).permit(:status, :cart, :user_id)
  end
end
