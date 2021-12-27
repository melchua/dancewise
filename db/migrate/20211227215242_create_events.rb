class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :dance_type
      t.string :description
      t.string :image_url
      t.integer :user_id
      t.timestamps
    end
  end
end
