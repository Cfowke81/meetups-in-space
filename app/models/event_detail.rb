class EventDetail < ActiveRecord::Base
  validates :description, presence: true
  validates :location, presence: true
  validates :creator, presence: true
  belongs_to :events
end
