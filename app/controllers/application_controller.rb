class ApplicationController < ActionController::Base

  helper_method :logged_in?, :required_user

  def current_user
    @current_user || @current_user = User.find(session[:user_id]) if session[:user_id]
    return @current_user
  end

  def logged_in?
    return !!current_user
  end

  def required_user
    Rails.logger.debug("Coming to required_user/#{logged_in?}")
    unless logged_in?
      flash[:error] = "User needs to login to continue operation!!"
      redirect_to login_path
    end
  end
end 