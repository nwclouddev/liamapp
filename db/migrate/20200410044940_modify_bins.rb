class ModifyBins < ActiveRecord::Migration[6.0]
  def change
    remove_column :bins, :organization_id
    add_column :bins, :store_id, :integer
  end
end
