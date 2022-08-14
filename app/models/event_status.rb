# frozen_string_literal: true

class EventStatus < ApplicationRecord
  has_many :events, class_name: "Event", foreign_key: "event_status_id"
  accepts_nested_attributes_for :events
end
