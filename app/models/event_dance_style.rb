# frozen_string_literal: true

class EventDanceStyle < ApplicationRecord
  belongs_to :event
  belongs_to :dance_style
end
