class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :redirect_to_login_if_not_logged_in
  before_action :is_admin?
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created!"
      redirect_to admin_categories_path
    else
      flash[:notice] = @category.errors.full_messages.to_sentence
      redirect_to new_admin_category_path
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
