# frozen_string_literal: true

class RemoveDanceTypeFromEvent < ActiveRecord::Migration[6.1]
  def up
    remove_column :events, :dance_type
  end
end
