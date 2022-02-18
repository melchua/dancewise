class RemoveEventTypesEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :event_type
  end
end
