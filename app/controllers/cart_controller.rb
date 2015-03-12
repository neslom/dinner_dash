class CartController < ApplicationController
  def index
    @cart_contents = @cart.content
  end

  def create
    item_id = params[:item_id]
    @cart.add_item(item_id)
    session[:cart] = @cart.content
    item = Item.find(item_id)
    flash[:notice] = "#{item.name} added to cart"
    redirect_to items_path
  end
end
