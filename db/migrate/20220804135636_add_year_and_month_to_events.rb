class AddYearAndMonthToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_month, :integer
    add_column :events, :event_year, :integer
  end
end
