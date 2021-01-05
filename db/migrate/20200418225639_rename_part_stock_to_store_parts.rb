class RenamePartStockToStoreParts < ActiveRecord::Migration[6.0]
  def change
    rename_table :part_stocks, :store_parts
  end
end
