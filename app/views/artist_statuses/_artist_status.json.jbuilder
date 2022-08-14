json.extract! artist_status, :id, :status, :artist_id, :created_at, :updated_at
json.url artist_status_url(artist_status, format: :json)
