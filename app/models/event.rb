# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :event_dance_styles
  has_many :dance_styles, through: :event_dance_styles
  has_many :event_artists
  has_many :artists, through: :event_artists
  belongs_to :event_type, optional: true, class_name: "EventType", foreign_key: "event_type_id"
  belongs_to :event_frequency, optional: true, class_name: "EventFrequency", foreign_key: "event_frequency_id"
  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :image_url, length: { minimum: 10, maximum: 200 }
  validates :event_date, presence: true
  validates :event_frequency, presence: true
  validates :event_type, presence: true

  geocoded_by :address
  after_validation :geocode, :reverse_geocode
  # if geo = results.first
  #   obj.city    = geo.city
  #   obj.zipcode = geo.postal_code
  #   obj.country = geo.country_code
  # end

#   def address
#     [street, city, state, country].compact.join(', ')
#   end
end

# On Event Types appearing on the view, the fix I implemented was removing the space between "Event Type" and that is allowing the code to render on the event show page.

# In order to get the event frequency to show up on the Event Index page I had to change the null value change_column_null(:events, :event_frequency_id, false, default = 6) of the event frequency ID to not allow false values and give it a default value, I chose 6 since that is the value of the one-time event, I also added validation for event frequency and event type IDs to prevent the error messages from showing up #
