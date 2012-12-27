class AddVotesToVoteAlternatives < ActiveRecord::Migration
  def change
    add_column :vote_alternatives, :votes, :integer, :default => 0
  end
end
