class AddVideoLinksToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :video_links, :text, array: true, default: []
  end
end
