# frozen_string_literal: true

class AddColumnToArtistInstructorDj < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :instructor, :boolean, default: false
    add_column :artists, :dj, :boolean, default: false
  end
end
