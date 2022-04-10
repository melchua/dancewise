# frozen_string_literal: true

class AddVideoIdsToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :first_video_id, :string
    add_column :artists, :second_video_id, :string
    add_column :artists, :third_video_id, :string
  end
end
