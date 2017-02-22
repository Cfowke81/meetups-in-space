class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |attend|
      attend.integer :event_id, null: false
      attend.integer :user_id, null: false
    end
  end
end
