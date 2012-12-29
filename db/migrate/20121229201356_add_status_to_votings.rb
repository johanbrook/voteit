class AddStatusToVotings < ActiveRecord::Migration
  def change
  	add_column :votings, :open, :boolean, :default => false
  end
end
