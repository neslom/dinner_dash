class CartController < ApplicationController
  def index
    @cart_contents = @cart.content
  end

  def create
    item_id = params[:item_id]
    @cart.add_item(item_id)
    session[:cart] = @cart.content

    redirect_to items_path
  end
end
