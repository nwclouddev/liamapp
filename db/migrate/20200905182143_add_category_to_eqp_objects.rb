class AddCategoryToEqpObjects < ActiveRecord::Migration[6.0]
  def change
    add_column :eqp_objects, :eqp_category, :string
  end
end
