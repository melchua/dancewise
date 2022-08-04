class ChangeEventMonthtoString < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :event_month, :string
end
end