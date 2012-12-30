class User < ActiveRecord::Base
  attr_accessible :nick, :password_digest, :year
end
