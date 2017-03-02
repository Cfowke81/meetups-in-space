class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :creator, presence: true

  has_many :users, through: :attendees
  has_many :attendees
end
