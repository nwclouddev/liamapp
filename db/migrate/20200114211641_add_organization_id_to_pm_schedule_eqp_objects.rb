class AddOrganizationIdToPmScheduleEqpObjects < ActiveRecord::Migration[6.0]
  def change
    add_column :pm_schedule_eqp_objects, :organization_id, :integer
  end
end
