class AddNotUsedToEqpObjectCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :eqp_object_categories, :not_used, :boolean
  end
end
