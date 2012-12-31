class Meeting < ActiveRecord::Base
	extend FriendlyId

	friendly_id :period, :use => :slugged
	has_many :votings, :inverse_of => :meeting, :dependent => :destroy
  	attr_accessible :period
  	accepts_nested_attributes_for :votings
end
