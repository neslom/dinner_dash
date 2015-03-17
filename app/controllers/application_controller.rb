class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_cart

  def load_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    if !current_user.admin?
      flash[:notice] = "Unauthorized. Access Denied"
      redirect_to root_path
    end
  end

  helper_method :load_cart, :current_user, :is_admin?
end
