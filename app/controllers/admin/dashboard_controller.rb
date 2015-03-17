class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :is_admin?

  def show
  end

  def index
  end

end
