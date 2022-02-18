class CreateGatheringEventType < ActiveRecord::Migration[6.1]
  def change
    create_table :gathering_event_types do |t|
      t.integer :event_id
      t.integer :event_type_id

      t.timestamps
    end
  end
end
