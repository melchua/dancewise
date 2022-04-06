# frozen_string_literal: true

class AddEventFrequencyToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :event_frequency, null: true, foreign_key: true
  end
end
