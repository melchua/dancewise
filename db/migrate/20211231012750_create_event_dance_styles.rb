class CreateEventDanceStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :event_dance_styles do |t|
      t.integer :dance_style_id
      t.integer :event_id
    end
  end
end
