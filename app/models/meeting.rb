class Meeting < ActiveRecord::Base
	has_many :votings, :inverse_of => :meeting, :dependent => :destroy
  	attr_accessible :period
  	accepts_nested_attributes_for :votings
end
