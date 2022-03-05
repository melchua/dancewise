class AddEventTypeToEvents < ActiveRecord::Migration[6.1]
  def change
    t.references :event, null: false, foreign_key: true
  end
end
