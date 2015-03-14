class Admin::ItemCategoriesController < ApplicationController
  layout "admin"

  before_action :set_category, only: [:new, :edit, :update]

  def new
    #@email_address = EmailAddress.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
    @item_category = ItemCategory.new(category_id: params[:category_id])
    @item_options = Item.all.map { |item| [item.name, item.id] }
  end

  def edit
  end

  def create
    @item_options = Item.all.map { |item| [item.name, item.id] }

    @item_category = ItemCategory.new(category_id: params[:item_category][:category_id], item_id: params[:item_category][:item_id])
    if @item_category.save!
      flash[:notice] = "Category updated!"
      redirect_to admin_category_path(Category.find(@item_category.category_id))
    else
      flash[:notice] = "Shit"
    end
  end

  def update
  end

  def destroy
    @item = Item.find(params[:item_id])
    @category = Category.find(params[:category_id])

    @item.categories.delete(@category)
    flash[:notice] = "#{@item.name} removed from category"

    redirect_to admin_category_path(@category)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end
end
