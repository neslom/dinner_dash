class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_cart

  def load_cart
    @cart = Cart.new(session[:cart])
  end

  helper_method :load_cart
end
