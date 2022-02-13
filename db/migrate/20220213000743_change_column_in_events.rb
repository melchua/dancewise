class ChangeColumnInEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :event_type, :string, array: true, default: '{}'
  end
end
