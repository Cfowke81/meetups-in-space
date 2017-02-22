class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |event|
      event.text :name, null: false
      event.integer :event_details_id, null: false
    end
  end
end
