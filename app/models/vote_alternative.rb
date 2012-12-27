class VoteAlternative < ActiveRecord::Base
	belongs_to :voting, :inverse_of => :vote_alternatives
  	attr_accessible :identifier, :title, :voting, :votes
end
