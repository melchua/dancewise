class EventFrequency < ApplicationRecord
  has_many :events, class_name: "Event", foreign_key: "event_frequency_id"
  accepts_nested_attributes_for :events
end
