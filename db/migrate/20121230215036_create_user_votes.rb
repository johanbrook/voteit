class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :voting_id
      t.integer :user_id

      t.timestamps
    end

    add_index :user_votes, [:voting_id, :user_id], :unique => true
  end
end
