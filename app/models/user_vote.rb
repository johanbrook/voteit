class UserVote < ActiveRecord::Base
	belongs_to :voting
	belongs_to :user

	validates_uniqueness_of :voting_id, :scope => :user_id, :message => "You cannot vote twice"
  	attr_accessible :user_id, :voting_id, :user, :voting

end
