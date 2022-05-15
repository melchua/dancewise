class AddCityStateCountryToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :country, :string
    add_column :events, :continent, :string
  end
end
