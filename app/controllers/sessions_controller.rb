class SessionsController < ApplicationController



  def login
    @user = User.new
  end

  def create
    @user = User.find_by(username: (params[:session][:username]))
    if @user && @user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in successfully!!"
      redirect_to root_path
    else
      flash[:alert] = "Login failed - Invalid username or password!!"
      redirect_to login_path
    end
  end



end