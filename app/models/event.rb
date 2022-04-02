class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode 
  belongs_to :user
  has_many :event_dance_styles
  has_many :dance_styles, through: :event_dance_styles
  has_many :event_artists
  has_many :artists, through: :event_artists
  belongs_to :event_type, optional: true, class_name: "EventType", foreign_key: "event_type_id"
  validates :name, presence: true, length: { minimum: 6, maximum: 100}
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :image_url, length: { minimum: 10, maximum: 200 }
  validates :event_date, presence: true
end


# On Event Types appearing on the view, the fix I implemented was removing the space between "Event Type" and that is allowing the code to render on the event show page. 