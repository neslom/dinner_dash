class Admin::ItemsController < ApplicationController
  layout "admin"
  before_action :set_item, only: [:update, :show, :edit]

  def index
    @items = Item.all
  end

  def edit
  end

  def update
    if @item.update(retired: params[:retired])
      redirect_to admin_items_path
      flash[:notice] = "Successfully Updated"
    else
      flash[:notice] = @item.errors.empty? ? "Item did not update" : @item.errors.full_messages.to_sentence
      render :edit
    end
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
