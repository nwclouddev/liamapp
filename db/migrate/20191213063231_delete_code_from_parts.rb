class DeleteCodeFromParts < ActiveRecord::Migration[6.0]
  def change
    remove_column :parts, :code
  end
end
