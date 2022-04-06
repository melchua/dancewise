# frozen_string_literal: true

class EventChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:events, :event_frequency_id, false, default = 1)
  end
end
