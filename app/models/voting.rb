class Voting < ActiveRecord::Base
	belongs_to :meeting, :inverse_of => :votings
	has_many :vote_alternatives, :inverse_of => :voting, :dependent => :destroy

  	attr_accessible :description, :title, :meeting
  	accepts_nested_attributes_for :vote_alternatives

  	validates :title, :presence => true
end
