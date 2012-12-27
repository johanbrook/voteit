class Voting < ActiveRecord::Base
	belongs_to :meeting, :inverse_of => :votings
  	attr_accessible :description, :title, :meeting

  	validates :title, :presence => true
end
