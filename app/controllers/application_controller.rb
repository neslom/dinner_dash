class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def load_cart
    @cart = Cart.new(session[:cart])
  end

  helper_method :load_cart
end
