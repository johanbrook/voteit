class CreateVoteAlternatives < ActiveRecord::Migration
  def change
    create_table :vote_alternatives do |t|
      t.string :title
      t.string :identifier
      t.integer :voting_id

      t.timestamps
    end
  end
end
