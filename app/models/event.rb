class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :event_details_id, presence: true
  has_many :event_details
  has_many :users, through: :attendees 
end
