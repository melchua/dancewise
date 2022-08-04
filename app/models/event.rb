# frozen_string_literal: true

require "json"
require "i18n"
require "date"

class Event < ApplicationRecord
  belongs_to :user
  has_many :event_dance_styles
  has_many :dance_styles, through: :event_dance_styles
  has_many :event_artists
  has_many :artists, through: :event_artists
  has_one_attached :event_image
  belongs_to :event_type, optional: true, class_name: "EventType", foreign_key: "event_type_id"
  belongs_to :event_frequency, optional: true, class_name: "EventFrequency", foreign_key: "event_frequency_id"
  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :event_start_date, presence: true
  # validates :event_end_date, presence: true
  validates :event_frequency, presence: true
  validates :event_type, presence: true

  geocoded_by :address
  after_validation :geocode, :reverse_geocode, :save_additional_address_fields, :date_parsing

  def date_parsing
    event_date = self.event_start_date
    self.event_month = event_date.strftime("%B")
    self.event_year = event_date.strftime("%Y")
  end

  # ransacker :event_start_date do
  #   Arel.sql('date(event_start_date)')
  # end

  # ransacker :event_month do
  #   Arel.sql('date(event_month)')
  # end

  def save_additional_address_fields
    search_results = Geocoder.search(address)
    # search_results = Geocoder.search(to_coordinates)
    result = search_results.select { |x| (x.type == "city") && (x.data["class"] == "place")  }.first || search_results.first

    # JSON hash country code lookup to find continent
    file = File.read(File.join(Rails.root, "app", "assets", "json", "continents.json"))
    continent_string = JSON.parse(file)
    country_code = result.country_code.upcase
    continent = continent_string[country_code]

    self.city = result.city rescue "unknown"
    self.state = result.state rescue "unknown"
    self.country = result.country rescue "unknown"
    self.continent = continent rescue "unknown"
  end
end

# On Event Types appearing on the view, the fix I implemented was removing the space between "Event Type" and that is allowing the code to render on the event show page.

# In order to get the event frequency to show up on the Event Index page I had to change the null value change_column_null(:events, :event_frequency_id, false, default = 6) of the event frequency ID to not allow false values and give it a default value, I chose 6 since that is the value of the one-time event, I also added validation for event frequency and event type IDs to prevent the error messages from showing up #
