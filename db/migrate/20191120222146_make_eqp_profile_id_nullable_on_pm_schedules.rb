class MakeEqpProfileIdNullableOnPmSchedules < ActiveRecord::Migration[6.0]
  def change
    change_column :pm_schedules, :eqp_profile_id, :integer, :null => true
  end
end
