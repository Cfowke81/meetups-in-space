class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |attend|
      attend.boolean :creator, null: false, default: false
      attend.integer :event_id, null: false
      attend.integer :user_id, null: false
    end
  end
end
