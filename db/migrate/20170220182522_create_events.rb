class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |event|
      event.text :name, null: false
      event.text :description, null: false
      event.text :location, null: false
    end
  end
end
