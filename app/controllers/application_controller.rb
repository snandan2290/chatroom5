class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user, :required_user

  def current_user
    puts "current_user:::#{session[:username]/params}"
    @current_user ||= User.find_by(session[:username]) if paramsp
  end

  def logged_in?
    !!current_user
  end

  def required_user
    unless logged_in?
      flash[:alert] = "User needs to login to continue operation!!"
      redirect_to login_path
    end
  end
end 