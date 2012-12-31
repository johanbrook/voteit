class AddSlugsToMeetings < ActiveRecord::Migration
  def change
  	add_column :meetings, :slug, :string
  	add_index :meetings, :slug
  end
end
