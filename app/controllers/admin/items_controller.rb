class Admin::ItemsController < ApplicationController
  layout "admin"

  def index
    @items = Item.all
  end
end
