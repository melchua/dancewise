# frozen_string_literal: true

class CreateEventFrequencies < ActiveRecord::Migration[6.1]
  def change
    create_table :event_frequencies do |t|
      t.string :name
      t.integer :event_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
