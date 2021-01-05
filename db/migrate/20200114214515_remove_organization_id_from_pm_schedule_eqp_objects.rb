class RemoveOrganizationIdFromPmScheduleEqpObjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :pm_schedule_eqp_objects, :organization_id
  end
end
