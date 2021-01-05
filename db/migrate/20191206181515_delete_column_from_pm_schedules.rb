class DeleteColumnFromPmSchedules < ActiveRecord::Migration[6.0]
  def change
    remove_column :pm_schedules, :period_uom
  end
end
