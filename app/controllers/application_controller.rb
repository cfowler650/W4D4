class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
end
