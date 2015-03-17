class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.where(retired: false)
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
