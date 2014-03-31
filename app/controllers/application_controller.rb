class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :check_session

  def current_user

  	@current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def check_session
	  unless current_user.present?
	  	redirect_to "/login" , alert: "login to continue..."
	  end
  end
end
