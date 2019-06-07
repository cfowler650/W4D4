class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?


  def logged_in?
    session[:session_token] == user.session_token
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token! 
  end 

  def current_user
    @current_user ||= User.find_by(session_token: Session[:session_token])
  end


end
