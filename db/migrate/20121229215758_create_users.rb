class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :password_digest
      t.integer :year

      t.timestamps
    end
  end
end
