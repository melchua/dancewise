# frozen_string_literal: true

class CreateEventArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :event_artists do |t|
      t.integer :artist_id
      t.integer :event_id
    end
  end
end
