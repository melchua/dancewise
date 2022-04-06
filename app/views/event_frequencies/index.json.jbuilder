# frozen_string_literal: true

json.array! @event_frequencies, partial: 'event_frequencies/event_frequency', as: :event_frequency
