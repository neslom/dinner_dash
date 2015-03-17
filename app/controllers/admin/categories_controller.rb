class Admin::CategoriesController < ApplicationController
  layout "admin"

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created!"
      redirect_to new_admin_category_path
    else
      flash[:notice] = "That Category Already Exists"
      redirect_to new_admin_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
