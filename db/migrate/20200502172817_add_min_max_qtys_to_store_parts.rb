class AddMinMaxQtysToStoreParts < ActiveRecord::Migration[6.0]
  def change
    add_column :store_parts, :min_qty, :integer
    add_column :store_parts, :max_qty, :integer
    add_column :store_parts, :stock_criticality_id, :integer
  end
end
