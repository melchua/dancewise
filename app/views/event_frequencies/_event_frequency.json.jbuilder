# frozen_string_literal: true

json.extract! event_frequency, :id, :name, :event_id, :created_at, :updated_at
json.url event_frequency_url(event_frequency, format: :json)
