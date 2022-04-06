# frozen_string_literal: true

class AddEventTypeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :event_type, null: true, foreign_key: true, default: 1
  end
end
