# frozen_string_literal: true

class Event1ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:events, :event_frequency_id, true)
  end
end
