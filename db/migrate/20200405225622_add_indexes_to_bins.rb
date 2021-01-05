class AddIndexesToBins < ActiveRecord::Migration[6.0]
  def change
    add_index :bins, [:code, :organization_id], unique: true
  end
end
