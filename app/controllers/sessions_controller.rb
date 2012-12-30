class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by_nick(params[:nick])

		if user and user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Hi, #{user.nick}!"
		else
			flash.now.alert = "Invalid nick or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "You have been signed out"
	end
end
