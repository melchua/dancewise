class AddLatLngIndexToEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :events, [:latitude, :longitude]
  end
end
