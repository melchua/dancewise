class Event2ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:events, :event_frequency_id, false, default = 6)
  end
end
