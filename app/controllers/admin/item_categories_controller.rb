class Admin::ItemCategoriesController < ApplicationController

  def destroy
    @item = Item.find(params[:item_id])
    @category = Category.find(params[:category_id])

    @item.categories.delete(@category)
    flash[:notice] = "#{@item.name} removed from category"

    redirect_to admin_category_path(@category)
  end
end
