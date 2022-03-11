class AddVideoUrlsToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :video_links, :text, array: true
  end
end
