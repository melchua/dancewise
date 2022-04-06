# frozen_string_literal: true

class RemoveEventFromEventFrequencies < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_frequencies, :event_id
  end
end
