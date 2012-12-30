class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :is_loggedin?

  private 

  	def is_loggedin?
  		not current_user.nil?
  	end

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

	def authorize
  		session[:redirect] = root_url
  		redirect_to login_path, :alert => "Not authorized" if current_user.nil?
  	end
end
