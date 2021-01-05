class AddNotUsedToEqpObjectClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :eqp_object_classes, :not_used, :boolean
  end
end
