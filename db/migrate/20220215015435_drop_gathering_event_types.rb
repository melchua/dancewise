class DropGatheringEventTypes < ActiveRecord::Migration[6.1]
  def change
    drop_table :gathering_event_types
  end
end
