class AddDescriptionToLaneTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :lane_types, :description, :string, null: false
  end
end
