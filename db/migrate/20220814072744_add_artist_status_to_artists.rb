class AddArtistStatusToArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_status do |t|
      t.string :status
      t.references :event, null: false, foreign_key: true

      t.timestamps
  end
end
end
