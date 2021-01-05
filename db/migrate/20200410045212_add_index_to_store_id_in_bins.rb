class AddIndexToStoreIdInBins < ActiveRecord::Migration[6.0]
  def change
    add_index :bins, :store_id
  end
end
