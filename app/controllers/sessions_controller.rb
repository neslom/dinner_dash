class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash[:notice] = "Successfully logged in as #{@user.username}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Login failed"
      render :new
    end

  end
end
