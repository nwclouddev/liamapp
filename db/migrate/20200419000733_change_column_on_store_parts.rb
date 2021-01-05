class ChangeColumnOnStoreParts < ActiveRecord::Migration[6.0]
  def change
    change_column :store_parts, :quantity, :integer, default: 0
  end
end
