class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |details|
      details.text :description, null: false
      details.text :location, null: false
      details.text :creator, null: false
    end
  end
end
