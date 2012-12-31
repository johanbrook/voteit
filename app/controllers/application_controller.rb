class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :is_loggedin?, :is_admin?

  private 

  	def is_loggedin?
  		not current_user.nil?
  	end

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

  	def is_admin?
  	  is_loggedin? and current_user.is_admin
  	end

	  def authorize
  		session[:redirect] = root_path
  		redirect_to login_path, :alert => "Not authorized" unless is_loggedin?
  	end

  	def authorize_admin
  		session[:redirect] = root_path
  		redirect_to login_path, :alert => "Not admin" unless is_admin?
  	end
end
