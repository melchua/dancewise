# frozen_string_literal: true

class AddEventDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_start_date, :datetime
    add_column :events, :event_end_date, :datetime
  end
end
