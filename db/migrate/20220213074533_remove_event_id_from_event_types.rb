class RemoveEventIdFromEventTypes < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_types, :event_id
  end
end
