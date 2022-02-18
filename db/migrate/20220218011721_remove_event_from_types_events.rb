class RemoveEventFromTypesEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :event_type_id
  end
end
