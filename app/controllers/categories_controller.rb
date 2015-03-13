class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @items = Category.find
  end
end
