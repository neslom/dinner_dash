class Admin::CategoriesController < ApplicationController
  layout "admin"

  def index
    @categories = Category.all
  end
end
