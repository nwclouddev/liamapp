class AddQuantityToStoreParts < ActiveRecord::Migration[6.0]
  def change
    add_column :store_parts, :quantity, :integer
  end
end
