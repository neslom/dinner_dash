class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :is_admin?

  def show
  end

  def index
  end

  private

  def is_admin?
    if !current_user.admin?
      flash[:notice] = "Unauthorized. Access Denied"
      redirect_to root_path
    end
  end
end
