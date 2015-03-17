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
      flash.now[:notice] = "Category Created!"
      redirect_to admin_categories_path      
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
