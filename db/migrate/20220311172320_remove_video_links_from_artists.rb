class RemoveVideoLinksFromArtists < ActiveRecord::Migration[6.1]
  def change
    remove_column :artists, :video_links
  end
end
