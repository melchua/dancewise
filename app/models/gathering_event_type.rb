# frozen_string_literal: true

class GatheringEventType < ApplicationRecord
  belongs_to :event
  belongs_to :event_type
end
