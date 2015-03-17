class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :is_admin?

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end
end
