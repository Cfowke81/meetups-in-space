class MoveCreatorColumn < ActiveRecord::Migration
  def up
    remove_column :attendees, :creator
    add_column :events, :creator, :text, null: false
  end

  def down
    add_column :attendees, :creator, :boolean, default: true
    remove_column :events, :creator
  end
end
