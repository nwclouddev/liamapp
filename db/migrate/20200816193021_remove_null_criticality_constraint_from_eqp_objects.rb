class RemoveNullCriticalityConstraintFromEqpObjects < ActiveRecord::Migration[6.0]
  def change
    change_column_null :eqp_objects, :eqp_object_criticality_id, true
  end
end
