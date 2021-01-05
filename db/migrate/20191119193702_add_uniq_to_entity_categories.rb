class AddUniqToEntityCategories < ActiveRecord::Migration[6.0]
  def change
    add_index :eqp_object_categories, :code, :unique => true
  end
end
