class Admin::ItemsController < ApplicationController
  layout "admin"
  before_action :set_item, only: [:update, :show, :edit, :destroy]
  before_action :redirect_to_login_if_not_logged_in
  before_action :is_admin?

  def index
    @items = Item.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
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
      redirect_to admin_items_path
    else
      flash[:notice] = @item.errors.full_messages.to_sentence
      redirect_to new_admin_item_path
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "Item Deleted"
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :retired, :price, :avatar, :remote_avatar_url)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
