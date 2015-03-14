class Admin::ItemsController < ApplicationController
  layout "admin"

  def index
    @items = Item.all
  end

  def update
    @item = Item.find(params[:id])
  end

end
