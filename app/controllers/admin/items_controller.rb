class Admin::ItemsController < ApplicationController
  layout "admin"
  before_action :set_item, only: [:update, :show]

  def index
    @items = Item.all
  end

  def update
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item saved!"
      redirect_to new_admin_item_path
    else
      flash[:notice] = "That toast already exists"
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :retired, :price, :avatar, :remote_avatar_url)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
