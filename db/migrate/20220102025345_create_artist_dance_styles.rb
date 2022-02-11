class CreateArtistDanceStyles < ActiveRecord::Migration[6.1]
    def change
      create_table :artist_dance_styles do |t|
        t.integer :artist_id
        t.integer :dance_style_id
  
        t.timestamps
      end
    end
  end