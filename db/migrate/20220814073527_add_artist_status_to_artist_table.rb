class AddArtistStatusToArtistTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :artists, :artist_status, null: true, foreign_key: true
  end
end
