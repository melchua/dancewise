# frozen_string_literal: true

class EventType < ApplicationRecord
  has_many :events, class_name: "Event", foreign_key: "event_type_id"
  accepts_nested_attributes_for :events
end
