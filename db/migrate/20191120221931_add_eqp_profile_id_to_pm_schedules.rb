class AddEqpProfileIdToPmSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :pm_schedules, :eqp_profile, null: false, foreign_key: true
  end
end
