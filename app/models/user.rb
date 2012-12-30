class User < ActiveRecord::Base
	has_secure_password
  	attr_accessible :nick, :year, :password, :password_confirmation

  	validates :password, :presence => true, :on => :create
  	validates :nick, :uniqueness => true
end
