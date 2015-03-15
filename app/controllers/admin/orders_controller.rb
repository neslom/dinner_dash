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

end
