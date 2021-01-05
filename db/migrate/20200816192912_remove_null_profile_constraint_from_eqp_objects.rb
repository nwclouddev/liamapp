class RemoveNullProfileConstraintFromEqpObjects < ActiveRecord::Migration[6.0]
  def change
    change_column_null :eqp_objects, :eqp_profile_id, true
  end
end
