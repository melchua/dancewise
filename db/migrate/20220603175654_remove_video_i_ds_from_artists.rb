class RemoveVideoIDsFromArtists < ActiveRecord::Migration[6.1]
  def change
    remove_column :artists, :first_video_id
    remove_column :artists, :second_video_id
    remove_column :artists, :third_video_id
  end
end
