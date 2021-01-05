class AddSupplierToStoreParts < ActiveRecord::Migration[6.0]
  def change
    add_reference :store_parts, :supplier, null: true, foreign_key: true
  end
end
