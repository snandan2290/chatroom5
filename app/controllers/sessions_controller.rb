class SessionsController < ApplicationController


  def login
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    valid = false
    @user = User.find_by(username: (params[:session][:username]))
    if @user
      if @user.authenticate(params[:session][:password])
        valid = true
      end
    else
      @user = User.new
    end
    if valid
      Rails.logger.debug("#{self.class.name()}::#{__method__}::@user.id::#{@user.id}")
      session[:user_id] = @user.id
      flash[:notice] = "Logged in successfully!!"
      redirect_to root_path
    else
      flash[:alert] = "Login failed - Invalid username or password!!"
      render "login"
    end
  end

  def destroy
    session[:users_id] = nil
    flash[:notice] = "You have logged out successfully!!"
    redirect_to login_path
  end



end