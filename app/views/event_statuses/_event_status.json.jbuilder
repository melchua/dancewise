json.extract! event_status, :id, :status, :event_id, :created_at, :updated_at
json.url event_status_url(event_status, format: :json)
