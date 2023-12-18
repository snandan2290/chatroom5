class SessionsController < ApplicationController

  before_action :logged_in_required, only: [:new, :create, :login]


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
    session[:user_id] = nil
    flash[:notice] = "You have logged out successfully!!"
    redirect_to login_path
  end

  private
  def logged_in_required
    if logged_in?
      flash[:notice] = 'You are already logged in!!'
      redirect_to root_path
    end
  end
  


end