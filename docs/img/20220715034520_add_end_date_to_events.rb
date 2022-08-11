class AddEndDateToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_end_date, :datetime
    rename_column :events, :event_date, :event_start_date
  end
end
