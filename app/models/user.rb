class User < ActiveRecord::Base
	has_secure_password
  	attr_accessible :nick, :year, :password, :password_confirmation, :is_admin

  	#has_many :user_votes
  	has_many :votings, :through => :user_votes

  	validates :password, :presence => true, :on => :create
  	validates :nick, :uniqueness => true
end
